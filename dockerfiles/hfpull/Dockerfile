
FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    HF_HOME=/data/.cache/huggingface

RUN pip install --no-cache-dir --upgrade huggingface_hub

WORKDIR /app

RUN mkdir -p /data

ENTRYPOINT ["hf"]
CMD ["--help"]

