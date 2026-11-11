# Hugging Face Model Downloader

A lightweight Docker/Podman-based utility for downloading models directly from Hugging Face using `huggingface_hub`.

Models are downloaded into a local directory on the host machine through a persistent volume. No Python installation or Hugging Face dependencies are required on the host.

## Features

- Download models directly from Hugging Face.
- Supports public and private repositories.
- Uses Podman Compose.
- Lightweight Python-based container.
- Persistent model storage on the host.
- Optional custom download destination.
- Automatically creates destination directories.
- No need to install Python packages system-wide.

## Project Structure

```text
hfpull/
├── Dockerfile
├── podman-compose.yaml
├── hf-pull.sh
├── README.md
└── models/
```

## Requirements

- Linux
- Podman
- podman-compose
- Podman Compose provider
- Internet connection

## Installation

Clone or download this project, then make the script executable:

```bash
chmod +x hf-pull.sh
```

Build the container image:

```bash
podman compose -f podman-compose.yaml build
```

## Usage

The script accepts two parameters:

1. Hugging Face repository (required).
2. Destination directory (optional).

### Download to the default directory

```bash
./hf-pull.sh USERNAME/REPOSITORY
```

By default, models are downloaded into:

```text
./models/
```

### Download to a custom directory

```bash
./hf-pull.sh USERNAME/REPOSITORY /mnt/models/MODEL
```

The destination directory is automatically created if it doesn't exist.

## Examples

Download Qwen Image Edit GGUF:

```bash
./hf-pull.sh oracg/Qwen-Image-Edit-GGUF
```

Download a different model:

```bash
./hf-pull.sh bartowski/Qwen2.5-14B-Instruct-GGUF
```

Download into a custom directory:

```bash
./hf-pull.sh bartowski/Qwen2.5-14B-Instruct-GGUF /mnt/models/qwen14b
```

## Private Hugging Face Repositories

For private repositories, configure your Hugging Face access token.

Pass the token to the container using the `HF_TOKEN` environment variable.

For example:

```bash
read -rsp "Hugging Face token: " HF_TOKEN

