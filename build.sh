#!/usr/bin/env bash

mkdir -p dist

# Build
pdflatex resume.tex
htlatex resume.tex
pandoc -o README.md resume.tex

cp resume.pdf dist/resume_kbajpai.pdf

git clean -f
rm -vf *.log *.aux resume.pdf