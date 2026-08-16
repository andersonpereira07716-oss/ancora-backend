require('dotenv').config();
const express = require('express');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
const Anthropic = require('@anthropic-ai/sdk');
const { SYSTEM_PROMPT } = require('./prompts');

const app = express();
const PORT = process.env.PORT || 3000;

// Rate limiting: protege contra muitas requisições
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 50,
  message: { erro: 'Muitas requisições. Tente novamente mais tarde.' }
});

// CORS: permite que seu frontend acesse o backend
app.use(cors({
  origin: process.env.NODE_ENV === 'production'
    ? 'https://seu-frontend.vercel.app' // ← substitua pelo seu domínio depois
    : '*' // em desenvolvimento, permite qualquer origem (file://, localhost, etc)
}));
app.use(express.json({ limit: '10kb' }));
app.use('/api/chat', limiter);

// Inicializa o cliente Claude (se a chave existir)
let anthropic = null;
if (process.env.CLAUDE_API_KEY && process.env.CLAUDE_API_KEY !== 'sua_chave_aqui') {
  anthropic = new Anthropic({
    apiKey: process.env.CLAUDE_API_KEY,
  });
  console.log('✅ Claude API configurada.');
} else {
  console.log('⚠️ Modo DEMO ativado (sem chave da API).');
}

// ------------------ DETECÇÃO DE RISCO ------------------
function detectarRisco(mensagem) {
  const termos = [
    'suicídio', 'suicida', 'me matar', 'morte', 'morrer', 'quero morrer',
    'autolesão', 'cortar', 'cortando', 'machucar', 'machucando', 'se machucar',
    'desaparecer', 'sumir', 'não aguento mais', 'vou acabar com tudo',
    'acabar com a minha vida', 'prefiro morrer', 'não quero viver',
    'quero me cortar', 'vou me machucar', 'quero sumir'
  ];
  const texto = mensagem.toLowerCase();
  return termos.some(termo => texto.includes(termo));
}

function respostaRisco() {
  return {
    resposta: `Percebo que você está compartilhando algo muito difícil. Sua segurança é a prioridade agora. 
Por favor, não fique sozinho com esse pensamento. Ligue para o **CVV (188)** – é gratuito, funciona 24h, e você pode conversar com alguém que vai ouvir sem julgamento. 
Se preferir, procure um serviço de emergência ou uma pessoa de confiança. Você não precisa passar por isso sozinho. 💙`
  };
}

// ------------------ RESPOSTA DEMO (fallback) ------------------
function respostaDemo(mensagem) {
  const t = mensagem.toLowerCase();
  if (/triste|ansioso|ansiosa|preocupado|preocupada/.test(t)) {
    return 'Entendo. Vamos dar um passo pequeno: respire fundo contando até 4, segure por 4 e solte por 6. Repita 3 vezes. Depois, me diga como se sente.';
  }
  if (/medo|assustado|assustada/.test(t)) {
    return 'O medo é uma reação do corpo. Tente olhar ao redor e nomeie 5 coisas que você vê, 4 que você toca, 3 que você ouve. Isso traz a mente para o presente.';
  }
  return 'Obrigado por compartilhar. Que tal fazer uma pausa? Vá até a janela e observe algo lá fora por 1 minuto. Depois voltamos.';
}

// ------------------ ENDPOINT PRINCIPAL ------------------
app.post('/api/chat', async (req, res) => {
  try {
    const { messages } = req.body;

    // Validação básica
    if (!messages || !Array.isArray(messages) || messages.length === 0) {
      return res.status(400).json({ erro: 'Mensagem inválida.' });
    }
    const ultima = messages[messages.length - 1];
    if (!ultima || typeof ultima.content !== 'string') {
      return res.status(400).json({ erro: 'Formato inválido.' });
    }
    const textoUsuario = ultima.content.trim();
    if (textoUsuario.length > 2000) {
      return res.status(400).json({ erro: 'Mensagem muito longa.' });
    }

    // SEGURANÇA: detecta risco antes de chamar a IA
    if (detectarRisco(textoUsuario)) {
      return res.json(respostaRisco());
    }

    // Se NÃO tiver chave da API ou estiver em modo demo, usa respostas pré-definidas
    if (!anthropic) {
      await new Promise(resolve => setTimeout(resolve, 500)); // simula delay
      return res.json({ resposta: respostaDemo(textoUsuario) });
    }

    // Prepara histórico para o Claude (últimas 10 mensagens)
    const historico = messages.slice(-10).map(msg => ({
      role: msg.role === 'user' ? 'user' : 'assistant',
      content: msg.content
    }));

    // Chama a Claude
    const response = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307',
      max_tokens: 400,
      system: SYSTEM_PROMPT,
      messages: historico,
    });

    let resposta = response.content[0].text;

    // Garante que a resposta tenha no máximo 5 frases (segurança extra)
    const frases = resposta.split(/[.!?]+/).filter(f => f.trim().length > 0);
    if (frases.length > 5) {
      resposta = frases.slice(0, 5).join('. ') + '.';
    }

    res.json({ resposta });

  } catch (error) {
    console.error('Erro no backend:', error);
    if (error.status === 429) {
      return res.status(429).json({ erro: 'Limite da API atingido. Tente novamente.' });
    }
    res.status(500).json({ erro: 'Erro interno. Tente novamente.' });
  }
});

// Rota de saúde (para monitoramento)
app.get('/health', (req, res) => res.status(200).json({ status: 'ok' }));

// Inicia o servidor
app.listen(PORT, () => {
  console.log(`🚀 Âncora backend rodando na porta ${PORT}`);
  if (!anthropic) console.log('💡 Modo DEMO ativo – use respostas pré-definidas.');
});