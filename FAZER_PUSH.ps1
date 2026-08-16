# Script para fazer push do código para GitHub
# Use este script APÓS criar o repositório em https://github.com/new

$env:PATH += ";C:\Program Files\Git\bin"

Write-Host "
╔════════════════════════════════════════════════════════╗
║          🚀 PUSH PARA GITHUB - AINDA BACKEND          ║
╚════════════════════════════════════════════════════════╝
" -ForegroundColor Cyan

# Pedir usuário do GitHub
$githubUser = Read-Host "Digite seu usuário GitHub"

if ([string]::IsNullOrEmpty($githubUser)) {
    Write-Host "❌ Usuário GitHub não pode estar vazio!" -ForegroundColor Red
    exit 1
}

$repoUrl = "https://github.com/$githubUser/ancora-backend.git"

Write-Host "`n📝 URL do repositório: $repoUrl" -ForegroundColor Yellow
Write-Host "Confirma? (S/n): " -NoNewline
$confirm = Read-Host

if ($confirm -eq "n" -or $confirm -eq "N") {
    Write-Host "❌ Cancelado." -ForegroundColor Red
    exit 1
}

cd "c:\Users\FAST\Desktop\ancora-backend"

Write-Host "`n🔄 Configurando branch..." -ForegroundColor Yellow
git branch -M main

Write-Host "🔗 Adicionando origem remota..." -ForegroundColor Yellow
git remote add origin $repoUrl

Write-Host "📤 Fazendo push para GitHub..." -ForegroundColor Yellow
Write-Host "(Você pode precisar digitar sua senha GitHub)" -ForegroundColor Cyan
git push -u origin main

if ($?) {
    Write-Host "
✅ Sucesso! Seu código foi enviado para GitHub!

Proximas etapas:
1. Acesse: https://vercel.com
2. Faça login com GitHub
3. Clique em 'New Project'
4. Selecione 'ancora-backend'
5. Clique 'Deploy'

Seu app estará online em ~2 minutos! 🎉
" -ForegroundColor Green
} else {
    Write-Host "❌ Erro ao fazer push." -ForegroundColor Red
    Write-Host "Verifique se:" -ForegroundColor Yellow
    Write-Host "  • O repositório foi criado em GitHub" -ForegroundColor Yellow
    Write-Host "  • Seu usuário está correto" -ForegroundColor Yellow
    Write-Host "  • Você tem acesso à internet" -ForegroundColor Yellow
}

Read-Host "Pressione ENTER para sair"
