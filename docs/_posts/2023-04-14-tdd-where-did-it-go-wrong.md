---
category: Friday Videos
date: 2023-04-14 13:26:01 +1200
title: TDD, Where Did It All Go Wrong, a talk by Ian Cooper
permalink: /tdd-where-did-it-all-go-wrong
tags: [programming, testing, tdd]
---

[This classic talk by Ian Cooper](https://www.youtube.com/watch?v=EZ05e7EMOLM) is a breath of fresh air. Copper quick;y covers Test Driven Development as it is generally practiced, the arguments against TDD and why those arguments *feel* right, and then goes back to the principles and practices of TDD as described by [Kent Beck in *Test Driven Development By Example*](https://bookshop.org/a/14808/9780321146533).

The two points that have changed my game:

* Test modules, not classes - which means you need to think much more about the design of your system, the actual interfaces that programmers will use, and the flow of data. That eventually leads you to [ports and adapters](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)), which Cooper briefly talks about at the end.

* Refactoring is the key part of the process. If you properly refactor from working but filthy to working and clean when you intitally develop your system you should be able to continue to maintain your code, making changes to the implementation details without having to change tests.

The talk is an hour long, but it's well worth it.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/EZ05e7EMOLM?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>