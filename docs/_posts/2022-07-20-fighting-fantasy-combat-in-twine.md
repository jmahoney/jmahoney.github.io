---
date: 2022-07-20 00:42:59 +1200
title: Fighting Fantasy Combat in Twine
category: Kata
permalink: /fighting-fantasy-combat-in-twine
---
<img src="https://cheerschopper.files.wordpress.com/2022/07/warlock-of-firetop-mountain.jpeg" width="433" height="728">

August marks the 40th anniversary of the publication of _[The Warlock of Firetop Mountain](https://en.wikipedia.org/wiki/The_Warlock_of_Firetop_Mountain)_, the first volume of the _Fighting Fantasy_ series which combined elements of table-top roleplaying games and _Choose Your Own Adventure_ style books.

_Firetop Mountain_ is notorious for its maze. I spent many hours as a child trying to map that maze and somehow fluked my way out of it. I've also "played" _Firetop Mountain_ with both of my children. My son gave up in the maze. My daughter and I got through it and even killed the Warlock, but didn't get any treasure. I think I put them off RPGs for life.

What has this got to do with programming or continuous improvement or engineering management? Good question! I'll get to the point.

I follow [Rands's advice in _Bored People Quit_](https://randsinrepose.com/archives/bored-people-quit/): "don't forget what it's like to build a thing." So I'll try to spend some time building little things with different tools, either learning something new or improving and building on what I already know.

I've been curious about the [Twine](https://twinery.org/), a tool for making interactive fiction. How complex a gamecan you make? How hard is it to do something more than just  _Choose Your Own Adventure_ style games? I decided to have a crack at implementing the combat found in _Firetop Mountain_.

<!--more-->

It turns out there are [a few different story formats supported by Twine](https://twinery.org/cookbook/terms/terms_storyformats.html). I went with the latest version of the [Harlowe story format](https://twine2.neocities.org/).

Combat in the game based on dice rolls, a skill variable, and, if you want to try it, luck. For the first cut I opted to just do very basic combat against one oponent with no option to try for lucky hits or misses, and no trying to escape the fight.

I started with character generation, rolling stats for you and your opponent:

<script src="https://gist.github.com/jmahoney/541f8f519fa501a727b01f7d3f26b962.js"></script>

Combat in the book is a loop where you roll dice for both players and compare attack scores. Whoever has the best score takes two points of stamina off the other. The fight ends when you or your opponent run out of stamina. I implemented the same loop: each render of the fight page is one round where the attack is worked out, damage is updated and you either win, lose, or keep fighting:

<script src="https://gist.github.com/jmahoney/8f9a5a86760977c20b2df2fa515602b8.js"></script>

My amazing design skills created this user interface:

![a screenshot of combat](https://cheerschopper.files.wordpress.com/2022/07/fighting-fantasy-combat-screenshot.png)

Once I had basic combat in place I set about copying passages from the book into a new story. I started at Passage 1 and proceeded numerically, ignoring the narrative order. The combat code remained fairly generic. I incorporated trying for lucky hits and misses, and allowed players to escape a fight. I used used Harlowe's [Datamap type](https://twine2.neocities.org/#type_data) to encapsulate all the variables in fight, but man, that syntax got ugly fast.

After getting combat fairly reliable and copying out several dozen passages, I was pretty much done with _Firetop Mountain_ in Twine. Could I do the whole thing? Probably. Do I want to? Nah. I'll stick to my really dog-eared book, thanks.