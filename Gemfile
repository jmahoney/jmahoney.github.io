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

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

# Web server
gem "webrick", "~> 1.8"
