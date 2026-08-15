# 🚀 Portable Offline AI Chatbot (Qwen + Llamafile on a USB Drive)

A fully self-contained, offline AI chatbot setup that runs entirely from a portable pen drive. By combining Mozilla's **Llamafile** runtime with a quantized **Qwen** GGUF model, this project allows you to run a private, local LLM server on any Windows computer with zero internet dependency or heavy Python/Docker installation.

---

## 📂 Project Structure & Component Roles

Inside your pen drive directory, the project relies on three key files working together:

| Component | File Name (Example) | Role & Description |
| :--- | :--- | :--- |
| **The Runtime Engine** | `llamafile.exe` | Bundles `llama.cpp` and web server binaries into a single executable, instantly spinning up a local web UI server. |
| **The AI Model (Brain)** | `qwen2.5-7b-instruct-q4_k_m.gguf` | A pre-quantized text generation model (Qwen 2.5) optimized to run efficiently on consumer RAM/VRAM. |
| **The Automation Script**| `start.bat` | A Windows batch script that automatically maps the dynamic pen drive letter and executes the server command. |

---

## 🛠️ Precise Setup Steps

1. **Prepare the USB Drive:** Use an exFAT or NTFS formatted pen drive with at least 16GB of free space.
2. **Download the Engine:** Get the executable file from the [Mozilla Llamafile GitHub Releases](https://github.com/mozilla-ai/llamafile/releases), rename it to `llamafile.exe`, and place it in your folder.
3. **Download the Model:** Go to [Hugging Face](https://huggingface.co/) (such as community GGUF repositories by `bartowski` or `lmstudio-community`), download a single `.gguf` file like `qwen2.5-7b-instruct-q4_k_m.gguf`, and place it in the same folder.
4. **Create the Startup Script:** Create a file named `start.bat` using Notepad and add the following script:

```cmd
@echo off
title Portable Qwen AI Server
echo Starting local AI server from USB...

:: Automatically target the drive letter where this bat file is run from
%~d0
cd %~dp0

:: Run the Llamafile server pointing to the model
llamafile.exe --server --model qwen2.5-7b-instruct-q4_k_m.gguf

pause
