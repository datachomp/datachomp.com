---
layout: post
title: "The Technical Interview"
date: 2017-10-09 10:49:12 -0500
comments: false
categories:
---

### The Technical Interview:

We've been looking to expand our team here at DataChomp Enterprise Software And Data Architecture Solutions (DCESADAS for short). We found an absolutly great candidate. We passed all of his phone interviews, he also also seemed to enjoy talking to the business team... Only one item remained: How our company would pass his technical interview.
  
  
### Welcome to the Show:
We were a bit worried as he had not communicated anything about the technical interview, only a date. Our initial goal was to have a computer and walk him through what we do. Hoping to impress him with our systems, how we approach product development/maintenance, even our humane approach to oncall...when he showed up with only a whiteboard, we knew we were screwed.
<br/>
<br/>
<br/>
The first question was rough. He asked us to write board a fibinacci sequence in Rust. Thinking this might be a homerun for us, I offered to show him how we actually use fibinacci in our backend job system for retry backoff. 'Do you build it in Rust?'' he proded. "Nope, It wouldn't really make sense to do it in Rust because... well none of our stack is Rust, but I am still happy to show you a practical implementation of what you just asked." He responded 'I'm sorry, I ask this of all companies I'm interviewing. I need to you do a fibinacci sequence, in Rust, on the whiteboard.'' I grab the marker, trying to recall any sort of syntax from the various blog posts I've used to determine that Rust isn't a good fit for us...  I write `fibinacci.rs` on the board, then begin my solution:
```
print!("1");
print!("1");
print!("2");
print!("3");
```
He interupts 'Please start with 0'. I respond "That is the problem you have with this solution?" It didn't improve from there.
<br/>
<br/>
<br/>
The second question was brutal. He starts with 'You have sheet of cake, and you need to serve 8 equal servings to guests. How would you do this using only 3 cuts?' My immediate thought was, we're not a bakery, is this candidate confused about what we do? Second, I thought I might impress him a more practical answer - "We take our planning very seriously here. If you worked here with us, you would see our process help us understand the requirements up front. We actively avoid tools that break after 3 cuts like this knife you speak of. We would just make 8 cupcakes for everyone instead of naively walking into a situation with guests that will fuss over unequal serving proportions." This attempt at reason fell on unwanting ears. He counters: 'What if cupcakes don't exist? Please solve the problem.'  What if cupcakes don't exist??? I did not take enough mind altering stimuli for this interview and I threw out the best answer I could with cutting and stacking the sheets. He seemed pretty content with the answer, and I was quite malcontent with the question.... but everyone said he is a great candidate and I knew I had to keep playing along if we were going to get this great hire.
<br/>
<br/>
<br/>
The final 5-10 minutes of the interview, he changed tones and became very friendly - he seemed to be playing his own good cop/bad cop role. He asked what questions I had for him. Even though I was still thinking about the previous excercises, I managed to get out a couple questions like how 'how do you like working on a team?'... he gave the usual contrived and non-specific answers 'Teams are great, teams are very important. I work great on teams, and I also work great on non-teams.'
<br/>
<br/>
<br/>
### Next Step Downward:
Weeks pass and we hear nothing from our top candidate. We were trying to figure out how to move forward as a company, but this candidate just seemed to move at their own opaque pace.  We've been interviewing other people to hire, but they too seem to think that asking theoretical obstical course questions is the best way to figure out how we might build something as a team. One of our business competitors, who just raised another $15M of VC funds, has people dedicated to the interview process who do nothing other than harvest answers to the bizarro questions candidates might have.  Many developers sign with that company, but we tend to see them interviewing again in 8 months when they realize that the actual job was nothing like they thought. I check my inbox, looks like our great candidate signed with other company. Time to start over.
