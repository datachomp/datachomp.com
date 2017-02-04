---
layout: post
title: "Gentle Opinion on Go Dependencies"
date: 2017-02-02 16:49:12 -0500
comments: true
categories:
---

#### Gentle Intro:

As we all know, programming languages exist to serve [postgres](https://www.postgresql.org/). While they might try to distinguish themselves on concepts such as 'object oriented', 'functional', or 'unreadable'... it really just amounts to a different color eyeshadow on the beautiful face of postgres.  
  
One can also observe a lot of similarities in web programming too. For example, ruby has a web framework named [rails](http://rubyonrails.org/), elixir has a [rails framework](http://www.phoenixframework.org/), and even go has a [rails framework](http://gobuffalo.io/).  

#### Gentle Problem:
  
The success of these rails-like frameworks results in 2 types of devs. Those that think you simply assemble your web app followed by the opposite group that thinks you must build your web app. Pair that with a language like go which has a bit of a spartan approach to dependency management, and you definitely start to stoke the fire of opinions with jet fuel.
  
One of these groups, let's call them "omasake", think that every problem can be solved by pulling in another dependency, and coding in go is really just a series of struct juggling and nil checks.  
  
The other side, let's call them "ohno-masake", think you should build everything with std lib. While I understand a purist point of view as much as the next person, my idea of a good time isn't pretending every file in my project is something hand crafted that I can list on etsy.

#### Gentle Solution:
  
Even though I've tried to exercise and eat better, I still don't have the physical endurance to handle all the eye rolling from when these two groups argue. Thusly, I propose a compromise. I have named this compromise the "gorilla-burn stack". Just use dependencies from [gorilla](http://www.gorillatoolkit.org/) and [spf13](https://github.com/spf13). They are very high quality and solve important core problems without getting lost in the weeds.  
  
For the dependency heavy person, this approach will get you to take a breath and build your app rather than trying to assemble it...you might even learn go in the process.
  
For the purists, this will allow you to keep the moral high ground of a limited number of dependencies while building. In addition, you won't look like a complete douche when talking to people solving problems greater than suffixed with .go
