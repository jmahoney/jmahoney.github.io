---
category: Software Development Principles
date: 2022-07-27 00:00:01 +1200
title: Don't rely on your customer's common sense
permalink: /dont-rely-on-your-customers-common-sense
---
In the late 90s I was on the helpdesk at [Toniq](https://toniq.nz). We made dispensary and point of sale software for pharmacies. One day a pharmacist rang up about a “big red box on the screen.” He said he wasn’t sure what he should do next.

I asked the pharmacist to read out the text and it turned out that he had triggered a new feature we had added: when a patient was prescribed a combination of medicines that had an adverse interaction, we would alert the pharmacist so they could advise their patient on the correct course of action. I explained the feature and the pharmacist said it would be helpful. Then he asked me a question that I didn’t expect: “So, should I dispense it?”

For years I would tell this story and laugh about how dumb my customer was. But I was wrong and that wasn’t fair.

We tell our customers that the software we make will help work faster, will let them make better decisions, will steer them in the right direction. And people, naturally, imbue software with authority, likely more than we intend.

It's up to us to make sure that we understand that authority and are careful with how we exercise it.
We’ve all heard stories of people driving through the wilderness or [getting stuck at the top of a mountain](https://www.nzherald.co.nz/travel/truck-almost-topples-off-100-metre-cliff-after-gps-takes-it-on-narrow-road/6UXDNWIDSTKQR6M6HRN2HKCTUI/) because their GPS software told them it was the shortest path. We all laugh at the drivers, but, really, those problems are software failures and developer failures.

So next time when you’re designing workflows, writing copy for messages, or implementing a feature,  ask yourself: _what could go wrong and am I relying on the customer’s common sense to prevent it?_ If you are, take steps to ensure your customer _can’t_ do the wrong thing.
