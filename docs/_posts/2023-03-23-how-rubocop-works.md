---
category: Friday Videos
date: 2023-03-24 06:00:01 +1300
title: "Analyzing an analyzer - A dive into how RuboCop works by Kyle d'Oliveira"
permalink: /rubyconf-2022-how-rubocop-works
youtube: pSCMgcttW4c
tags: ["ruby", "rubocop", "conference-talk", "kyle-doliveira"]
---

Linters and codeformatters are my favourite kinds of tool because they promote consistency, uncover complexity, and save teams from nonsense issues.

The other thing about a linter is that it seems like one of those problems that *seems* easy on the surface but has a potentially huge amount of complexity as soon as you think about it. [This RubyConf by Kyle d'Oliveira](https://www.youtube.com/watch?v=pSCMgcttW4c) discusses [RuboCop](https://github.com/rubocop/rubocop), the most popular linter for Ruby.

Kyle briefly talks about how his organisation uses RuboCop, then does a short dive into how RuboCop implements its rules using abstract syntax trees, depth first searching, and other techniques. This talk is perfect if you feel like diving deep, just for a little bit.


<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/pSCMgcttW4c?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>