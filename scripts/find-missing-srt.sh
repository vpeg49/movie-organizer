#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/../.env"

if [ -f "$ENV_FILE" ]; then
  while IFS='=' read -r key value; do
    [[ "$key" =~ ^#.*$ ]] && continue
    [[ -z "$key" ]] && continue
    export "$key=$value"
  done < "$ENV_FILE"
fi

BIBLIOTECA="${DEST_PATH:-}"
OUTPUT_FILE="$SCRIPT_DIR/../missing-srt.txt"

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

if [ -z "$BIBLIOTECA" ]; then
  echo -e "${RED}❌ DEST_PATH no está definido en .env${NC}"
  exit 1
fi

if [ ! -d "$BIBLIOTECA" ]; then
  echo -e "${RED}❌ No se encuentra: $BIBLIOTECA${NC}"
  exit 1
fi

echo ""
echo -e "${BOLD}🔍 Escaneando: $BIBLIOTECA${NC}"
echo ""

total=0
count=0
: > "$OUTPUT_FILE"

while IFS= read -r video; do
  total=$((total + 1))
  base="${video%.*}"

  if [ ! -f "${base}.srt" ]; then
    count=$((count + 1))

    filename=$(basename "$video")
    genre=$(basename "$(dirname "$video")")
    base_name="${filename%.*}"

    # Quita año entre paréntesis al final
    clean="${base_name% (*}"
    # Espacios → +
    encoded="${clean// /+}"
    url="https://www.opensubtitles.org/es/search2/sublanguageid-spa/moviename-${encoded}"

    echo -e "${RED}❌${NC} ${CYAN}[$genre]${NC} $filename"
    echo -e "   🔗 $url"
    echo ""

    echo "[$genre] $filename" >> "$OUTPUT_FILE"
    echo "  → $url" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
  fi

done < <(find "$BIBLIOTECA" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | sort)

echo "────────────────────────────────────────────────────────────"

if [ "$count" -eq 0 ]; then
  echo -e "${GREEN}✅ Todas las películas tienen .srt${NC}"
else
  echo -e "${YELLOW}📄 Lista guardada en:${NC} $OUTPUT_FILE"
  echo -e "${BOLD}Total revisadas: $total  |  Sin .srt: $count${NC}"
fi

echo ""
