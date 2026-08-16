# 🚀 Exemplos de Requisições para Âncora Backend

## 1️⃣ Teste de Saúde (Health Check)

### cURL
```bash
curl http://localhost:3000/health
```

### JavaScript (fetch)
```javascript
fetch('http://localhost:3000/health')
  .then(res => res.json())
  .then(data => console.log(data));
```

### Resposta Esperada
```json
{
  "status": "ok"
}
```

---

## 2️⃣ Primeira Mensagem (Simples)

### cURL
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "Oi, como você está?"
      }
    ]
  }'
```

### JavaScript (fetch)
```javascript
fetch('http://localhost:3000/api/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    messages: [
      { role: 'user', content: 'Oi, como você está?' }
    ]
  })
})
  .then(res => res.json())
  .then(data => console.log(data.resposta));
```

### Resposta Esperada
```json
{
  "resposta": "Olá! Tudo bem com você? Como posso ajudar?"
}
```

---

## 3️⃣ Conversa com Histórico (Múltiplas Mensagens)

### cURL
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "Estou me sentindo triste"
      },
      {
        "role": "assistant",
        "content": "Lamento ouvir isso. Quer conversar sobre o que está acontecendo?"
      },
      {
        "role": "user",
        "content": "Sim, estou com medo do futuro"
      }
    ]
  }'
```

### JavaScript (fetch)
```javascript
const messages = [
  { role: 'user', content: 'Estou me sentindo triste' },
  { role: 'assistant', content: 'Lamento ouvir isso. Quer conversar sobre o que está acontecendo?' },
  { role: 'user', content: 'Sim, estou com medo do futuro' }
];

fetch('http://localhost:3000/api/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ messages })
})
  .then(res => res.json())
  .then(data => console.log(data.resposta));
```

---

## 4️⃣ Teste de Detecção de Risco

### cURL
```bash
curl -X POST http://localhost:3000/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {
        "role": "user",
        "content": "Estou pensando em suicídio"
      }
    ]
  }'
```

### JavaScript (fetch)
```javascript
fetch('http://localhost:3000/api/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    messages: [{ role: 'user', content: 'Estou pensando em suicídio' }]
  })
})
  .then(res => res.json())
  .then(data => console.log(data.resposta));
```

### Resposta Esperada (Segurança)
```json
{
  "resposta": "Percebo que você está compartilhando algo muito difícil. Sua segurança é a prioridade agora. Por favor, não fique sozinho com esse pensamento. Ligue para o CVV (188)..."
}
```

---

## 5️⃣ Modo DEMO (sem API Key)

Se não tiver a chave da API configurada, o servidor responde com respostas pré-definidas:

### Detector de Emoção
- **Triste/Ansioso**: Técnica de respiração
- **Medo**: Técnica de mindfulness (5-4-3)
- **Qualquer outro**: Sugestão de pausa

---

## 📊 Estrutura de Requisição

```json
{
  "messages": [
    {
      "role": "user" | "assistant",
      "content": "texto da mensagem (máximo 2000 caracteres)"
    }
  ]
}
```

### Validações
- ✅ `messages` é obrigatório
- ✅ Máximo 2000 caracteres por mensagem
- ✅ Máximo 10 mensagens no histórico (automaticamente)
- ✅ Rate limit: 50 requisições a cada 15 minutos

---

## 🧪 Teste Rápido em Python

```python
import requests
import json

url = "http://localhost:3000/api/chat"
headers = {"Content-Type": "application/json"}

data = {
    "messages": [
        {"role": "user", "content": "Como você pode me ajudar?"}
    ]
}

response = requests.post(url, json=data, headers=headers)
print(response.json())
```

---

## 🧪 Teste Rápido em Node.js

```javascript
const http = require('http');

const data = JSON.stringify({
  messages: [
    { role: 'user', content: 'Como você pode me ajudar?' }
  ]
});

const options = {
  hostname: 'localhost',
  port: 3000,
  path: '/api/chat',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': data.length
  }
};

const req = http.request(options, (res) => {
  let responseData = '';
  res.on('data', (chunk) => { responseData += chunk; });
  res.on('end', () => console.log(JSON.parse(responseData)));
});

req.on('error', (error) => console.error(error));
req.write(data);
req.end();
```

---

## ⚠️ Erros Comuns

| Erro | Causa | Solução |
|------|-------|---------|
| `erro: "Mensagem inválida"` | `messages` não é array ou vazio | Verifique a estrutura JSON |
| `erro: "Muitas requisições"` | Limite de 50 req/15min | Aguarde antes de enviar mais |
| `erro: "Mensagem muito longa"` | > 2000 caracteres | Divida em mensagens menores |
| `erro: "Formato inválido"` | `content` não é string | Certifique-se de usar strings |

---

**🎯 Endpoints Disponíveis:**
- `GET /health` → Verificar status
- `POST /api/chat` → Enviar mensagem para a IA

**🔒 Segurança:**
- CORS configurado apenas para localhost:3001 (alterar em .env)
- Rate limiting ativo
- Detecção automática de riscos
