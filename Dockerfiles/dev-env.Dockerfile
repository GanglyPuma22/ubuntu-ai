FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

RUN apt update && apt install -y \
    build-essential wget git curl vim htop python3-pip

ENV PATH="/opt/conda/bin:$PATH"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /opt/conda && rm miniconda.sh

COPY ai-env.yaml /tmp/ai-env.yaml
RUN conda init && conda env create -f /tmp/ai-env.yaml

CMD ["bash"]
