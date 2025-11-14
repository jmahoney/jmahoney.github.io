# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Jekyll-powered blog hosted on GitHub Pages at iterative.co.nz. The site uses the `pot-kettle-black` remote theme and focuses on software engineering, management, career growth, and productivity content.

## Development Setup

Ruby version is managed via `.tool-versions` (ruby 3.4.7). Use `asdf` or similar version manager.

### Local Development

```bash
# Install dependencies
bundle install

# Run local server with live reload
bundle exec jekyll serve --livereload

# Build site (generates to _site/)
bundle exec jekyll build
```

The local server runs at http://localhost:4000 by default.

### Docker Development

```bash
# Build and run via Docker
docker build -t jekyll-site .
docker run -p 4000:4000 -v $(pwd):/site jekyll-site

# Server runs at http://localhost:4000 with live reload
```

## Site Architecture

### Configuration
- `_config.yml`: Main Jekyll configuration including site metadata, navigation, theme settings, and plugins
- Important: Changes to `_config.yml` require server restart (not auto-reloaded)

### Content Structure
- `_posts/`: Blog posts in markdown format with YAML frontmatter
  - Naming convention: `YYYY-MM-DD-title-slug.md`
  - Common frontmatter: `layout`, `title`, `date`, `category`, `feature_image` (optional)
  - Use `<!--more-->` in content to create excerpt breaks on index page
- `_data/`: JSON data files (`author.json`, `social.json`)
- `about.md`: About page content
- `index.html`: Homepage with pagination logic
- `archive.html`: Archive page listing all posts
- `tv.html`: Custom TV page
- `404.html`: Custom 404 error page

### Jekyll Configuration Details
- **Theme**: Remote theme `jmahoney/pot-kettle-black`
- **Plugins**: jekyll-feed, jekyll-paginate, jekyll-sitemap, jekyll-remote-theme, jekyll-seo-tag
- **Pagination**: 5 posts per page
- **Permalink structure**: `/:title` (no date in URLs)
- **Timezone**: Pacific/Auckland

## Deployment

The site auto-deploys to GitHub Pages via GitHub Actions:

1. **Main deployment** (`.github/workflows/jekyll.yml`):
   - Triggers on push to `main` branch or manual workflow_dispatch
   - Builds with Ruby 3.3 and deploys to GitHub Pages
   - Uses `bundle exec jekyll build` with production environment

2. **Scheduled rebuild** (`.github/workflows/scheduled-actions.yml`):
   - Runs daily at 17:17 UTC
   - Triggers the main Jekyll workflow via API call
   - Useful for content with date-based visibility

## Common Tasks

### Creating a New Blog Post

Create a new file in `_posts/` following the naming convention:

```markdown
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD HH:MM:SS +1200
category: Category Name
feature_image: /images/optional-image.jpg  # Optional
---

Your content here.

<!--more-->

Content after this tag appears only on full post page, not on index.
```

### Testing Before Deployment

Always test locally before pushing to main:
```bash
bundle exec jekyll serve --livereload
```

Verify the build completes without errors and check the rendered output at http://localhost:4000.
