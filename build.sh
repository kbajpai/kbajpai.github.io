#!/usr/bin/env bash

mkdir -p dist

# Build
pdflatex resume.tex
htlatex resume.tex
pandoc -o README.md resume.tex
pandoc -s resume.tex -o resume.docx

cp resume.pdf dist/resume_kbajpai.pdf
cp resume.pdf ~/Dropbox/Resume/resume_kbajpai.pdf
cp resume.html index.html

git clean -d  -fx -f
