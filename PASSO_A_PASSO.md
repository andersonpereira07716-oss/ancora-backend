# 📋 PASSO A PASSO: Como Publicar Seu Âncora na Internet

## 🎯 Objetivo Final
Seu aplicativo Âncora funcionando online, acessível de qualquer lugar!

---

## ✅ ETAPA 1: Obter Chave de API Claude (5 minutos)

### Passo 1.1: Acessar Console Anthropic
1. Abra: https://console.anthropic.com/
2. Clique em "Sign Up" se não tiver conta
3. Complete o registro

### Passo 1.2: Gerar Chave
1. Na lateral esquerda, clique em "**API Keys**"
2. Clique em "**Create Key**"
3. Dê um nome: "Ancora App"
4. **Copie a chave** (começa com `sk-ant-`)
5. ⚠️ **Guarde bem! Não compartilhe!**

### Passo 1.3: Guardar em Local Seguro
- Copie a chave em um bloco de notas (pode ser Notepad mesmo)
- Você vai usar ela no próximo passo

---

## ✅ ETAPA 2: Configurar Localmente (5 minutos)

### Passo 2.1: Abrir o arquivo .env
1. Abra VS Code
2. Abra a pasta: `c:\Users\FAST\Desktop\ancora-backend`
3. Procure pelo arquivo `.env` (pode ser que precise mostrar arquivos ocultos)
4. Abra o arquivo

### Passo 2.2: Colar a Chave
Substitua:
```
CLAUDE_API_KEY=
```

Por:
```
CLAUDE_API_KEY=sk-ant-sua_chave_aqui
```

**Exemplo real:**
```
CLAUDE_API_KEY=sk-ant-api03-abc123def456xyz789
```

### Passo 2.3: Salvar e Testar
1. Salve o arquivo (Ctrl+S)
2. Reinicie o servidor (pare com Ctrl+C e rode `npm run dev`)
3. Teste no navegador se está funcionando

---

## ✅ ETAPA 3: Colocar no GitHub (10 minutos)

### Passo 3.1: Criar Conta GitHub
1. Acesse: https://github.com/signup
2. Complete o registro

### Passo 3.2: Criar Repositório
1. Acesse: https://github.com/new
2. Nome: `ancora-backend`
3. Descrição: "App de apoio mental com Claude AI"
4. Deixe **Public**
5. Clique: "Create repository"

### Passo 3.3: Enviar Código (via Terminal)
Abra PowerShell na pasta `c:\Users\FAST\Desktop\ancora-backend`:

```powershell
git init
git add .
git commit -m "Ainda: Ancora Backend"
git branch -M main
git remote add origin https://github.com/seu-usuario/ancora-backend.git
git push -u origin main
```

**Pronto!** Seu código está no GitHub.

---

## ✅ ETAPA 4: Deploy na Internet (15 minutos)

### 🟢 Recomendado: Vercel

#### Passo 4.1: Entrar na Vercel
1. Acesse: https://vercel.com
2. Clique: "Sign Up"
3. Clique: "Continue with GitHub"
4. Autorize

#### Passo 4.2: Criar Novo Projeto
1. Clique: "New Project"
2. Procure: "ancora-backend"
3. Clique: "Import"

#### Passo 4.3: Configurar Variáveis
1. Na aba "Environment Variables":
2. Clique: "Add"
   - Nome: `CLAUDE_API_KEY`
   - Valor: `sk-ant-sua_chave_aqui` (a mesma do passo 2)
3. Clique: "Add"
   - Nome: `PORT`
   - Valor: `3000`

#### Passo 4.4: Fazer Deploy
1. Clique: "Deploy"
2. Aguarde (leva ~2 minutos)
3. **Quando terminar, você terá uma URL!**

**Exemplo de URL:**
```
https://ancora-backend.vercel.app
```

---

## 🎉 Pronto! Seu App Está Online!

### Testar:
1. Copie a URL da Vercel
2. Cole no navegador
3. Seu app deve aparecer! 🌊

### Compartilhar:
- Mande a URL para amigos
- Coloque em redes sociais
- Use na sua aplicação

---

## 🔄 Próximas Atualizações

**Quando fizer mudanças no código:**
1. Edite em VS Code
2. Salve
3. No terminal:
   ```powershell
   git add .
   git commit -m "Descrição da mudança"
   git push
   ```
4. **Vercel atualiza automaticamente!** ✨

---

## ❓ Dúvidas Comuns

**P: Onde copio a chave de API?**
R: Em https://console.anthropic.com/ → "API Keys" → "Create Key"

**P: Posso usar a chave em vários lugares?**
R: Sim, mas é mais seguro ter chaves diferentes para cada app

**P: E se eu perder a chave?**
R: Gere uma nova em console.anthropic.com e atualize na Vercel

**P: O app é grátis?**
R: Vercel é grátis, mas Claude API tem custo. Depende de uso.

**P: Posso mudar de plataforma depois?**
R: Sim! O código funciona em qualquer lugar.

---

## 📞 Precisa de Ajuda?

- **Vercel:** https://vercel.com/support
- **GitHub:** https://docs.github.com/
- **Claude API:** https://docs.anthropic.com/

---

**Parabéns! Você publicou um app real na internet! 🚀**
