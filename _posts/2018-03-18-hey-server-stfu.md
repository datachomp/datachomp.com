---
layout: post
title: "Hey server, STFU"
date: 2018-03-18 10:49:12 -0500
comments: false
categories:
---

In the modern dev world, kubernetes and kafka have created quite a bit of technical climate change (not to be confused with the real climate change of bitcoin). Needing to better understand this hype-cycle, I thought it would fun to get a little 1u server and play with tech's Bravest New World of complexity.

### Software
I was raised by VMware ESX and while I still enjoy many aspects of the software, VMware the company has just completely worn me out. Speaking of terrible companies, VirtualBox is owned by Oracle so scratch them off the list too. As more and more metered virtual server providers ("cloud" for short) keep moving to the KVM hypervisor, it has moved up on my requirements list. Needing KVM + containers focused my attention on [Proxmox](https://www.proxmox.com/en/). So far, easier to use than ESX and their Community subscription plan is pretty cheap.  

### Hardware
I have a baby rack which means I need a baby server. Local Chili historian [Sam](https://twitter.com/snellingio) was getting rid of some old 1u short depth supermicros, so I took one off his hands.  When I fired up the server, it was approaching 75-80 decibels of fan noise. This is not acceptable in my office. I have a strict policy around nothing being louder than the muffled cries of failing tests and broken builds.  

### The fix
Right away, I ordered two of the [1u Noctua fans](https://noctua.at/en/products/fan/nf-a4x20-pwm) because the existing fans in the case were...not Noctua. Some of you might try to label me an elitist by only using Noctua fans, and the ones that don't are wrong. The fan in the powersupply was secured using a discount toxic waste hardening compound. That was the best guess I had given that the manufacturer is Ablecom (no link because they are not worth it). I just took wirecutters and disconnected the fan.  
There wasn't a HDD chases in this case, so I used adhesive velcro as a sound dampening 'bay'. Being unable to replace a fan in the power supply, and the CPU having a completely passive heat sink, I put down some more velcro for the 'fan bay' and used the 1u noctua's in a side-by-side setup to move air.

### Results
The above fixes dropped the overall noise of the case to around 20-25 decibels. The case does run a little hotter (2C to 5C) than the original setup, but it is worth the silence. Proxmox was a breeze to setup and start using, which means the only thing I can do now to put off learning kubernetes is writing a blog post about making a case more silent.
