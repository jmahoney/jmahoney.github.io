FROM jekyll/jekyll:latest

ENV JEKYLL_UID=1000
ENV JEKYLL_GID=1000

#create the site directory and set write permissions for the jekyll user
RUN mkdir /site && chown -R jekyll:jekyll /site

WORKDIR /site

COPY ./docs .

RUN bundle install

CMD jekyll serve --watch --force_polling --future
