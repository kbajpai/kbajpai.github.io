#!/usr/bin/env pwsh

# Build
pdflatex resume.tex
htlatex resume.tex
pandoc -o README.md resume.tex
pandoc -s resume.tex -o resume.docx

$timestamp = Get-Date -Format "yyyyMMdd"

# Copy files
Copy-Item -Path "resume.html"   -Destination "index.html"
Copy-Item -Path "resume.pdf"    -Destination "$env:USERPROFILE\Dropbox\Resume\Resume.Kunal.Bajpai.$timestamp.pdf"
Copy-Item -Path "resume.html"   -Destination "$env:USERPROFILE\Dropbox\Resume\Resume.Kunal.Bajpai.$timestamp.html"
Copy-Item -Path "resume.docx"   -Destination "$env:USERPROFILE\Dropbox\Resume\Resume.Kunal.Bajpai.$timestamp.docx"

# Clean git repository
git clean -d -fx -f
