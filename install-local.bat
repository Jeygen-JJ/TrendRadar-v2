@echo off
cd /d "%~dp0"

echo ==========================================
echo TrendRadar local dependency installation
echo ==========================================
echo.

python -m uv --version
if errorlevel 1 (
    echo uv is not available. Installing it now...
    python -m pip install --upgrade uv
    if errorlevel 1 (
        echo Failed to install uv.
        pause
        exit /b 1
    )
)

echo.
echo Installing an isolated Python 3.12 runtime...
python -m uv python install 3.12
if errorlevel 1 (
    echo.
    echo Failed to install Python 3.12.
    pause
    exit /b 1
)

echo.
echo Installing project dependencies with Python 3.12...
python -m uv sync --python 3.12
if errorlevel 1 (
    echo.
    echo Dependency installation failed.
    pause
    exit /b 1
)

echo.
echo Installation completed successfully.
pause
