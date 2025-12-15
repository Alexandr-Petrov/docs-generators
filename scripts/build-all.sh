#!/bin/bash

# Master build script - generates both CVs and invoices
# Usage: ./build-all.sh

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Document Generator - Build All${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Generate sample CV
if [ -f "$PROJECT_ROOT/examples/sample-cv.md" ]; then
    echo -e "${GREEN}Generating sample CV...${NC}"
    "$SCRIPT_DIR/generate-cv.sh" "$PROJECT_ROOT/examples/sample-cv.md"
    echo ""
fi

# Generate sample invoice
if [ -f "$PROJECT_ROOT/examples/sample-invoice.md" ]; then
    echo -e "${GREEN}Generating sample invoice...${NC}"
    "$SCRIPT_DIR/generate-invoice.sh" "$PROJECT_ROOT/examples/sample-invoice.md"
    echo ""
fi

# Generate all custom CVs in CV directory
if [ -d "$PROJECT_ROOT/CV" ]; then
    for cv_file in "$PROJECT_ROOT/CV"/*.md; do
        if [ -f "$cv_file" ]; then
            echo -e "${GREEN}Generating $(basename "$cv_file")...${NC}"
            "$SCRIPT_DIR/generate-cv.sh" "$cv_file"
            echo ""
        fi
    done
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}All documents generated successfully!${NC}"
echo -e "${BLUE}========================================${NC}"
