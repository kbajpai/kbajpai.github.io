#!/usr/bin/env pwsh

# Create directory if it doesn't exist
if (!(Test-Path -Path "dist")) {
    New-Item -ItemType Directory -Path "dist"
}

# Build
pdflatex resume.tex
htlatex resume.tex
pandoc -o README.md resume.tex
# pandoc -s resume.tex -o resume.docx

# Copy files
Copy-Item -Path "resume.pdf"    -Destination "dist/resume_kbajpai.pdf"
Copy-Item -Path "resume.pdf"    -Destination "$env:USERPROFILE\Dropbox\Resume\resume_kbajpai.pdf"
Copy-Item -Path "resume.html"   -Destination "index.html"

# Clean git repository
git clean -d -fx -f
