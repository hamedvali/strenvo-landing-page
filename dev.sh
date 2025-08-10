#!/bin/bash

# Strenvo Landing Page - Local Development Script
# Usage: ./dev.sh [option]

echo "🚀 Strenvo Landing Page - Local Development"
echo "=========================================="

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to start server
start_server() {
    local method=$1
    local port=3000
    
    echo "Starting local server on http://localhost:$port"
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    case $method in
        "python")
            if command_exists python3; then
                python3 -m http.server $port
            else
                echo "❌ Python 3 not found. Please install Python 3."
                exit 1
            fi
            ;;
        "node")
            if command_exists npx; then
                npx serve . -p $port
            else
                echo "❌ Node.js/npx not found. Please install Node.js."
                exit 1
            fi
            ;;
        "php")
            if command_exists php; then
                php -S localhost:$port
            else
                echo "❌ PHP not found. Please install PHP."
                exit 1
            fi
            ;;
        "ruby")
            if command_exists ruby; then
                ruby -run -e httpd . -p $port
            else
                echo "❌ Ruby not found. Please install Ruby."
                exit 1
            fi
            ;;
        *)
            echo "❌ Unknown method: $method"
            exit 1
            ;;
    esac
}

# Main script logic
if [ $# -eq 0 ]; then
    # No arguments provided, try to find the best available method
    echo "No method specified. Trying to find available server..."
    
    if command_exists python3; then
        echo "✅ Using Python 3 HTTP server"
        start_server "python"
    elif command_exists npx; then
        echo "✅ Using Node.js serve"
        start_server "node"
    elif command_exists php; then
        echo "✅ Using PHP built-in server"
        start_server "php"
    elif command_exists ruby; then
        echo "✅ Using Ruby HTTP server"
        start_server "ruby"
    else
        echo "❌ No suitable server found. Please install one of:"
        echo "   - Python 3: brew install python3"
        echo "   - Node.js: brew install node"
        echo "   - PHP: brew install php"
        echo "   - Ruby: brew install ruby"
        exit 1
    fi
else
    # Method specified
    start_server "$1"
fi 