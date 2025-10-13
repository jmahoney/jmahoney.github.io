FROM ruby:3.1

WORKDIR /site

# Install Jekyll and bundler
RUN gem install jekyll bundler

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install dependencies
RUN bundle install

# Copy the rest of the site
COPY . .

# Expose port 4000
EXPOSE 4000

# Set the default command
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
