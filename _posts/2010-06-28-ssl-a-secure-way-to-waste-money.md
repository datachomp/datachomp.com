---
title: 'SSL &#8211; a secure way to waste money'
author: Rob
layout: post
permalink: /archives/ssl-a-secure-way-to-waste-money/
dsq_thread_id:
  - 893413975
categories:
  - AppDev
  - ASP.NET
  - Security
  - Tools
---
# 

It seems like every place I go, companies are dropping an incredible amount money on an overpriced Verisign certificate which essentially proves nothing. I am not going to tirade on Verisign's prices, product, or just the general crappy nature of the company... but I will list alternatives:

The current ones I use and it rocks:  
For http SSL I use: [Start Com - replaced with letsencrypt][1]  
For other services/protocols I tend to use:  
[CA Cert Org][2]

 [1]: https://letsencrypt.org/
 [2]: https://www.cacert.org/

I don't think cacert is any better/worse than startcom, I just mostly use cacert for internal stuff out of habit and I generally like the group.

Equally excellent CA's that are not free:  
[Dynadot.com][3]  
[Rapidssl.com][4]  
[Geotrust.com][5]

 [3]: https://www.dynadot.com/ssl/about.html
 [4]: https://www.rapidssl.com/index_ssl.htm
 [5]: https://www.geotrust.com/