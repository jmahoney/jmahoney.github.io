---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Iterative
layout: index
permalink: /
---
I'm Joe Mahoney. I'm a programmer, manager, surf life guard, and local dad from Wellington, New Zealand.

I mainly write about and curate links covering software engineering and management, career growth, continuous improvement, creativity, and productivity.

#### Recent posts

{% for post in site.posts limit:6 %}
* [{{post.title}}]({{post.url}}) &middot; _{{post.date | date: '%B %d, %Y'}}_
{% endfor %}

#### Posts by category

{% assign categories = '' | split: '' %}
{% for category in site.categories %}
    {% assign categoryName = category | first | split: '-' %}
    {% assign categories = categories | concat: categoryName %}
{% endfor %}

{% assign categories = categories | sort %}

{% for category in categories %}
##### {{category}}

{% for post in site.categories[category] %}
* [{{post.title}}]({{post.url}}) &middot; _{{post.date | date: '%B %d, %Y'}}_
{% endfor %}

{% endfor %}


