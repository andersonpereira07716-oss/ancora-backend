# Script de Deploy - Ancora Backend
# Este eh o script para fazer push no GitHub

$env:PATH += ";C:\Program Files\Git\bin"

Write-Host "`n====== DEPLOY SCRIPT - ANCORA BACKEND ======`n" -ForegroundColor Cyan

# Verificar Git
Write-Host "[1] Verificando Git..." -ForegroundColor Yellow
$gitVersion = git --version
if ($?) {
    Write-Host "[OK] Git encontrado: $gitVersion" -ForegroundColor Green
} else {
    Write-Host "[ERRO] Git nao encontrado!" -ForegroundColor Red
    exit 1
}

# Verificar repositorio
Write-Host "`n[2] Verificando repositorio Git..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "[OK] Repositorio inicializado" -ForegroundColor Green
} else {
    Write-Host "[ERRO] Repositorio nao encontrado" -ForegroundColor Red
    exit 1
}

# Pedir usuario GitHub
Write-Host "`n[3] Configurando GitHub..." -ForegroundColor Yellow
$user = Read-Host "Digite seu usuario GitHub"

if ([string]::IsNullOrEmpty($user)) {
    Write-Host "[ERRO] Usuario nao pode estar vazio" -ForegroundColor Red
    exit 1
}

$repoUrl = "https://github.com/$user/ancora-backend.git"
Write-Host "[OK] URL: $repoUrl" -ForegroundColor Green

# Configurar branch
Write-Host "`n[4] Configurando branch..." -ForegroundColor Yellow
git branch -M main
Write-Host "[OK] Branch 'main' configurado" -ForegroundColor Green

# Adicionar remote
Write-Host "`n[5] Adicionando origem remota..." -ForegroundColor Yellow
git remote add origin $repoUrl
Write-Host "[OK] Origem remota adicionada" -ForegroundColor Green

# Fazer push
Write-Host "`n[6] Fazendo push..." -ForegroundColor Yellow
Write-Host "    Digite sua senha GitHub quando pedir" -ForegroundColor Cyan
git push -u origin main

if ($?) {
    Write-Host "`n==== SUCESSO! ====" -ForegroundColor Green
    Write-Host "`nProximos passos:`n" -ForegroundColor Cyan
    Write-Host "1. Acesse: https://vercel.com" -ForegroundColor White
    Write-Host "2. Sign Up -> Continue with GitHub" -ForegroundColor White
    Write-Host "3. Clique: New Project" -ForegroundColor White
    Write-Host "4. Selecione: ancora-backend" -ForegroundColor White
    Write-Host "5. Clique: Deploy`n" -ForegroundColor White
    Write-Host "Seu app estara online em ~2 minutos!" -ForegroundColor Green
} else {
    Write-Host "`n==== ERRO ====" -ForegroundColor Red
    Write-Host "Algo deu errado ao fazer push" -ForegroundColor Red
}

Write-Host "`nPressione ENTER para sair..." -ForegroundColor Yellow
Read-Host
