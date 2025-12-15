# Makefile for document generation

.PHONY: all cv invoice clean help install-deps

# Default target
all: cv invoice

# Generate sample CV
cv:
	@./scripts/generate-cv.sh examples/sample-cv.md

# Generate sample invoice
invoice:
	@./scripts/generate-invoice.sh examples/sample-invoice.md

# Generate all documents
build-all:
	@./scripts/build-all.sh

# Clean generated files
clean:
	@echo "Cleaning output directory..."
	@rm -rf output/*.pdf
	@echo "Done!"

# Install dependencies (Debian/Ubuntu)
install-deps:
	@echo "Installing dependencies for Debian/Ubuntu..."
	@sudo apt-get update
	@sudo apt-get install -y pandoc texlive-latex-extra texlive-fonts-recommended
	@echo "Dependencies installed!"

# Install dependencies (macOS)
install-deps-mac:
	@echo "Installing dependencies for macOS..."
	@brew install pandoc
	@brew install --cask basictex
	@echo "Dependencies installed!"
	@echo "Note: You may need to restart your terminal."

# Check if dependencies are installed
check-deps:
	@echo "Checking dependencies..."
	@which pandoc > /dev/null && echo "✓ pandoc installed" || echo "✗ pandoc NOT installed"
	@which pdflatex > /dev/null && echo "✓ pdflatex installed" || echo "✗ pdflatex NOT installed"
	@kpsewhich moderncv.cls > /dev/null 2>&1 && echo "✓ moderncv installed" || echo "✗ moderncv NOT installed"

# Help
help:
	@echo "Document Generator - Available targets:"
	@echo ""
	@echo "  make cv              - Generate sample CV"
	@echo "  make invoice         - Generate sample invoice"
	@echo "  make all             - Generate both CV and invoice (default)"
	@echo "  make build-all       - Generate all documents in project"
	@echo "  make clean           - Remove generated PDFs"
	@echo "  make check-deps      - Check if dependencies are installed"
	@echo "  make install-deps    - Install dependencies (Debian/Ubuntu)"
	@echo "  make install-deps-mac- Install dependencies (macOS)"
	@echo "  make help            - Show this help message"
