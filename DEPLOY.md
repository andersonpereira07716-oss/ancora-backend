# 🚀 Guia Completo: Deploy do Âncora Backend na Internet

Este guia mostra como publicar seu aplicativo Âncora em diferentes plataformas.

---

## 📋 **Pré-requisitos**

1. ✅ Arquivo `.env` com `CLAUDE_API_KEY` válida
2. ✅ Conta no GitHub (para hospedar o código)
3. ✅ Conta na plataforma de deploy (Vercel, Heroku, etc)

---

## 🔑 **PASSO 1: Obter Chave da API Claude**

### Como conseguir:
1. Acesse: https://console.anthropic.com/
2. Faça login ou crie conta
3. Clique em **"API Keys"** na barra lateral
4. Clique em **"Create Key"**
5. Dê um nome (ex: "Ancora App")
6. Copie a chave gerada (começa com `sk-ant-...`)

### Configurar localmente:
1. Abra o arquivo `.env` no projeto
2. Substitua:
   ```
   CLAUDE_API_KEY=sua_chave_aqui
   ```
3. Salve o arquivo

### ⚠️ IMPORTANTE:
- **Nunca** compartilhe sua chave
- **Nunca** faça commit do `.env` (está no `.gitignore`)
- Gere nova chave se vazar

---

## 📁 **PASSO 2: Preparar Repositório no GitHub**

### 1. Criar repositório:
```bash
cd c:\Users\FAST\Desktop\ancora-backend
git init
git add .
git commit -m "Inicial: Ancora Backend"
```

### 2. Criar repositório no GitHub:
- Acesse: https://github.com/new
- Nome: `ancora-backend`
- Descrição: "Backend de apoio mental com Claude AI"
- Visibilidade: `Public` (para deploy grátis)
- Clique: "Create repository"

### 3. Conectar ao GitHub:
```bash
git remote add origin https://github.com/seu-usuario/ancora-backend.git
git branch -M main
git push -u origin main
```

---

## 🌐 **PASSO 3: Deploy (Escolha UMA opção)**

### **OPÇÃO A: Vercel** ⭐ (Recomendado - Mais fácil)

**Vantagens:**
- ✅ Grátis
- ✅ Deploy automático a cada push
- ✅ Interface visual
- ✅ SSL incluído

**Como fazer:**

1. Acesse: https://vercel.com
2. Clique: "Sign Up" → "Continue with GitHub"
3. Autorize o Vercel
4. Clique: "New Project"
5. Selecione: "ancora-backend"
6. Em "Environment Variables", adicione:
   - Nome: `CLAUDE_API_KEY`
   - Valor: `sua_chave_aqui` (copie do console.anthropic.com)
7. Clique: "Deploy"
8. **Pronto!** Seu app estará em: `https://seu-projeto.vercel.app`

---

### **OPÇÃO B: Heroku** 🟣 (Antes era grátis, agora pago)

**Custo:** ~$5-7/mês (dynos)

1. Acesse: https://dashboard.heroku.com/
2. Clique: "New" → "Create new app"
3. Nome: `ancora-backend-seu-nome`
4. Clique: "Create app"
5. Abra a aba: "Settings"
6. Em "Config Vars", clique: "Add"
   - KEY: `CLAUDE_API_KEY`
   - VALUE: `sua_chave_aqui`
7. Abra a aba: "Deploy"
8. Selecione: "GitHub"
9. Procure: "ancora-backend"
10. Clique: "Connect"
11. Clique: "Deploy Branch"
12. **Seu app estará em:** `https://ancora-backend-seu-nome.herokuapp.com`

---

### **OPÇÃO C: Railway** 🟡 (Fácil e Pago)

**Custo:** ~$5/mês (plano mínimo)

1. Acesse: https://railway.app
2. Clique: "Start Project"
3. Selecione: "GitHub Repo"
4. Selecione: "ancora-backend"
5. Clique: "Deploy"
6. Em "Variables", clique: "Add"
   - KEY: `CLAUDE_API_KEY`
   - VALUE: `sua_chave_aqui`
7. Aguarde o deploy terminar
8. Copie a URL gerada

---

### **OPÇÃO D: Render** 🟢 (Simples)

**Custo:** ~$7/mês

1. Acesse: https://render.com
2. Clique: "Get started"
3. Clique: "New +" → "Web Service"
4. Conecte seu GitHub
5. Selecione: "ancora-backend"
6. Configuração:
   - Environment: `Node`
   - Build Command: `npm install`
   - Start Command: `npm start`
7. Em "Environment", adicione:
   - `CLAUDE_API_KEY` = `sua_chave_aqui`
8. Clique: "Create Web Service"
9. Aguarde o deploy

---

## ✅ **PASSO 4: Testar seu App Online**

### Via cURL:
```bash
curl -X POST https://seu-app.vercel.app/api/chat \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"Oi!"}]}'
```

### Via Navegador (criar um teste):
```javascript
fetch('https://seu-app.vercel.app/api/chat', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    messages: [{ role: 'user', content: 'Teste!' }]
  })
})
  .then(res => res.json())
  .then(data => console.log(data.resposta));
```

---

## 🔧 **Variáveis de Ambiente**

Todas as plataformas precisam dessas variáveis:

| Variável | Valor | Onde conseguir |
|----------|-------|----------------|
| `CLAUDE_API_KEY` | sua_chave | https://console.anthropic.com/ |
| `PORT` | 3000 | (opcional, automático) |
| `NODE_ENV` | production | (automático) |

---

## 📊 **Comparação de Plataformas**

| Plataforma | Custo | Facilidade | SSL | Auto-Deploy |
|-----------|-------|-----------|-----|------------|
| **Vercel** | Grátis | ⭐⭐⭐⭐⭐ | ✅ | ✅ |
| **Railway** | ~$7 | ⭐⭐⭐⭐ | ✅ | ✅ |
| **Render** | ~$7 | ⭐⭐⭐⭐ | ✅ | ✅ |
| **Heroku** | ~$5 | ⭐⭐⭐ | ✅ | ✅ |
| **AWS** | Variável | ⭐⭐ | ⚠️ | ❌ |

**Recomendação:** Comece com **Vercel** (mais fácil e grátis)

---

## 🚨 **Troubleshooting**

### "API Key is invalid"
- Copie novamente a chave de console.anthropic.com
- Certifique-se de colar sem espaços

### "Connection refused"
- Aguarde alguns minutos após o deploy
- Recarregue a página

### "CORS error"
- Verifique se o `.env` tem as variáveis corretas
- Reinicie o servidor

---

## 🔐 **Segurança**

✅ **Faça:**
- Gere chaves periodicamente
- Use variáveis de ambiente
- Mantenha `.env` local apenas

❌ **Não faça:**
- Compartilhe chaves
- Commite `.env` no GitHub
- Publique chaves em logs

---

## 📞 **Suporte**

Se tiver dúvidas:
- Vercel: https://vercel.com/support
- Railway: https://docs.railway.app/
- Heroku: https://devcenter.heroku.com/

---

**Pronto para publicar! 🚀**
