#!/bin/bash

# CV Generator Script
# Usage: ./generate-cv.sh input.md [output.pdf]

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if pandoc is installed
if command -v pandoc >/dev/null 2>&1; then
    PANDOC_PATH=$(command -v pandoc)
elif [ -f "/usr/bin/pandoc" ]; then
    PANDOC_PATH="/usr/bin/pandoc"
else
    printf "${RED}Error: pandoc is not installed${NC}\n"
    printf "Install it with: sudo apt-get install pandoc (Linux) or brew install pandoc (macOS)\n"
    exit 1
fi

# Check if pdflatex is installed
if ! command -v pdflatex >/dev/null 2>&1; then
    printf "${RED}Error: pdflatex is not installed${NC}\n"
    printf "Install it with: sudo apt-get install texlive-latex-extra texlive-fonts-recommended (Linux)\n"
    printf "or: brew install --cask mactex (macOS)\n"
    exit 1
fi

# Check if moderncv is installed
if ! kpsewhich moderncv.cls >/dev/null 2>&1; then
    printf "${YELLOW}Warning: moderncv LaTeX package might not be installed${NC}\n"
    printf "Install it with: sudo apt-get install texlive-latex-extra (Linux)\n"
fi

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$PROJECT_ROOT/templates"
OUTPUT_DIR="$PROJECT_ROOT/output"

# Check arguments
if [ $# -lt 1 ]; then
    printf "${RED}Usage: $0 input.md [output.pdf]${NC}\n"
    printf "Example: $0 examples/sample-cv.md\n"
    exit 1
fi

INPUT_FILE="$1"
if [ ! -f "$INPUT_FILE" ]; then
    printf "${RED}Error: Input file '$INPUT_FILE' not found${NC}\n"
    exit 1
fi

# Determine output filename
if [ $# -eq 2 ]; then
    OUTPUT_FILE="$2"
else
    BASENAME=$(basename "$INPUT_FILE" .md)
    OUTPUT_FILE="$OUTPUT_DIR/${BASENAME}.pdf"
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

printf "${GREEN}Generating CV...${NC}\n"
echo "Input:    $INPUT_FILE"
echo "Output:   $OUTPUT_FILE"
echo "Template: $TEMPLATE_DIR/cv-template.latex"

# Generate PDF
if "$PANDOC_PATH" "$INPUT_FILE" \
    --template="$TEMPLATE_DIR/cv-template.latex" \
    --pdf-engine=pdflatex \
    -o "$OUTPUT_FILE"
then
    # Open the PDF if on Linux with xdg-open, macOS with open, or WSL with explorer.exe
    if command -v xdg-open &> /dev/null; then
        xdg-open "$OUTPUT_FILE" 2>/dev/null &
    elif command -v open &> /dev/null; then
        open "$OUTPUT_FILE"
    elif command -v explorer.exe &> /dev/null; then
        explorer.exe "$OUTPUT_FILE"
    fi
else
    echo -e "${RED}✗ Error generating CV${NC}"
    exit 1
fi
