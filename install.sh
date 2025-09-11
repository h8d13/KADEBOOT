#!/bin/bash

# Direct run script - no pip installs, no venv
# Just check dependencies and run

set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root"
    exit 1
fi

echo "KADEBOOT - ARCHINSTALL"
echo "============================="
echo

# Print Python modules for debug
python -c "import sys; print(f'Python {sys.version}')"

# Check for required modules that are not normally included in ISO
echo "Checking dependencies..."
if ! python -c "import cryptography" 2>/dev/null; then
    echo "Error: python-cryptography is required"
    echo "Install with: pacman -S python-cryptography"
    exit 1
fi

# Check modules that should be in ISO
python -c "import parted" 2>/dev/null || echo "Warning: pyparted not found (usually in ISO)" && exit 1
python -c "import pydantic" 2>/dev/null || echo "Warning: pydantic not found (usually in ISO)" && exit 1

echo "All dependencies found!"
export PYTHONPATH="$(pwd):$PYTHONPATH"
python -m archinstall #--advanced 
echo