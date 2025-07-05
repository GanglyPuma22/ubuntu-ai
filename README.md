
# 🤖 Ubuntu AI Distro

An open-source, Ubuntu-based development environment **rich in AI tools, models, and workflows** — designed to empower beginners, researchers, and engineers alike.

---

## 🎯 Project Goal

The goal of this project is to create a lightweight yet **feature-rich Ubuntu distribution** tailored for AI/ML development. It aims to serve as a plug-and-play environment for:

- 🚀 AI model prototyping
- 📦 API deployment and model serving
- 🧠 Local inference and experimentation
- 📊 Logging and tracking experiments
- 🧰 Ready-to-use tools and developer UX

It is being built **entirely in WSL2 first**, with a planned path to **full ISO packaging** for bootable installs.

---

## 🛠️ Features (Current & Planned)

### ✅ Available Now

- Conda-based Python AI environment
- JupyterLab launcher
- Dockerfiles for dev and serving
- Template for FastAPI and Gradio apps
- Hugging Face, PyTorch, TensorFlow support

### 🚧 Coming Soon

- CLI tools to load, serve, and manage models
- Optional LLM integration into entire distro env
- Out-of-the-box preintegrated model support
- VSCode devcontainer
- Logging with WandB and MLflow
- Modular AI features and offline-ready ISO

---

## 🧩 Tech Stack

- Python 3.11 (via Conda)
- JupyterLab
- FastAPI, Uvicorn, Gradio
- Hugging Face Transformers
- PyTorch, TensorFlow, scikit-learn
- Docker + NVIDIA CUDA Runtime
- MLflow, Weights & Biases

---

## 🚀 Getting Started
The following approach assume you have ssh keys set up as your github authentication:
```bash
git clone git@github.com:<your-username>/ubuntu-ai-dev.git
cd ubuntu-ai-dev
./setup-ai.sh
conda activate ai
```

---

## 💬 Why This Exists

AI tools can be messy to install and manage — this distro aims to unify best practices into a single environment that:

- Just works
- Supports powerful models out of the box
- Helps you focus on building, not installing

---

## 🤝 Contributing

All contributions are welcome — whether you're:
- Adding a new model or CLI tool
- Improving notebook demos
- Streamlining Docker or ISO build processes

Stay tuned for contribution guidelines!

---

## 📜 License

MIT License — open to all, for all.

