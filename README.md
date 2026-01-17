# 🎯 Interview Prep OS - Landing Page

> A blazing-fast, SEO-optimized landing page built with Astro, React, and TailwindCSS

## ✨ Features

- ⚡ **Lightning Fast**: Static site generation with Astro
- 🎨 **Beautiful Design**: Modern UI with TailwindCSS and glassmorphism
- 📱 **Fully Responsive**: Mobile-first design
- ♿ **Accessible**: WCAG 2.1 AA compliant
- 🔍 **SEO Optimized**: Perfect Lighthouse scores
- 🤖 **Crawler Friendly**: Structured data, sitemap, robots.txt
- 🚀 **Production Ready**: Optimized for deployment

## 🚀 Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

Visit: **http://localhost:4321**

## 📁 Project Structure

```
landing/
├── public/
│   ├── images/          # OG images and assets
│   ├── favicon.svg      # Site favicon
│   ├── manifest.json    # PWA manifest
│   └── robots.txt       # Crawler instructions
├── src/
│   ├── components/
│   │   ├── Hero.astro        # Hero section
│   │   ├── Features.astro    # Features showcase
│   │   ├── CTA.astro         # Call-to-action & footer
│   │   ├── AuthCheck.tsx     # React auth component
│   │   └── SEOHead.astro     # SEO meta tags
│   ├── layouts/
│   │   └── Layout.astro      # Base layout
│   ├── pages/
│   │   ├── index.astro       # Landing page
│   │   ├── dashboard.astro   # Dashboard redirect
│   │   └── og-image.png.ts   # OG image generator
│   └── styles/
│       └── global.css        # Global styles
├── astro.config.mjs     # Astro configuration
├── tailwind.config.mjs  # Tailwind configuration
└── tsconfig.json        # TypeScript configuration
```

## 🎨 Customization

### Update Site URL
```javascript
// astro.config.mjs
export default defineConfig({
  site: 'https://your-domain.com',
  // ...
});
```

### Update Environment Variables
```bash
# .env
PUBLIC_SITE_URL=https://your-domain.com
PUBLIC_DASHBOARD_URL=https://your-domain.com/dashboard
PUBLIC_API_URL=https://api.your-domain.com
```

### Modify Content
- **Hero**: `src/components/Hero.astro`
- **Features**: `src/components/Features.astro`
- **Footer**: `src/components/CTA.astro`
- **SEO**: `src/components/SEOHead.astro`

### Change Colors
Edit `tailwind.config.mjs` to customize the color scheme.

## 🔍 SEO Features

### Implemented:
- ✅ Semantic HTML5
- ✅ Meta tags (title, description, keywords)
- ✅ Open Graph tags
- ✅ Twitter Cards
- ✅ Structured data (JSON-LD)
- ✅ XML sitemap
- ✅ robots.txt
- ✅ Canonical URLs
- ✅ Mobile-responsive
- ✅ Fast loading times
- ✅ Accessibility compliant

### Structured Data:
- SoftwareApplication schema
- Organization schema
- BreadcrumbList schema
- AggregateRating schema

## 📊 Performance

### Target Lighthouse Scores:
- Performance: 95-100
- Accessibility: 95-100
- Best Practices: 95-100
- SEO: 100

### Optimizations:
- Static site generation
- CSS minification
- HTML compression
- Image optimization ready
- Lazy loading support
- Preconnect to external domains

## 🚀 Deployment

### Vercel (Recommended)
```bash
npm i -g vercel
vercel
```

### Netlify
```bash
npm i -g netlify-cli
netlify deploy --prod
```

### Manual (Nginx)
```bash
npm run build
# Copy dist/ to server
# Configure Nginx (see nginx.conf)
```

## 📝 Before Going Live

1. [ ] Update site URL in `astro.config.mjs`
2. [ ] Update environment variables in `.env`
3. [ ] Create OG image (1200x630px) at `/public/images/og-image.jpg`
4. [ ] Update social media links in footer
5. [ ] Test all links
6. [ ] Run Lighthouse audit
7. [ ] Test on mobile devices
8. [ ] Submit sitemap to Google Search Console

## 🛠️ Tech Stack

- **Framework**: Astro 5.16.9
- **UI Library**: React 19.2.3
- **Styling**: TailwindCSS 3.x
- **SEO**: Custom SEO component with structured data
- **Build**: Vite
- **TypeScript**: Full type safety

## 📚 Documentation

- [Quick Start Guide](./QUICK_START.md)
- [SEO Checklist](./SEO_CHECKLIST.md)
- [Astro Docs](https://docs.astro.build)
- [TailwindCSS Docs](https://tailwindcss.com/docs)

## 🐛 Troubleshooting

### CSS Not Loading?
```bash
# Clear cache and restart
rm -rf .astro dist
npm run dev
```

### Build Errors?
```bash
# Clean install
rm -rf node_modules .astro dist
npm install
npm run build
```

### Port Already in Use?
```bash
# Use different port
npm run dev -- --port 3001
```

## 📄 License

MIT

## 🤝 Contributing

Contributions welcome! Please open an issue or PR.

---

Built with ❤️ using Astro, React, and TailwindCSS
