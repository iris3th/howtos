
#!/usr/bin/env bash
set -Eeuo pipefail

# Usage:
# ./hf-pull.sh USERNAME/REPOSITORY [DESTINATION]

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: $0 USERNAME/REPOSITORY [DESTINATION]"
    exit 1
fi

MODEL="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DESTINATION="${2:-$SCRIPT_DIR/models}"

mkdir -p "$DESTINATION"
DESTINATION="$(realpath "$DESTINATION")"


for FILE in compose.yaml compose.yml docker-compose.yml podman-compose.yaml; do
    if [[ -f "$SCRIPT_DIR/$FILE" ]]; then
        COMPOSE_FILE="$SCRIPT_DIR/$FILE"
        break
    fi
done

if [[ ! -f "$COMPOSE_FILE" ]]; then
    echo "ERROR: Missing $COMPOSE_FILE"
    exit 1
fi

echo "======================================"
echo " Hugging Face Model Downloader"
echo "======================================"
echo "Model       : $MODEL"
echo "Destination : $DESTINATION"
echo

MODEL_DESTINATION="$DESTINATION" \
podman compose \
    -f "$COMPOSE_FILE" \
    run --rm \
    hf-downloader \
    download "$MODEL" \
    --local-dir /data

echo
echo "Download completed: $DESTINATION"

