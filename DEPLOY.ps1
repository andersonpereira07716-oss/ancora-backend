#!/usr/bin/env powershell
# Script de Deploy Automático - Âncora Backend
# Este script faz: Git + GitHub + Vercel

Write-Host "
╔════════════════════════════════════════════════════════╗
║   SCRIPT DE DEPLOY AUTOMATICO - ANCORA BACKEND        ║
║   Este script vai publicar seu app na internet!       ║
╚════════════════════════════════════════════════════════╝
" -ForegroundColor Cyan

# PASSO 1: Verificar Git
Write-Host "`n[PASSO 1] Verificando Git..." -ForegroundColor Yellow
$gitVersion = git --version 2>$null
if ($null -eq $gitVersion) {
    Write-Host "❌ Git não está instalado!" -ForegroundColor Red
    Write-Host "
📥 Instale Git em: https://git-scm.com/download/win
Depois execute este script novamente.
" -ForegroundColor Cyan
    exit 1
}
Write-Host "✅ Git encontrado: $gitVersion" -ForegroundColor Green

# PASSO 2: Inicializar Git
Write-Host "`n[PASSO 2] Inicializando repositório Git..." -ForegroundColor Yellow
cd "c:\Users\FAST\Desktop\ancora-backend"
git init
git config user.email "ainda@local.dev"
git config user.name "Ancora Developer"
Write-Host "✅ Git inicializado" -ForegroundColor Green

# PASSO 3: Fazer commits
Write-Host "`n[PASSO 3] Fazendo primeiro commit..." -ForegroundColor Yellow
git add .
git commit -m "🚀 Inicial: Ancora Backend - App de Apoio Emocional com Claude AI"
Write-Host "✅ Commit feito" -ForegroundColor Green

# PASSO 4: Informar próximos passos
Write-Host "
╔════════════════════════════════════════════════════════╗
║              ✅ GIT PRONTO PARA FAZER PUSH!           ║
╚════════════════════════════════════════════════════════╝

📝 PRÓXIMOS PASSOS (MANUAIS - mas bem fácil!):

1️⃣ CRIAR NO GITHUB:
   • Acesse: https://github.com/new
   • Nome: 'ancora-backend'
   • Clique: 'Create repository'

2️⃣ CONECTAR E FAZER PUSH (copie e execute):
" -ForegroundColor Cyan

Write-Host "
   git branch -M main
   git remote add origin https://github.com/SEU_USUARIO/ancora-backend.git
   git push -u origin main
" -ForegroundColor White

Write-Host "
3️⃣ DEPLOY NA VERCEL:
   • Acesse: https://vercel.com
   • Clique: 'Sign Up' → 'Continue with GitHub'
   • Clique: 'New Project' 
   • Selecione: 'ancora-backend'
   • Adicione variável: CLAUDE_API_KEY (deixe vazio)
   • Clique: 'Deploy'

4️⃣ PRONTO! Seu app estará online em ~2 minutos ✨

" -ForegroundColor Green

Write-Host "
Precisa de ajuda? Leia os arquivos:
  • PASSO_A_PASSO.md - Instruções detalhadas
  • CHECKLIST.md - Checklist visual
  • DEPLOY.md - Guia completo
" -ForegroundColor Yellow

Write-Host "
💡 Dica: Quando terminar os passos acima, seu app estará em:
   https://ancora-backend.vercel.app (ou similar)

🌊 Pronto para ajudar pessoas! Boa sorte! 💙
" -ForegroundColor Cyan
