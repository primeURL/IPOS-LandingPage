// @ts-check
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';
import tailwind from '@astrojs/tailwind';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://your-domain.com', // Update with your actual domain
  integrations: [
    react(),
    tailwind({
      applyBaseStyles: true,
    }),
    sitemap({
      changefreq: 'weekly',
      priority: 0.7,
      lastmod: new Date(),
    })
  ],
  output: 'static', // Static site generation for maximum SEO performance
  build: {
    inlineStylesheets: 'auto',
    assets: '_assets'
  },
  compressHTML: true,
  vite: {
    build: {
      cssMinify: 'lightningcss',
      rollupOptions: {
        output: {
          manualChunks: {
            'react-vendor': ['react', 'react-dom'],
          },
        },
      },
    },
  },
});
