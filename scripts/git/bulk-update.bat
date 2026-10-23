@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   Git Repository Bulk Updater
echo ========================================

rem カレントディレクトリ内のすべてのフォルダをループ
for /d %%i in (*) do (
    if exist "%%i\.git" (
        echo.
        echo [Updating] %%i ...
        pushd "%%i"
        
        rem git pull を実行
        git pull
        
        if !errorlevel! equ 0 (
            echo [+] Success: %%i
        ) else (
            echo [!] Error: %%i で問題が発生しました
        )
        popd
    )
)

echo.
echo ========================================
echo   すべての処理が完了しました
echo ========================================
pause