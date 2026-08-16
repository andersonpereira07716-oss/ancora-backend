# 🌊 Âncora - Backend

Um backend seguro de apoio emocional alimentado por Claude AI.

## 📋 Sobre

Âncora é um assistente de apoio para pessoas com ansiedade e dificuldades emocionais. Oferece:

- ✅ Conversas empáticas e seguras
- ✅ Detecção de situações de risco
- ✅ Técnicas práticas de bem-estar
- ✅ Limite de taxa para proteção
- ✅ CORS seguro

## 🚀 Quick Start

### Instalação
```bash
npm install
```

### Configuração
Crie um arquivo `.env`:
```
CLAUDE_API_KEY=sua_chave_aqui
PORT=3000
```

Obtenha sua chave em: https://console.anthropic.com/

### Executar
```bash
npm run dev
```

O servidor estará em: `http://localhost:3000`

## 📚 API

### Health Check
```bash
GET /health
```

### Chat
```bash
POST /api/chat
Content-Type: application/json

{
  "messages": [
    {
      "role": "user",
      "content": "Como você pode me ajudar?"
    }
  ]
}
```

## 🔒 Segurança

- **Rate Limiting:** 50 requisições/15 minutos
- **Detecção de Risco:** Monitora palavras-chave perigosas
- **CORS:** Configurável por ambiente
- **Limite de Tamanho:** Máximo 2000 caracteres por mensagem
- **Histórico:** Mantém últimas 10 mensagens

## 📁 Estrutura

```
ancora-backend/
├── server.js           # Servidor principal
├── prompts.js          # Prompts do sistema
├── package.json        # Dependências
├── .env                # Variáveis de ambiente
├── DEPLOY.md           # Guia de deployment
├── REQUISICOES.md      # Exemplos de requisições
└── teste-api.html      # Cliente de teste
```

## 🌐 Deploy

Veja [DEPLOY.md](DEPLOY.md) para instruções completas.

Plataformas suportadas:
- Vercel (recomendado)
- Heroku
- Railway
- Render
- AWS, Google Cloud, etc

## 👥 Endpoints

| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/health` | Verificar status |
| POST | `/api/chat` | Enviar mensagem |

## 📞 Suporte

Para dúvidas ou problemas:
1. Consulte [REQUISICOES.md](REQUISICOES.md)
2. Veja [DEPLOY.md](DEPLOY.md)
3. Verifique os logs do servidor

## ⚠️ Aviso Importante

Âncora é um assistente de apoio, **não substitui terapia profissional**.

Se você ou alguém que conhece está em risco:
- 🆘 **CVV (Brasil):** 188 (24h, gratuito)
- 🆘 **Europa:** Consulte recursos locais
- 🆘 **EUA:** 988 (Suicide & Crisis Lifeline)

## 📝 Licença

MIT

## 👨‍💻 Desenvolvido com

- Node.js
- Express.js
- Claude AI (Anthropic)
- CORS
- Rate Limit

---

**Cuide-se bem! 💙**
