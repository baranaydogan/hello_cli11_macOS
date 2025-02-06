#!/bin/bash

# Requires LLVM and libomp
llvm_prefix=$(brew --prefix llvm@18)

if ! brew list | grep -q "llvm@18"; then
  brew install llvm@18
fi

# Set environment variables for this script
export PATH="${llvm_prefix}/bin:$PATH"
export LDFLAGS="-L${llvm_prefix}/lib"

${llvm_prefix}/bin/clang++ main.cpp -o helloCLI11

chmod +x helloCLI11

echo "1"
./helloCLI11

echo "2"
./helloCLI11 --help

echo "3"
./helloCLI11 --file

echo "4"
./helloCLI11 --badoption

echo "Done"

