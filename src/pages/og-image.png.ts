// This is a placeholder - you can use a service like Vercel OG or create a static image
// For now, we'll create a simple SVG that can be converted to PNG

export async function GET() {
  const svg = `
    <svg width="1200" height="630" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" style="stop-color:#020617;stop-opacity:1" />
          <stop offset="50%" style="stop-color:#312e81;stop-opacity:1" />
          <stop offset="100%" style="stop-color:#020617;stop-opacity:1" />
        </linearGradient>
        <linearGradient id="text" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" style="stop-color:#6366f1;stop-opacity:1" />
          <stop offset="50%" style="stop-color:#a855f7;stop-opacity:1" />
          <stop offset="100%" style="stop-color:#ec4899;stop-opacity:1" />
        </linearGradient>
      </defs>
      
      <!-- Background -->
      <rect width="1200" height="630" fill="url(#bg)"/>
      
      <!-- Grid pattern -->
      <pattern id="grid" width="50" height="50" patternUnits="userSpaceOnUse">
        <path d="M 50 0 L 0 0 0 50" fill="none" stroke="rgba(255,255,255,0.02)" stroke-width="1"/>
      </pattern>
      <rect width="1200" height="630" fill="url(#grid)"/>
      
      <!-- Logo -->
      <rect x="100" y="100" width="80" height="80" rx="16" fill="url(#text)"/>
      <text x="140" y="165" font-family="Arial, sans-serif" font-size="48" font-weight="bold" fill="white" text-anchor="middle">IP</text>
      
      <!-- Title -->
      <text x="100" y="280" font-family="Arial, sans-serif" font-size="72" font-weight="bold" fill="white">
        Interview Prep OS
      </text>
      
      <!-- Subtitle -->
      <text x="100" y="350" font-family="Arial, sans-serif" font-size="36" fill="#94a3b8">
        Master Technical Interviews with AI
      </text>
      
      <!-- Features -->
      <text x="100" y="450" font-family="Arial, sans-serif" font-size="28" fill="#cbd5e1">
        ✓ Automated Study Plans  ✓ Progress Tracking
      </text>
      <text x="100" y="500" font-family="Arial, sans-serif" font-size="28" fill="#cbd5e1">
        ✓ Spaced Repetition  ✓ Smart Notes
      </text>
    </svg>
  `;

  return new Response(svg, {
    headers: {
      'Content-Type': 'image/svg+xml',
      'Cache-Control': 'public, max-age=31536000, immutable',
    },
  });
}
