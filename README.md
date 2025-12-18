# Document Generator

Generate professional documents from Markdown using Pandoc and LaTeX.

## Installation

```bash
sudo apt-get update
sudo apt-get install -y pandoc texlive-latex-base texlive-latex-extra texlive-fonts-recommended
```

## Structure

```
docs/
├── CV_int/          # International CV
├── CV_DACH/         # DACH region CV
├── CV_Russia/       # Russia CV
└── [your-doc]/      # Add more folders
    ├── doc.md       # Your content
    └── template.latex
```

## Usage

Build all documents:
```bash
bash build-docs.sh
```

PDFs are generated in `output/` folder.

## Adding a New Document

1. Create folder in `docs/`: `mkdir docs/My_CV`
2. Add `doc.md` with your content
3. Add `template.latex` with your template
4. Run `bash build-docs.sh`

## License

MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

