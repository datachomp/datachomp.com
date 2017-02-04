---
layout: post
title: "Gentle Opinion on Go Dependencies"
date: 2017-02-02 16:49:12 -0500
comments: true
categories:
---

#### Gentle Intro:

As we all know, programming languages exist to serve [postgres](https://www.postgresql.org/). While they might try to distinguish themselves on concepts such as 'object oriented', 'functional', or 'unreadable'... it really just amounts to a different color eye shadow on the beautiful face of postgres.  
  
One can also observe a lot of similarities in web programming too. For example, ruby has a web framework named [rails](http://rubyonrails.org/), elixir too has a [rails framework](http://www.phoenixframework.org/), and even go has a [rails framework](http://gobuffalo.io/).  

#### Gentle Problem:
    
Like many of you, since the election, I've spent day after day trying to learn go. This is commonly called a Go-Loop. This has let me observe in all kinds of interesting discussions in this languages community. One of my favorite ones is the dependency holy war. One of these groups, lets call them ex-rubyist, think that every problem can be solved by pulling in another dependency, and coding in go is really just a series of struct juggling and nil checks.  
  
However, the other side is a strong group of people, let's call them go programmers,  that think you should build everything in stdlib. While I understand a purist point of view as much as the next person, my ideal of a good time isn't pretending every file in my project is something hand crafted that I can list on etsy.

#### Gentle Solution:
  
Even though I've tried to exercise and eat better, I still don't have the physical endurance to handle all the eye rolling from when these two groups get together. Thusly, I propose a compromise. I have named this compromise the "gorilla-burn stack". Just use dependencies from [gorilla](http://www.gorillatoolkit.org/) and [spf13](https://github.com/spf13). They are very high quality and solve important core problems without getting lost in the weeds.  
  
For the dependency heavy person, this approach will get you to take a breath and build your app rather than trying to assemble it...you might even learn go in the process.
  
For the purists, this will allow you to keep the moral high ground of a small number of dependencies while building, as well as allow you to not look like a complete douche when talking to who are focused on solving problems greater than ones suffixed with .go
