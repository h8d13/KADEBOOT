#!/bin/bash

# Direct run script - no pip installs, no venv
# Just check dependencies and run

set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root (use sudo)"
    echo "Example: sudo ./run.sh"
    exit 1
fi

echo "KDE Archinstall - Direct Run"
echo "============================="
echo

# Check if we have the required Python modules
python -c "import sys; print(f'Python {sys.version}')"

# Check for required modules
echo "Checking dependencies..."
if ! python -c "import cryptography" 2>/dev/null; then
    echo "Error: python-cryptography is required"
    echo "Install with: pacman -S python-cryptography"
    exit 1
fi

# Check optional modules (should be in ISO)
python -c "import parted" 2>/dev/null || echo "Warning: pyparted not found (usually in ISO)"
python -c "import pydantic" 2>/dev/null || echo "Warning: pydantic not found (usually in ISO)"

echo "All dependencies found!"
echo
echo "Starting KDE-only archinstall..."
echo
echo "Press Enter to continue or Ctrl+C to cancel..."
read -r

# Add current directory to Python path and run
export PYTHONPATH="$(pwd):$PYTHONPATH"
python -m archinstall

echo
echo "Check /var/log/archinstall/install.log for details"
