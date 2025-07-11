
# 🧠 Ubuntu AI Distro – Feature Roadmap & Checklist

This document tracks the progress of key features in your AI-focused Ubuntu distro.

---

## ✅ Base System Setup

- [x] Conda environment with AI stack (`ai-env.yaml`)
- [x] Project repo structure with `setup-ai.sh`, `Dockerfiles/`, `scripts/`, `notebooks/`
- [x] JupyterLab launch script
- [x] GitHub repo + SSH setup

---

## 🚀 Development Experience

- [ ] Add `devcontainer.json` for VSCode support
- [ ] Shell enhancements (`zsh`, `starship`, `tmux`, `htop`)
- [ ] CLI helpers (`load-model`, `serve-model`, `train-model`, `ai help`)
- [ ] Model download cache in Docker/shared volume
- [ ] Enable automatic GPU detection warning

---

## 🤖 Model Integration (Out-of-the-Box Ready)

- [ ] Transformers: `gpt2`, `distilbert`
- [ ] Vision: `resnet18`, `mobilenet_v3_small`
- [ ] Embeddings: `all-MiniLM-L6-v2`
- [ ] Large models (optional flag): `phi-2`, `mistral`, `llama3`
- [ ] Opt-in model loader: `install-feature --llm`

---

## 🧪 Inference & Demo Tools

- [ ] FastAPI inference server template
- [ ] Gradio demo launcher
- [ ] `serve-model` CLI with args
- [ ] Example REST endpoints in `serving/`

---

## 📓 Notebooks

- [ ] GPU check notebook
- [ ] Image classification demo (ResNet)
- [ ] Transformers text generation demo
- [ ] Sentence embeddings
- [ ] Gradio interactive demo

---

## 📈 Experiment Tracking & Logging

- [ ] WandB integration (with API key support)
- [ ] MLflow template config
- [ ] TensorBoard pre-installed with launcher
- [ ] Optional logging toggle via `ENABLE_LOGGING=true`

---

## 💾 ISO Packaging (later)

- [ ] Set up Cubic or `live-build` for ISO creation
- [ ] Pre-install Conda + base AI env in ISO
- [ ] Optional: ISO size budgeting strategy
- [ ] Modular install for large models (`/opt/models`)
- [ ] Offline/airgapped support toggle

---

## 🌐 Networking & Security

- [ ] Hugging Face login flow prompt
- [ ] Proxy/SSL cert configuration for enterprise use
- [ ] Model fetch timeout retries / error fallback

---

## 🧩 Nice-to-Haves

- [ ] `ai help` CLI reference
- [ ] Notebook preloader script
- [ ] `.vscode/extensions.json` suggestion file
- [ ] Basic UI dashboard (optional)

---

_Last updated: July 2025_
