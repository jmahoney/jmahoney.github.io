# Jekyll Migration Plan: v3.10 → v4.4 with GitHub Actions

## Executive Summary

This document outlines the migration plan for iterative.co.nz from Jekyll 3.10 (using the `github-pages` gem) to Jekyll 4.4 with GitHub Actions deployment. This migration will provide access to the latest Jekyll features, unrestricted plugin support, and more control over the build process.

## Current State Assessment

### Infrastructure
- **Jekyll Version**: 3.10.0 (locked by github-pages gem v232)
- **Ruby Version**: 3.3.6 ✅ (meets Jekyll 4.4 requirement of Ruby 2.7+)
- **Repository Structure**: Jekyll files in `/docs` subdirectory
- **Deployment**: GitHub Pages automatic Jekyll build
- **Domain**: iterative.co.nz (via CNAME)

### Dependencies
- `github-pages` gem (provides Jekyll + whitelisted plugins)
- `jekyll-feed` ~0.12
- `jekyll-paginate`
- `jekyll-sitemap`
- `activesupport` 7.0.7.1 (pinned)
- `webrick` ~1.8.2

### Site Configuration
- **Theme**: Remote theme `jmahoney/pot-kettle-black`
- **Content**: 109 posts in `_posts/` directory
- **Pagination**: 5 posts per page
- **Permalink Style**: `/:title`
- **Timezone**: Pacific/Auckland
- **Analytics**: Google Analytics (G-S0Z26TE7Z5)

## Target State

### Infrastructure
- **Jekyll Version**: 4.4.0 (latest as of January 2025)
- **Ruby Version**: 3.3.6 (already compatible)
- **Repository Structure**: Jekyll files in repository root (cleaner structure)
- **Deployment**: GitHub Actions workflow
- **Domain**: iterative.co.nz (unchanged)

### Benefits
- ✅ Access to Jekyll 4.4 features and improvements
- ✅ Use any Jekyll plugins (not limited to GitHub whitelist)
- ✅ More control over build process
- ✅ Better error visibility in Actions logs
- ✅ Future-proof architecture
- ✅ Support for Rouge 4 syntax highlighter
- ✅ Better timezone handling with tzinfo v2
- ✅ Webrick included by default (no manual Gemfile addition needed)

## Migration Phases

### Phase 1: Repository Restructuring

**Objective**: Move Jekyll files from `/docs` to repository root

**Tasks**:
1. Move all Jekyll content from `/docs` to `/`:
   - `_config.yml`
   - `_posts/` directory (109 posts)
   - `_data/` directory
   - `assets/` directory
   - `images/` directory
   - `index.html`
   - `about.md`
   - `archive.html`
   - `tv.html`
   - `404.html`
   - `Gemfile` and `Gemfile.lock`

2. Keep `CNAME` in root (already exists)

3. Update `.gitignore`:
   ```
   _site/
   .jekyll-cache/
   .sass-cache/
   .bundle/
   vendor/
   ```

4. Remove now-empty `/docs` directory

**Rollback Strategy**: Keep `/docs` folder in a separate branch until production is verified

---

### Phase 2: Gemfile Migration

**Objective**: Update dependencies for Jekyll 4.4 compatibility

**New Gemfile Structure**:
```ruby
source "https://rubygems.org"

# Jekyll 4.4
gem "jekyll", "~> 4.4.0"

# Required by Jekyll 4.4
gem "csv"

# Plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-remote-theme"
  gem "jekyll-seo-tag"
end

# Platform-specific dependencies
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Web server
gem "webrick", "~> 1.8"
```

**Key Changes**:
- ❌ Remove `github-pages` gem
- ✅ Add explicit `gem "jekyll", "~> 4.4.0"`
- ✅ Add `csv` gem (required by Jekyll 4.4)
- ✅ Add `jekyll-remote-theme` explicitly
- ✅ Add `jekyll-seo-tag` if needed by theme
- ❌ Remove `activesupport` pinned version
- ✅ Update version constraints for Jekyll 4 compatibility

**Commands**:
```bash
bundle update
bundle install
```

---

### Phase 3: Configuration Updates

**Objective**: Update `_config.yml` for Jekyll 4 compatibility

**Changes Required**:

1. **Plugin List** - Ensure matches Gemfile:
   ```yaml
   plugins:
     - jekyll-feed
     - jekyll-paginate
     - jekyll-sitemap
     - jekyll-remote-theme
   ```

2. **Remove GitHub Pages Specific Settings** (if any)

3. **Review Exclusions** - Jekyll 4 has expanded default exclusions:
   - User exclusions are now added to defaults (not replacing)
   - Most exclusions are handled automatically

4. **Verify Kramdown Configuration**:
   - Jekyll 4 requires kramdown v2.x
   - Ensure `kramdown-parser-gfm` is available

**Breaking Changes to Check**:

- **`post_url` Tag Behavior**: 
  - Jekyll 4 automatically prepends `baseurl` to post_url output
  - Search for patterns like `{{ site.baseurl }}{% post_url ... %}`
  - Remove manual baseurl prefix if found
  - Command to check: `grep -r "baseurl.*post_url" _posts/ _layouts/ _includes/`

- **Static Files in Collections**:
  - If using non-post collections, ensure `output: true` is set

---

### Phase 4: GitHub Actions Workflow Setup

**Objective**: Create automated build and deployment workflow

**File**: `.github/workflows/jekyll.yml`

```yaml
name: Deploy Jekyll site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.3'
          bundler-cache: true
          
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
        
      - name: Build with Jekyll
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
          
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

**GitHub Pages Settings**:
1. Navigate to: Repository Settings → Pages
2. Under "Build and deployment"
3. Change Source from "Deploy from a branch" to "GitHub Actions"

---

### Phase 5: Staging & Testing Strategy

**Objective**: Validate migration before production deployment

#### Option A: Local Testing (Recommended First Step)

1. **Create Migration Branch**:
   ```bash
   git checkout -b jekyll-4-migration
   ```

2. **Apply All Changes** (Phases 1-3)

3. **Test Locally**:
   ```bash
   bundle install
   bundle exec jekyll serve
   ```
   - Visit http://localhost:4000
   - Test all functionality

#### Option B: Staging Branch Deployment

1. **Create Staging Workflow**:
   - Modify workflow to trigger on `staging` branch
   - Deploy to separate GitHub Pages environment
   
2. **Alternative**: Create temporary staging repository
   - Fork or create new repo `jmahoney.github.io-staging`
   - Apply migration changes
   - Deploy to `username.github.io-staging`

#### Validation Checklist

- [ ] **Homepage** renders correctly
- [ ] **Pagination** works (5 posts per page, multiple pages)
- [ ] **Navigation links** all functional
  - [ ] Home
  - [ ] Archive
  - [ ] Engineering Manager's Bookshelf
  - [ ] About
  - [ ] TV
  - [ ] Feed
- [ ] **Individual posts** render correctly
- [ ] **Remote theme** (`pot-kettle-black`) loads properly
- [ ] **Images** display correctly
- [ ] **RSS Feed** (`/feed.xml`) generates properly
- [ ] **Sitemap** (`/sitemap.xml`) generates correctly
- [ ] **Google Analytics** tracking code present
- [ ] **Custom domain** (iterative.co.nz) resolves correctly
- [ ] **404 page** displays for invalid URLs
- [ ] **Build time** is reasonable (< 5 minutes)
- [ ] **No broken links** (use link checker tool)
- [ ] **Mobile responsiveness** maintained
- [ ] **Cross-browser compatibility** (Chrome, Firefox, Safari)

#### Testing Commands

```bash
# Build site
bundle exec jekyll build

# Serve locally with live reload
bundle exec jekyll serve --livereload

# Build with production environment
JEKYLL_ENV=production bundle exec jekyll build

# Check for broken links (requires htmlproofer gem)
bundle exec htmlproofer ./_site --disable-external
```

---

### Phase 6: Production Deployment

**Objective**: Deploy to production with monitoring

**Deployment Steps**:

1. **Final Review**:
   - Ensure all staging tests pass
   - Review commit history
   - Update MIGRATION_PLAN.md with any discovered issues

2. **Merge to Main**:
   ```bash
   git checkout main
   git merge jekyll-4-migration
   git push origin main
   ```

3. **Monitor Workflow**:
   - Navigate to Actions tab
   - Watch "Deploy Jekyll site to Pages" workflow
   - Check for any errors or warnings
   - Typical first build: 3-5 minutes
   - Subsequent builds: 1-2 minutes (with caching)

4. **Verify Production**:
   - Visit https://iterative.co.nz
   - Run through validation checklist again
   - Check multiple pages/posts
   - Verify RSS feed works in feed reader
   - Test from different devices/browsers

5. **Monitor for 24-48 Hours**:
   - Watch for any user reports
   - Monitor analytics for traffic drop
   - Check for any broken external links

**Rollback Plan** (if needed):

1. **Immediate Rollback**:
   ```bash
   # Revert to previous commit
   git revert HEAD
   git push origin main
   ```

2. **Full Rollback to github-pages**:
   - Restore `/docs` folder from backup branch
   - Revert Gemfile changes
   - Change GitHub Pages source back to "Deploy from a branch: main → /docs"
   - Delete `.github/workflows/jekyll.yml`

---

## Risk Assessment

### High Risk Items
1. **Remote Theme Compatibility**: Theme `pot-kettle-black` may need Jekyll 4 updates
   - **Mitigation**: Test thoroughly in staging
   - **Backup Plan**: Fork theme and fix compatibility issues

2. **Custom Domain DNS Propagation**: CNAME changes might cause temporary downtime
   - **Mitigation**: CNAME file content should remain unchanged
   - **Backup Plan**: Wait for DNS TTL expiration (usually < 1 hour)

### Medium Risk Items
1. **Plugin Compatibility**: Some plugins may have Jekyll 4 specific versions
   - **Mitigation**: Use latest versions in Gemfile
   - **Testing**: Verify all plugins load without warnings

2. **Build Time Increase**: Jekyll 4 may build slower/faster than 3.10
   - **Mitigation**: Monitor first few builds
   - **Optimization**: Use GitHub Actions caching (already in workflow)

### Low Risk Items
1. **Content Rendering**: Markdown/Liquid syntax changes
   - **Mitigation**: Jekyll 4 maintains backward compatibility
   - **Testing**: Spot check various post types

2. **SEO Impact**: URL structure changes
   - **Mitigation**: Permalink structure unchanged in migration
   - **Verification**: Check sitemap.xml after deployment

---

## Timeline Estimate

| Phase | Estimated Time | Dependencies |
|-------|---------------|--------------|
| Phase 1: Restructuring | 30 minutes | None |
| Phase 2: Gemfile Updates | 15 minutes | Phase 1 |
| Phase 3: Config Updates | 30 minutes | Phase 2 |
| Phase 4: GitHub Actions | 20 minutes | Phase 3 |
| Phase 5: Testing | 2-4 hours | Phase 4 |
| Phase 6: Deployment | 1 hour | Phase 5 |
| **Total** | **5-7 hours** | |

**Note**: Timeline assumes no major compatibility issues discovered during testing.

---

## Post-Migration Tasks

### Immediate (Day 1)
- [ ] Monitor GitHub Actions workflow for successful builds
- [ ] Verify site accessibility at iterative.co.nz
- [ ] Check Google Analytics tracking
- [ ] Test RSS feed in feed readers

### Short-term (Week 1)
- [ ] Monitor for any user-reported issues
- [ ] Review build times and optimize if needed
- [ ] Update README.md with new build instructions
- [ ] Document any discovered gotchas in this file

### Long-term (Month 1)
- [ ] Remove backup `/docs` folder if everything stable
- [ ] Consider adding additional Jekyll 4 features:
  - Cached rendering for better performance
  - Hook into Jekyll 4's improved plugin system
- [ ] Review and update dependencies quarterly

---

## Additional Resources

### Jekyll 4 Documentation
- [Jekyll 4.4 Release Notes](https://jekyllrb.com/news/2025/01/27/jekyll-4-4-0-released/)
- [Upgrading from 3.x to 4.x](https://jekyllrb.com/docs/upgrading/3-to-4/)
- [GitHub Actions for Jekyll](https://jekyllrb.com/docs/continuous-integration/github-actions/)

### GitHub Pages
- [About GitHub Pages and Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll)
- [Configuring a publishing source](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)

### Community Resources
- [Jekyll Talk Forum](https://talk.jekyllrb.com/)
- [Jekyll GitHub Discussions](https://github.com/jekyll/jekyll/discussions)

---

## Notes & Discoveries

### Pre-Migration Notes
- Current site has no existing GitHub Actions workflows except `scheduled-actions.yml`
- No `post_url` usage detected in initial grep (but should verify more thoroughly)
- Site uses custom permalink structure: `/:title`

### During Migration
*Document any issues, workarounds, or discoveries here during the migration process*

### Post-Migration
*Document any lessons learned or optimizations made after successful deployment*

---

## Sign-off

- [ ] Migration plan reviewed and approved
- [ ] Backup of current site created
- [ ] All dependencies documented
- [ ] Rollback plan understood and tested
- [ ] Team notified of migration schedule
- [ ] Monitoring alerts configured

---

**Document Version**: 1.0  
**Created**: 2025-10-13  
**Last Updated**: 2025-10-13  
**Owner**: Joe Mahoney
