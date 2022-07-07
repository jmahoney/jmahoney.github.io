---
layout: post
title: “Stack Overflow’s Roberta Arcoverde on Hanselminutes”
date: 07/07/2022 22:15:08 +1200
category: Engineering Management
tags: Hanselminutes, Stack Overflow,
---

Scott Hanselman’s guest on [episode 847 of the Hanselminutes podcast](https://hanselminutes.com/847/engineering-stack-overflow-with-roberta-arcoverde) was [Roberta Arcoverde](https://rla4.com/), the Director of Engineering at [Stack Overflow](https://stackoverflow.com).

Their discussion covered a lot topics, and, to my mind, was a perfect illustration of the complexity and nuances of the engineering manager role. At one point Roberta summed up her role like this:

_“So now I manage the people, right? I manage their careers, I help them grow. And I also have a strategic vision of where we need to be. So it's more of a position it's very similar to what engineering managers and other companies do. But it's a little bit more technical than that too, because I do need to keep my eyes on where the software architecture is, is moving towards what are our strategy in terms of scale and where we want to be and not in the next PR, but in the next three years.”_

Every company does engineering management differently, but that mix of technical detail and strategic focus is common, especially when you get a the manager of managers position.

Anyone curious about the management side swing of the engineering/management pendlum would get a lot out of the things Roberta talked about.

### A few things that resonated with me

**On staying technical:** Roberta talked about it being important for her to still be writing code daily in order to be a manager who can help mentor junior developers, assess the impact of changes, and be confident about the technology. It reminded me of Michael Lopp’s final paragraph of his post [Bored People Quit](https://randsinrepose.com/archives/bored-people-quit/):

_“I’ve gone back and forth on whether managers should code and my opinion is: don’t stop coding. Each week that passes where you don’t share the joy, despair, and discovery of software development is a week when you slowly forget what it means to be a software developer. Over time it means you’ll have a harder time talking to engineers because you’ll forget how they think and how they become bored.”_

**On making changes for good reasons:** Stack Overflow runs on a boring, well-proven and easy to understand architecture. And it runs really, bloody well. 9 on-prem webservers, a monolithic application, and six billion requests a month. So far they haven’t moved to containers or the cloud or microservices because the they haven’t needed to. They use modern measures like the [DORA metrics](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance) to assess their ability to safely ship software and found themselves in good shape.

Stack Overflow still regularly assess whether they should make changes, but it always comes down to “What problem are you trying to solve?”

**On tradeoffs:** While talking about how they achieve such good performance on a small amount of kit, Roberta mentioned that they make a lot of use of service locator patterns rather than dependency injection in order to reduce memory pressure. That stuck out to be as it’s a pattern that makes code hard to test, among other things.

Roberta directly addresses this problem in a Stack Overflow blog post called [Best Practices Can Slow Your Application Down](https://stackoverflow.blog/2021/12/22/best-practices-can-slow-your-application-down/). Over the years they have knowingly traded performance for ability to test. That priority is changing, now, as the team gets bigger and the software is mature, but I bet the team is still going to make sure they are solving the right problem.