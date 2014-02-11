---
layout: default
categories: R, ctfs

---

# Scrape CTFS data

{% highlight html %}

library(XML)

dat <- readHTMLTable("http://www.ctfs.si.edu/site/Yasuni/abundance/?size=100", 
                     header = TRUE, which = 3)

{% endhighlight html %}

