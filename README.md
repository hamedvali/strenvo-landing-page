# Strenvo Landing Page

A minimal, fast landing page for the Strenvo magnetic shaker bottle.

## 🚀 Quick Start

### Local Development

You have several options to run the site locally:

#### Option 1: Smart Script (Recommended)
```bash
./dev.sh
```
This will automatically detect and use the best available server method.

#### Option 2: Specify Server Method
```bash
./dev.sh python    # Python 3 HTTP server
./dev.sh node      # Node.js serve
./dev.sh php       # PHP built-in server
./dev.sh ruby      # Ruby HTTP server
```

#### Option 3: Using npm scripts
```bash
npm run dev        # Python 3 server
npm run dev-node   # Node.js serve
npm run dev-php    # PHP server
npm run dev-ruby   # Ruby server
npm run open       # Open in browser
```

#### Option 4: Manual Commands
```bash
# Python 3
python3 -m http.server 3000

# Node.js (requires: npm install -g serve)
npx serve . -p 3000

# PHP
php -S localhost:3000

# Ruby
ruby -run -e httpd . -p 3000
```

Then open http://localhost:3000 in your browser.

## 🚀 Deployment

Deploy to Fly.io:
```bash
fly deploy
```

Your app will be available at: https://strenvo-landing.fly.dev/

## 📁 Project Structure

```
├── index.html          # Main landing page
├── dev.sh              # Local development script
├── package.json        # npm scripts
├── Dockerfile          # Docker configuration for Fly.io
├── nginx.conf          # Nginx configuration
├── fly.toml           # Fly.io configuration
└── README.md          # This file
```

## 🔧 Configuration

- **Port**: 3000 (local development)
- **Framework**: Pure HTML/CSS/JS
- **Server**: Nginx (production)
- **Hosting**: Fly.io

## 📝 Notes

- The page references `VO 0001.png` for the product image. Make sure to add this file before deploying.
- The site is optimized for performance with gzip compression and caching headers.
- Auto-scaling is enabled on Fly.io to minimize costs.

## 🛠️ Development

To make changes:
1. Edit `index.html`
2. Test locally with `./dev.sh`
3. Deploy with `fly deploy` 