@echo off
title Portable Qwen AI Server
echo Starting local AI server from USB...

:: Automatically target the drive letter where this bat file is run from
%~d0
cd %~dp0

:: Run the Llamafile server pointing to the model
llamafile.exe --port 8989 --server --model qwen2.5-coder-7b-instruct-q4_k_m.gguf

pause
