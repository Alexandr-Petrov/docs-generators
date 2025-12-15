# Document Generator (CV & Invoice)

Automated system for generating professional CVs and invoices from Markdown files using Pandoc and LaTeX.

## 📋 Features

- **CV Generation**: Create beautiful CVs using the ModernCV LaTeX template
- **Invoice Generation**: Generate professional invoices with itemized billing
- **Markdown-based**: Simple, text-based format for easy version control
- **Customizable Templates**: Modify LaTeX templates to match your style
- **Automated Scripts**: One-command generation of PDFs

## 🚀 Quick Start

### Prerequisites

You need to install:

1. **Pandoc** - Document converter
   ```bash
   # Linux
   sudo apt-get install pandoc
   
   # macOS
   brew install pandoc
   ```

2. **LaTeX** - PDF generation engine
   ```bash
   # Linux (Ubuntu/Debian)
   sudo apt-get install texlive-latex-extra texlive-fonts-recommended
   
   # macOS
   brew install --cask mactex
   # Or for a smaller installation:
   brew install --cask basictex
   ```

3. **ModernCV Package** (for CVs, usually included in texlive-latex-extra)
   ```bash
   # If not already installed
   sudo apt-get install texlive-latex-extra
   ```

### Generate Your First Document

1. **Generate the sample CV:**
   ```bash
   ./scripts/generate-cv.sh examples/sample-cv.md
   ```

2. **Generate the sample invoice:**
   ```bash
   ./scripts/generate-invoice.sh examples/sample-invoice.md
   ```

3. **Generate all documents at once:**
   ```bash
   ./scripts/build-all.sh
   ```

Generated PDFs will be in the `output/` directory.

## 📁 Project Structure

```
docs-generators/
├── CV/                          # Your personal CV markdown files
├── examples/                    # Sample files to get started
│   ├── sample-cv.md            # Example CV
│   └── sample-invoice.md       # Example invoice
├── templates/                   # LaTeX templates
│   ├── cv-template.latex       # CV template (ModernCV)
│   └── invoice-template.latex  # Invoice template
├── scripts/                     # Generation scripts
│   ├── generate-cv.sh          # CV generator
│   ├── generate-invoice.sh     # Invoice generator
│   └── build-all.sh            # Build everything
└── output/                      # Generated PDFs
```

## 📝 Creating Your CV

1. Copy the sample CV:
   ```bash
   cp examples/sample-cv.md CV/my-cv.md
   ```

2. Edit `CV/my-cv.md` with your information:
   ```yaml
   ---
   firstname: Your
   lastname: Name
   title: Your Job Title
   email: your.email@example.com
   phone: +1 (555) 123-4567
   # ... more fields
   ---
   ```

3. Generate the PDF:
   ```bash
   ./scripts/generate-cv.sh CV/my-cv.md
   ```

### CV Fields Reference

**Personal Information:**
- `firstname`, `lastname`, `title`
- `address`, `phone`, `email`
- `homepage`, `linkedin`, `github`
- `photo` (path to image file)
- `quote` (professional tagline)

**Sections:**
- `summary` - Brief professional summary
- `experience` - Work history (array of jobs)
- `education` - Academic background
- `skills` - Technical and soft skills
- `languages` - Language proficiency
- `projects` - Notable projects
- `certifications` - Professional certifications
- `interests` - Personal interests

## 💰 Creating Invoices

1. Copy the sample invoice:
   ```bash
   cp examples/sample-invoice.md invoices/invoice-001.md
   ```

2. Edit with your invoice details:
   ```yaml
   ---
   invoice_number: INV-2024-001
   invoice_date: December 10, 2025
   from_name: Your Business Name
   to_name: Client Name
   items:
     - description: Service Description
       quantity: 10
       rate: 100
       amount: 1000
   # ... more fields
   ---
   ```

3. Generate the PDF:
   ```bash
   ./scripts/generate-invoice.sh invoices/invoice-001.md
   ```

### Invoice Fields Reference

**Header:**
- `invoice_title`, `invoice_number`, `invoice_date`, `due_date`

**From (Your Info):**
- `from_name`, `from_address`, `from_city`
- `from_email`, `from_phone`, `from_tax_id`
- `logo` (path to logo image)

**To (Client Info):**
- `to_name`, `to_address`, `to_city`
- `to_email`, `to_tax_id`

**Items:** (array of line items)
- `description`, `details`, `quantity`, `rate`, `amount`

**Totals:**
- `currency`, `subtotal`, `tax_rate`, `tax_amount`, `discount`, `total`

**Footer:**
- `notes`, `payment_terms`, `payment_methods`

## 🎨 Customization

### Modify CV Template

Edit `templates/cv-template.latex` to change:
- Colors: `\moderncvcolor{blue}` (options: blue, orange, green, red, purple, grey, black)
- Style: `\moderncvstyle{banking}` (options: casual, classic, oldstyle, fancy, banking)
- Margins: Adjust `\usepackage[scale=0.85]{geometry}`

### Modify Invoice Template

Edit `templates/invoice-template.latex` to change:
- Colors: Modify `\definecolor{headercolor}` and `\definecolor{accentcolor}`
- Layout: Adjust table widths, spacing, and sections
- Fonts: Add custom font packages

## 🔧 Troubleshooting

### Pandoc not found
```bash
# Verify installation
pandoc --version

# If not installed, install it:
sudo apt-get install pandoc  # Linux
brew install pandoc          # macOS
```

### LaTeX errors
```bash
# Verify pdflatex is installed
pdflatex --version

# Install full LaTeX distribution
sudo apt-get install texlive-full  # Linux (large download)
```

### ModernCV class not found
```bash
# Install LaTeX extras
sudo apt-get install texlive-latex-extra

# Verify installation
kpsewhich moderncv.cls
```

### Permission denied
```bash
# Make scripts executable
chmod +x scripts/*.sh
```

## 📚 Tips & Best Practices

1. **Version Control**: Keep your markdown files in git
2. **Naming Convention**: Use descriptive names like `john-doe-cv-2024.md`
3. **Multiple Versions**: Create different CVs for different job applications
4. **Invoice Numbering**: Use consistent numbering like `INV-2024-001`
5. **Backup**: Keep copies of generated PDFs with date stamps
6. **Templates**: Customize once, reuse forever

## 🤝 Workflow Examples

### Creating a tailored CV for a job application:
```bash
cp CV/my-cv.md CV/my-cv-company-name.md
# Edit the file to emphasize relevant experience
./scripts/generate-cv.sh CV/my-cv-company-name.md
```

### Monthly invoice workflow:
```bash
cp examples/sample-invoice.md invoices/invoice-2024-12.md
# Update dates, items, and amounts
./scripts/generate-invoice.sh invoices/invoice-2024-12.md
```

### Batch generation:
```bash
# Generate all documents at once
./scripts/build-all.sh
```

## 📄 License

Free to use and modify for personal and commercial purposes.

## 🙏 Credits

- Built with [Pandoc](https://pandoc.org/)
- CV template uses [ModernCV](https://www.ctan.org/pkg/moderncv)
- LaTeX powered by [TeX Live](https://www.tug.org/texlive/)

---

**Happy Document Generating! 🎉**

For issues or questions, check the troubleshooting section or consult the Pandoc documentation.
