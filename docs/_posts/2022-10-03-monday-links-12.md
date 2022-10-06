---
category: Monday Links
date: 2022-10-03 06:00:01 +1300
title: Monday Links 12
permalink: /monday-links
---

[Simon Willison's recommended engineering practices are rock solid](https://simonwillison.net/2022/Oct/1/software-engineering-practices/):

* Documentation in the same repo as the code
* Mechanisms for creating test data
* Rock solid database migrations
* Templates for new projects and components
* Automated code formatting
* Tested, automated process for new development environments
* Automated preview environments

Also from Simon Willison: [Documentation Unit Tests (or Test-Driven Documentation)](https://simonwillison.net/2018/Jul/28/documentation-unit-tests/)

> Keeping documentation synchronized with an evolving codebase is difficult. Without extreme discipline, it’s easy for documentation to get out-of-date as new features are added.<br />
>One thing that can help is keeping the documentation for a project in the same repository as the code itself. This allows you to construct the ideal commit: one that includes the code change, the updated unit tests AND the accompanying documentation all in the same unit of work.<br />
>When combined with a code review system (like Phabricator or GitHub pull requests) this pattern lets you enforce documentation updates as part of the review process: if a change doesn’t update the relevant documentation, point that out in your review!

In [_Aging Programmer_](https://world.hey.com/jorge/aging-programmer-d448bdec), Jorge Manrubia reflects on 15 years of programming and what he has found to be true for himself.