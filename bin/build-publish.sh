#!/bin/bash

# Move to the home directory to build the book
echo "Moving to the home directory to build the book..."
cd ../..

# Build the book
echo "Building the book..."
jb build kubernetes-kafka-book/
echo "Book successfully built!"

cd kubernetes-kafka-book/

# Publish on github page
echo "Publishing on github page..."
ghp-import -n -p -f _build/html/
echo "Book successfully published!"