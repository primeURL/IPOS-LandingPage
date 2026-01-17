#!/bin/bash

# SEO Verification Script for IPOS Landing Page
# Run this to quickly verify all SEO elements

echo "🔍 IPOS Landing Page - SEO Verification"
echo "========================================"
echo ""

URL="http://localhost:4321"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if server is running
echo "📡 Checking if server is running..."
if curl -s --head "$URL" | head -n 1 | grep "200" > /dev/null; then
    echo -e "${GREEN}✅ Server is running${NC}"
else
    echo -e "${RED}❌ Server is not running. Start with: npm run dev${NC}"
    exit 1
fi
echo ""

# Test 1: Title Tag
echo "1️⃣  Checking Title Tag..."
if curl -s "$URL" | grep -q "<title>"; then
    TITLE=$(curl -s "$URL" | grep -o "<title>.*</title>" | sed 's/<[^>]*>//g')
    TITLE_LENGTH=${#TITLE}
    echo -e "${GREEN}✅ Title tag found${NC}"
    echo "   📝 Title: $TITLE"
    echo "   📏 Length: $TITLE_LENGTH characters"
    if [ $TITLE_LENGTH -ge 50 ] && [ $TITLE_LENGTH -le 60 ]; then
        echo -e "   ${GREEN}✅ Length is optimal (50-60 chars)${NC}"
    else
        echo -e "   ${YELLOW}⚠️  Recommended: 50-60 characters${NC}"
    fi
else
    echo -e "${RED}❌ Title tag not found${NC}"
fi
echo ""

# Test 2: Meta Description
echo "2️⃣  Checking Meta Description..."
if curl -s "$URL" | grep -q 'meta name="description"'; then
    echo -e "${GREEN}✅ Meta description found${NC}"
    DESC=$(curl -s "$URL" | grep -o 'meta name="description" content="[^"]*"' | sed 's/.*content="\(.*\)"/\1/')
    DESC_LENGTH=${#DESC}
    echo "   📏 Length: $DESC_LENGTH characters"
    if [ $DESC_LENGTH -ge 155 ] && [ $DESC_LENGTH -le 160 ]; then
        echo -e "   ${GREEN}✅ Length is optimal (155-160 chars)${NC}"
    else
        echo -e "   ${YELLOW}⚠️  Recommended: 155-160 characters${NC}"
    fi
else
    echo -e "${RED}❌ Meta description not found${NC}"
fi
echo ""

# Test 3: Canonical URL
echo "3️⃣  Checking Canonical URL..."
if curl -s "$URL" | grep -q 'rel="canonical"'; then
    echo -e "${GREEN}✅ Canonical URL found${NC}"
else
    echo -e "${RED}❌ Canonical URL not found${NC}"
fi
echo ""

# Test 4: Open Graph Tags
echo "4️⃣  Checking Open Graph Tags..."
OG_COUNT=$(curl -s "$URL" | grep -c 'property="og:')
if [ $OG_COUNT -gt 0 ]; then
    echo -e "${GREEN}✅ Open Graph tags found ($OG_COUNT tags)${NC}"
    if curl -s "$URL" | grep -q 'property="og:title"'; then
        echo "   ✅ og:title"
    fi
    if curl -s "$URL" | grep -q 'property="og:description"'; then
        echo "   ✅ og:description"
    fi
    if curl -s "$URL" | grep -q 'property="og:image"'; then
        echo "   ✅ og:image"
    fi
    if curl -s "$URL" | grep -q 'property="og:url"'; then
        echo "   ✅ og:url"
    fi
else
    echo -e "${RED}❌ Open Graph tags not found${NC}"
fi
echo ""

# Test 5: Twitter Card Tags
echo "5️⃣  Checking Twitter Card Tags..."
TWITTER_COUNT=$(curl -s "$URL" | grep -c 'name="twitter:')
if [ $TWITTER_COUNT -gt 0 ]; then
    echo -e "${GREEN}✅ Twitter Card tags found ($TWITTER_COUNT tags)${NC}"
    if curl -s "$URL" | grep -q 'name="twitter:card"'; then
        echo "   ✅ twitter:card"
    fi
    if curl -s "$URL" | grep -q 'name="twitter:title"'; then
        echo "   ✅ twitter:title"
    fi
    if curl -s "$URL" | grep -q 'name="twitter:image"'; then
        echo "   ✅ twitter:image"
    fi
else
    echo -e "${RED}❌ Twitter Card tags not found${NC}"
fi
echo ""

# Test 6: Structured Data (JSON-LD)
echo "6️⃣  Checking Structured Data..."
JSONLD_COUNT=$(curl -s "$URL" | grep -c 'application/ld+json')
if [ $JSONLD_COUNT -gt 0 ]; then
    echo -e "${GREEN}✅ Structured data found ($JSONLD_COUNT schemas)${NC}"
    if curl -s "$URL" | grep -q '"@type":"SoftwareApplication"'; then
        echo "   ✅ SoftwareApplication schema"
    fi
    if curl -s "$URL" | grep -q '"@type":"Organization"'; then
        echo "   ✅ Organization schema"
    fi
    if curl -s "$URL" | grep -q '"@type":"BreadcrumbList"'; then
        echo "   ✅ BreadcrumbList schema"
    fi
else
    echo -e "${RED}❌ Structured data not found${NC}"
fi
echo ""

# Test 7: robots.txt
echo "7️⃣  Checking robots.txt..."
if curl -s "$URL/robots.txt" | grep -q "User-agent"; then
    echo -e "${GREEN}✅ robots.txt found${NC}"
    if curl -s "$URL/robots.txt" | grep -q "Allow: /"; then
        echo "   ✅ Allows crawling"
    fi
    if curl -s "$URL/robots.txt" | grep -q "Sitemap:"; then
        echo "   ✅ Sitemap URL present"
    fi
else
    echo -e "${RED}❌ robots.txt not found${NC}"
fi
echo ""

# Test 8: XML Sitemap
echo "8️⃣  Checking XML Sitemap..."
if curl -s "$URL/sitemap-index.xml" | grep -q "<?xml"; then
    echo -e "${GREEN}✅ XML sitemap found${NC}"
    URL_COUNT=$(curl -s "$URL/sitemap-index.xml" | grep -c "<loc>")
    echo "   📄 URLs in sitemap: $URL_COUNT"
else
    echo -e "${RED}❌ XML sitemap not found${NC}"
fi
echo ""

# Test 9: Mobile Viewport
echo "9️⃣  Checking Mobile Viewport..."
if curl -s "$URL" | grep -q 'name="viewport"'; then
    echo -e "${GREEN}✅ Viewport meta tag found${NC}"
else
    echo -e "${RED}❌ Viewport meta tag not found${NC}"
fi
echo ""

# Test 10: Semantic HTML
echo "🔟 Checking Semantic HTML..."
H1_COUNT=$(curl -s "$URL" | grep -c "<h1")
if [ $H1_COUNT -eq 1 ]; then
    echo -e "${GREEN}✅ One H1 tag found (optimal)${NC}"
elif [ $H1_COUNT -gt 1 ]; then
    echo -e "${YELLOW}⚠️  Multiple H1 tags found ($H1_COUNT). Recommended: 1${NC}"
else
    echo -e "${RED}❌ No H1 tag found${NC}"
fi
echo ""

# Summary
echo "========================================"
echo "📊 SEO Verification Summary"
echo "========================================"
echo ""

TOTAL_TESTS=10
PASSED_TESTS=0

# Count passed tests
curl -s "$URL" | grep -q "<title>" && ((PASSED_TESTS++))
curl -s "$URL" | grep -q 'meta name="description"' && ((PASSED_TESTS++))
curl -s "$URL" | grep -q 'rel="canonical"' && ((PASSED_TESTS++))
[ $(curl -s "$URL" | grep -c 'property="og:') -gt 0 ] && ((PASSED_TESTS++))
[ $(curl -s "$URL" | grep -c 'name="twitter:') -gt 0 ] && ((PASSED_TESTS++))
[ $(curl -s "$URL" | grep -c 'application/ld+json') -gt 0 ] && ((PASSED_TESTS++))
curl -s "$URL/robots.txt" | grep -q "User-agent" && ((PASSED_TESTS++))
curl -s "$URL/sitemap-index.xml" | grep -q "<?xml" && ((PASSED_TESTS++))
curl -s "$URL" | grep -q 'name="viewport"' && ((PASSED_TESTS++))
[ $(curl -s "$URL" | grep -c "<h1") -eq 1 ] && ((PASSED_TESTS++))

PERCENTAGE=$((PASSED_TESTS * 100 / TOTAL_TESTS))

echo "Tests Passed: $PASSED_TESTS/$TOTAL_TESTS"
echo "SEO Score: $PERCENTAGE%"
echo ""

if [ $PERCENTAGE -eq 100 ]; then
    echo -e "${GREEN}🎉 Perfect! Your landing page is 100% SEO optimized!${NC}"
elif [ $PERCENTAGE -ge 90 ]; then
    echo -e "${GREEN}✅ Excellent! Your landing page is well optimized.${NC}"
elif [ $PERCENTAGE -ge 70 ]; then
    echo -e "${YELLOW}⚠️  Good, but some improvements needed.${NC}"
else
    echo -e "${RED}❌ Needs improvement. Check failed tests above.${NC}"
fi
echo ""

echo "========================================"
echo "📝 Next Steps:"
echo "========================================"
echo ""
echo "1. Run Google Lighthouse in Chrome DevTools"
echo "   - Press F12 → Lighthouse tab → Analyze"
echo ""
echo "2. Test with Google Rich Results:"
echo "   - https://search.google.com/test/rich-results"
echo ""
echo "3. Test Mobile-Friendly:"
echo "   - https://search.google.com/test/mobile-friendly"
echo ""
echo "4. Before deployment:"
echo "   - Create OG image (1200x630px)"
echo "   - Update site URL in astro.config.mjs"
echo "   - Update .env file"
echo ""
echo "🚀 Your landing page is ready for production!"
echo ""
