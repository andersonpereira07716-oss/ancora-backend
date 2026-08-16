@echo off
REM Script para instalar Git - execute como ADMINISTRADOR
REM Clique com direito neste arquivo e escolha "Run as Administrator"

echo.
echo ========================================
echo   Instalando Git para Windows...
echo ========================================
echo.

REM Tenta instalar Git via winget com parametros de instalacao silenciosa
winget install --id Git.Git --exact --accept-source-agreements --accept-package-agreements

echo.
echo ========================================
echo   Verificando instalacao...
echo ========================================
echo.

REM Verifica se funcionou
git --version

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [OK] Git instalado com sucesso!
    echo.
    pause
    REM Agora executa o script de deploy
    cd /d "c:\Users\FAST\Desktop\ancora-backend"
    powershell -ExecutionPolicy Bypass -File "DEPLOY.ps1"
) else (
    echo.
    echo [ERRO] Falha na instalacao do Git
    echo Tente novamente ou instale manualmente: https://git-scm.com/download/win
    echo.
    pause
)
