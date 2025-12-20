#!/bin/bash

# Build all documents from docs/ subfolders
# Usage: ./build-docs.sh

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check dependencies
if ! command -v pandoc >/dev/null 2>&1; then
    printf "${RED}Error: pandoc not installed${NC}\n"
    exit 1
fi

if ! command -v pdflatex >/dev/null 2>&1; then
    printf "${RED}Error: pdflatex not installed${NC}\n"
    exit 1
fi

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$SCRIPT_DIR/docs"
OUTPUT_DIR="$SCRIPT_DIR/output"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Track results
SUCCESS_COUNT=0
FAIL_COUNT=0

printf "${GREEN}Building all documents...${NC}\n\n"

# Iterate through each subfolder in docs/
for DOC_FOLDER in "$DOCS_DIR"/*/ ; do
    [ -d "$DOC_FOLDER" ] || continue
    
    DOC_NAME=$(basename "$DOC_FOLDER")
    DOC_FILE="$DOC_FOLDER/doc.md"
    TEMPLATE_FILE="$DOC_FOLDER/template.latex"
    OUTPUT_FILE="$OUTPUT_DIR/${DOC_NAME}.pdf"
    
    # Check if required files exist
    if [ ! -f "$DOC_FILE" ]; then
        printf "${YELLOW}⚠ Skipping $DOC_NAME: doc.md not found${NC}\n"
        continue
    fi
    
    if [ ! -f "$TEMPLATE_FILE" ]; then
        printf "${YELLOW}⚠ Skipping $DOC_NAME: template.latex not found${NC}\n"
        continue
    fi
    
    printf "Building ${DOC_NAME}... "
    
    # Generate PDF (run from doc folder to resolve relative paths like images)
    if (cd "$DOC_FOLDER" && pandoc "doc.md" \
        --template="template.latex" \
        --pdf-engine=pdflatex \
        -o "$OUTPUT_FILE" 2>/dev/null); then
        printf "${GREEN}✓${NC}\n"
        ((SUCCESS_COUNT++))
    else
        printf "${RED}✗${NC}\n"
        ((FAIL_COUNT++))
    fi
done

# Summary
printf "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
printf "Built: ${GREEN}${SUCCESS_COUNT}${NC} | Failed: ${RED}${FAIL_COUNT}${NC}\n"
printf "Output: ${OUTPUT_DIR}\n"

# Open output directory if on Linux
if command -v xdg-open &> /dev/null && [ $SUCCESS_COUNT -gt 0 ]; then
    xdg-open "$OUTPUT_DIR" 2>/dev/null &
fi

exit 0
