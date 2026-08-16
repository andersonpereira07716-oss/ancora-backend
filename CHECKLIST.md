# ✅ Checklist: Publicar Âncora na Internet

## 📋 ANTES DE COMEÇAR

- [ ] Ler o arquivo `PASSO_A_PASSO.md` (instruções detalhadas)
- [ ] Ter uma conexão de internet estável
- [ ] Ter criado conta na Anthropic (https://www.anthropic.com)

---

## 🔑 ETAPA 1: Chave de API Claude

**Tempo: ~5 minutos**

- [ ] Acessar https://console.anthropic.com/
- [ ] Fazer login ou criar conta
- [ ] Ir em "API Keys"
- [ ] Clicar "Create Key"
- [ ] **Copiar a chave** (ex: `sk-ant-abc123...`)
- [ ] Guardar em local seguro (ex: Notepad)

> ⚠️ **Não compartilhe sua chave com ninguém!**

---

## ⚙️ ETAPA 2: Configurar Localmente

**Tempo: ~5 minutos**

- [ ] Abrir arquivo `.env` em VS Code
- [ ] Colar chave em: `CLAUDE_API_KEY=seu_valor`
- [ ] Salvar arquivo (Ctrl+S)
- [ ] Parar servidor (Ctrl+C)
- [ ] Reiniciar: `npm run dev`
- [ ] Testar se funciona (abrir navegador)

> ✅ **Seu app está funcionando localmente!**

---

## 🌐 ETAPA 3: Versionar no GitHub

**Tempo: ~10 minutos**

- [ ] Criar conta em https://github.com (se não tiver)
- [ ] Ir em https://github.com/new
- [ ] Criar repositório "ancora-backend"
- [ ] Deixar como "Public"
- [ ] Criar repositório
- [ ] Abrir terminal na pasta do projeto
- [ ] Executar comandos:
  ```powershell
  git init
  git add .
  git commit -m "Inicial: Ancora Backend"
  git branch -M main
  git remote add origin https://github.com/SEU_USUARIO/ancora-backend.git
  git push -u origin main
  ```

> ✅ **Seu código está no GitHub!**

---

## 🚀 ETAPA 4: Deploy na Vercel

**Tempo: ~15 minutos** (automático!)

- [ ] Ir em https://vercel.com
- [ ] Clicar "Sign Up"
- [ ] Escolher "Continue with GitHub"
- [ ] Autorizar Vercel
- [ ] Clicar "New Project"
- [ ] Selecionar "ancora-backend"
- [ ] Clicar "Import"
- [ ] Em "Environment Variables", adicionar:
  - [ ] `CLAUDE_API_KEY` = `sk-ant-seu-valor`
  - [ ] `PORT` = `3000`
- [ ] Clicar "Deploy"
- [ ] ⏳ Aguardar ~2 minutos
- [ ] Copiar URL do projeto (ex: `https://ancora-backend.vercel.app`)

> 🎉 **Seu app está ONLINE!**

---

## 🧪 ETAPA 5: Testar Online

**Tempo: ~2 minutos**

- [ ] Copiar URL da Vercel
- [ ] Abrir em novo navegador
- [ ] Digitar uma mensagem
- [ ] Verificar se a IA responde
- [ ] Testar diferentes emoções

> ✅ **Tudo funcionando!**

---

## 📱 ETAPA 6: Compartilhar

- [ ] Mandar URL para amigos/família
- [ ] Publicar em redes sociais
- [ ] Integrar em seu site
- [ ] Usar na produção

> 🌍 **Seu app está ajudando pessoas!**

---

## 🔄 Atualizar Depois (quando fizer mudanças)

Sempre que quiser atualizar:

```powershell
# Editar arquivo em VS Code
# Depois:

git add .
git commit -m "Descrição da mudança"
git push
```

> Vercel faz deploy automaticamente! ✨

---

## ❓ Precisa de Ajuda?

| Problema | Solução |
|----------|---------|
| "API Key inválida" | Gere nova em https://console.anthropic.com |
| "Git não encontrado" | Instale Git: https://git-scm.com/download/win |
| Não funciona localmente | Veja: `PASSO_A_PASSO.md` |
| Erro no Vercel | Veja: `DEPLOY.md` |

---

## 📚 Arquivos Importantes

| Arquivo | Para quê |
|---------|----------|
| `PASSO_A_PASSO.md` | Instruções detalhadas passo a passo |
| `DEPLOY.md` | Guia completo de deployment |
| `README.md` | Documentação do projeto |
| `REQUISICOES.md` | Exemplos de como usar a API |
| `.env` | Suas chaves (NUNCA fazer push!) |
| `.env.example` | Template (seguro fazer push) |

---

## 🎯 Resumo Final

✅ Você terá:
- Um app funcionando localmente
- Código versionado no GitHub
- App publicado na internet
- URL para compartilhar

📊 Custos:
- **Vercel:** GRÁTIS
- **GitHub:** GRÁTIS
- **Claude API:** Pago conforme uso (~$0.01 por mensagem)
- **Total mês:** ~$5-20 (dependendo de uso)

---

**Pronto para publicar? Comece pelo arquivo `PASSO_A_PASSO.md`! 🚀**
