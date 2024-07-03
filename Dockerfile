FROM nvcr.io/nvidia/pytorch:23.12-py3

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    build-essential \
    manpages-dev \
    ca-certificates \
    g++ \
    git \
    libglfw3-dev \
    libgles2-mesa-dev 
    

ADD . /app

WORKDIR /app

RUN pip3 install --upgrade pip

RUN --mount=type=cache,target=/root/.cache/pip pip3 install -r requirements.txt

WORKDIR /app