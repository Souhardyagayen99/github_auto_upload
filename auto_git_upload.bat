
@echo off
title Automatic GitHub Upload

cd /d "C:\Users\s2ag\Desktop\git_upload"

echo =====================================
echo       AUTOMATIC GITHUB UPLOAD
echo =====================================

REM Initialize Git
git init

REM Rename branch to main
git branch -M main

REM Configure GitHub remote
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin https://github.com/Souhardyagayen99/github_auto_upload
) else (
    git remote set-url origin https://github.com/Souhardyagayen99/github_auto_upload
)

REM Check Git status
git status

REM Add all files
git add .

REM Check status again
git status

REM Commit changes
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Automatic project update"
) else (
    echo No new changes to commit.
)

REM Push to GitHub
git push origin main --force

echo.
echo =====================================
echo       GITHUB UPLOAD COMPLETED
echo =====================================

pause
