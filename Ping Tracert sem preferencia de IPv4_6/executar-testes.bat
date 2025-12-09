@echo off
chcp 65001 >nul
title Executando Testes Reais de Rede
color 0A
mode con: cols=100 lines=40

echo.
echo ====================================================
echo       EXECUTANDO TESTES REAIS DE REDE
echo SCRIPT LICENCIADO DE WANDERLEI NEVES JUNIOR
echo ====================================================
echo.
echo Este script executara comandos reais do Windows e com certeza vai demorar uns 3 minutos para executar:
echo • ping para medir latencia
echo • tracert para ver rotas
echo.
echo OS DADOS SERAO REAIS DO SEU COMPUTADOR!
echo.

:: Verificar se esta executando como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [AVISO] Execute como Administrador para melhores resultados
    echo.
)

:: Lista de sites para teste
set SITES=uol.com.br fast.com globo.com youtube.com google.com gov.br cloudflare.com github.com

:: Criar arquivo de resultados
set "RESULT_FILE=resultados.txt"
echo RESULTADOS DE TESTES DE REDE > "%RESULT_FILE%"
echo ============================== >> "%RESULT_FILE%"
echo Data: %date% %time% >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

set COUNTER=1
for %%S in (%SITES%) do (
    echo.
    echo [%COUNTER%/7] TESTANDO: %%S
    echo ======================================== >> "%RESULT_FILE%"
    echo TESTANDO: %%S >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    :: Executar PING (4 pacotes)
    echo Executando PING para %%S...
    echo [PING] >> "%RESULT_FILE%"
    ping -n 4 %%S >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    :: Executar TRACERT (30 saltos maximo)
    echo Executando TRACERT para %%S...
    echo [TRACERT] >> "%RESULT_FILE%"
    tracert -h 30 -w 1000 %%S >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    set /a COUNTER=COUNTER+1
    
    :: Pequena pausa entre testes
    timeout /t 1 /nobreak >nul
)

echo.
echo ====================================================
echo TESTES CONCLUIDOS!
echo.
echo Resultados salvos em: %RESULT_FILE%
echo.
echo.
echo Pressione qualquer tecla para abrir o arquivo...
pause >nul

:: Mostrar resultados
notepad "%RESULT_FILE%"

echo.
echo ====================================================
echo Para executar novamente, rode este script de novo.
echo.
pause
