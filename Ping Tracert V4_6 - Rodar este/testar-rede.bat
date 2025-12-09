::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJG6N+kY/Pwhofx2RKG63Vecg5u3v7O+JtkgPGuYzdO8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCxVQgCHLme/D4k47fvw++WXnnk4Z9YeSs/p/5CrHM0c7kDoetYL33RblPc8BRVfPia5bwwxu3oCgDC6YYfR8z3uTkmbpk4jD2BIs2bDmC57ZNYoqMYH1mDzvHr+kaEVw3T6V+kgEHXk0uxCLccJ8hj6bVHN+g==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
title Testes de Rede - Wanderlei Neves Junior
color 0A
mode con: cols=100 lines=30

echo.
echo ================================================================
echo                      TESTE COMPLETO DE REDE
echo                    POR WANDERLEI NEVES JUNIOR
echo        Chave PIX: 698a8cd3-5418-48aa-94ca-b4adc124ada0
echo ================================================================
echo uol.com.br fast.com globo.com youtube.com gov.br cloudflare.com
echo ================================================================
echo.

:: Verificar IPv6
echo Verificando configuracao IPv6...
ipconfig | findstr /i "IPv6" >nul
if %errorLevel% equ 0 (
    set IPV6_ENABLED=1
    echo [OK] IPv6 detectado
) else (
    set IPV6_ENABLED=0
    echo [INFO] IPv6 nao detectado
)

:: Nome do arquivo de resultados
set "RESULT_FILE=resultados_%date:~-10,2%-%date:~-7,2%-%date:~-4%_%time:~0,2%-%time:~3,2%.txt"
set "RESULT_FILE=%RESULT_FILE: =0%"

echo.
echo Criando arquivo: %RESULT_FILE%
echo.

:: ========================================================================================
:: 1. CABEÇALHO
:: ========================================================================================
echo TESTES DE REDE - %date% %time% > "%RESULT_FILE%"
echo Considere fazer um pix para ajudar: 698a8cd3-5418-48aa-94ca-b4adc124ada0
echo ======================================== >> "%RESULT_FILE%"
echo Computador: %COMPUTERNAME% >> "%RESULT_FILE%"
echo Usuario: %USERNAME% >> "%RESULT_FILE%"
echo IPv6: %IPV6_ENABLED% >> "%RESULT_FILE%"
echo Considere fazer um pix para ajudar: 698a8cd3-5418-48aa-94ca-b4adc124ada0 >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

:: ========================================================================================
:: 2. CONFIGURAÇÃO DE REDE
:: ========================================================================================
echo [1] CONFIGURACAO DE REDE >> "%RESULT_FILE%"
echo ===================================================================== >> "%RESULT_FILE%"

echo Executando IPCONFIG...
echo [IPCONFIG] >> "%RESULT_FILE%"
ipconfig /all >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

echo Executando ROUTE PRINT...
echo [ROTAS] >> "%RESULT_FILE%"
route print >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

echo Executando ARP...
echo [ARP] >> "%RESULT_FILE%"
arp -a >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

echo [FIM CONFIGURACAO] >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

:: ========================================================================================
:: 3. TESTES POR SITE
:: ========================================================================================
echo [2] TESTES DE CONECTIVIDADE >> "%RESULT_FILE%"
echo ======================================================================== >> "%RESULT_FILE%"

set SITES=uol.com.br fast.com globo.com youtube.com gov.br cloudflare.com
set COUNT=0

for %%S in (%SITES%) do (
    set /a COUNT+=1
    echo Teste %COUNT%: %%S
    
    echo. >> "%RESULT_FILE%"
    echo ============================================================================= >> "%RESULT_FILE%"
    echo SITE: %%S >> "%RESULT_FILE%"
    echo ============================================================================= >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    :: PING IPv4
    echo [PING IPv4] >> "%RESULT_FILE%"
    ping  -4 -n 4 %%S >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    :: TRACERT IPv4
    echo [TRACERT IPv4] >> "%RESULT_FILE%"
    tracert -4 -h 30 -w 1000 %%S >> "%RESULT_FILE%"
    echo. >> "%RESULT_FILE%"
    
    :: PING IPv6 (se disponível)
    if %IPV6_ENABLED% equ 1 (
        echo [PING IPv6] >> "%RESULT_FILE%"
        ping -6 -n 4 %%S >> "%RESULT_FILE%" 2>&1
        echo. >> "%RESULT_FILE%"
        
        echo [TRACERT IPv6] >> "%RESULT_FILE%"
        tracert -6 -h 30 -w 1000 %%S >> "%RESULT_FILE%" 2>&1
        echo. >> "%RESULT_FILE%"
    )
    
    :: DNS
    echo [DNS] >> "%RESULT_FILE%"
    nslookup %%S >> "%RESULT_FILE%" 2>&1
    echo. >> "%RESULT_FILE%"
    
    echo Aguardando 1 segundo...
    timeout /t 1 /nobreak >nul
)

:: ========================================================================================
:: 4. TESTES ADICIONAIS
:: ========================================================================================
echo. >> "%RESULT_FILE%"
echo [3] TESTES ADICIONAIS >> "%RESULT_FILE%"
echo ================================================================= >> "%RESULT_FILE%"

echo [TESTE GATEWAY] >> "%RESULT_FILE%"
for /f "tokens=3" %%G in ('ipconfig ^| findstr /i "gateway"') do (
    echo Gateway: %%G >> "%RESULT_FILE%"
    ping -n 2 %%G >> "%RESULT_FILE%"
)
echo. >> "%RESULT_FILE%"

echo [TESTE LOOPBACK] >> "%RESULT_FILE%"
ping -n 2 127.0.0.1 >> "%RESULT_FILE%"
echo. >> "%RESULT_FILE%"

echo [TESTE DNS GOOGLE] >> "%RESULT_FILE%"
nslookup google.com 8.8.8.8 >> "%RESULT_FILE%" 2>&1
echo. >> "%RESULT_FILE%"

:: ========================================================================================
:: 5. FINALIZAÇÃO
:: ========================================================================================
echo. >> "%RESULT_FILE%"
echo ============================================================================= >> "%RESULT_FILE%"
echo FIM DOS TESTES - %date% %time% >> "%RESULT_FILE%"
echo ============================================================================= >> "%RESULT_FILE%"

echo.
echo ========================================================================================
echo TESTES CONCLUIDOS!
echo.
echo Arquivo salvo como: %RESULT_FILE%
echo.
echo Pressione qualquer tecla para abrir...
pause >nul

:: Tentar abrir de várias formas
echo.
echo Abrindo resultados...
if exist "%RESULT_FILE%" (
    notepad "%RESULT_FILE%"
) else (
    echo ERRO: Arquivo nao encontrado!
    dir resultados*.txt
    pause
)

echo.
echo Fim do script. Pressione qualquer tecla para sair...
pause >nul
