@echo off
cd /d "%~dp0"

echo ==========================================
echo TrendRadar AI News Digest
echo ==========================================
echo.

python -m uv --version >nul 2>&1
if errorlevel 1 (
    echo uv is not available.
    echo Run install-local.bat first.
    echo.
    pause
    exit /b 1
)

echo Collecting AI news. Please wait...
echo.
python -m uv run --python 3.12 python -m trendradar

if errorlevel 1 (
    echo.
    echo TrendRadar failed. Keep this window open and capture the error.
    pause
    exit /b 1
)

echo.
echo Collection completed.
echo If the report did not open automatically, open output\index.html manually.
pause
