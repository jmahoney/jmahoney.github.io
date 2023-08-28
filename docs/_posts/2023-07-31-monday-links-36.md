---
category: Monday Links
date: 2023-07-31 05:00:00 +1200
title: Monday Links 36
permalink: /monday-links-6
tags: ["video-games", "git", "github", "debugging", "nintendo", "steam", "institutional-knowledge", "zelda", "dota"]
---

[This article about the physics code in *Legends of Zelda: Tears of the Kingdom*](https://www.polygon.com/legend-zelda-tears-kingdom/23737921/tears-of-the-kingdom-bridge-physics-game-devs-explain) digs into *why* the game is so flexible yet stable: a stable team with deep knowledge of what it has built. 

> “In addition to the overall hard work of the team, the institutional knowledge is clearly a factor in why this ended up being so smoothly done,” Moon said. “The more stable and happy people are, the more they are able to make games of this quality. If you want good games, you have to give a damn about the people making them.”

Speaking about video games and quality, I very much enjoyed [this nerdy recap of how Valve fixed a bug in *Dota* that kind of magically appeared after an update.](https://steamcommunity.com/games/dota2/announcements/detail/3640648066072340346)

> The roots of the bug were introduced as far back as the Techies update last year, when we unveiled a rework of their abilities and playstyle. This rework created a bug where Techies’ Sticky Bombs didn't expire, and in some cases became controllable by the casting player. But interestingly, because of the parameters of the game at the time, there were no circumstances where the bug could actually occur in a match. So it laid dormant until the Twin Gates appeared with The New Frontiers 7.33 Update this past spring.
>
> Suddenly, Techies players were able to create guided Sticky Bombs they could move around the map, raining down unlimited lethal explosives on enemy players. This was... a bit of an advantage. So it wasn't long before we started hearing rumblings on our github.

And another nerdy deep dive from GitHub, [discussing how they updated how merges are done when triggered via their web UI](https://github.blog/2023-07-27-scaling-merge-ort-across-github/).