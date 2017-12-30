---
title: Security and Code Analysis tools I use
author: Rob
layout: post
permalink: /archives/security-and-code-analysis-tools-i-use/
dsq_thread_id:
  - 888404916
categories:
  - Databases
---
# 

Here are some of the tools I use for Security and Code analysis  (I bet you didn't see that coming from!)

WebConfig Analyzer - you can do a stand alone download and feed your webconfig into it

[WireShark][1] Use this to see what is going on on the network.

 [1]: https://www.wireshark.org/

[Fiddler ][2]- Great for https inspection.

 [2]: https://www.fiddler2.com/fiddler2/

[Netsparker][3] Use it to hit test sites and see if throws back anything useful.

 [3]: https://www.mavitunasecurity.com/communityedition/

[BackTrack 4][4] Not sure what needs to be said here other than the best way to get a white hat, is to take a black hat and bleach it. link has been updated to point to Kali org

 [4]: https://www.kali.org/

  
The backtrack to kodi broken link was fixed by our friends at comparitech, who posted this (helpful VPN guide for Linux)[helpfullinuxvpn]

[helpfullinuxvpn]: https://www.comparitech.com/blog/vpn-privacy/best-vpn-for-linux/

[FXCop][5] I tun this against my code when I want to feel stupid and see how many places I've goofed.  Things putting getters and setters on read only data. Doh!

 [5]: https://www.datachomp.com

[Reflector][6] Other peoples code and programs look pretty fun when uncompiled. Likewise, this is also good for making sure you didn't leave any sensitive information in your own binaries.

 [6]: https://www.red-gate.com/products/dotnet-development/reflector/

FireFox add-ons:

[ViewState][7]

 [7]: https://addons.mozilla.org/en-US/firefox/addon/viewstate-size/

[FireBug][8]

 [8]: https://getfirebug.com/

And then everything else that SnipeyHead ([Blog][9] | [Twitter][10]) uses:

 [9]: https://www.snipe.net/
 [10]: https://twitter.com/#!/snipeyhead

