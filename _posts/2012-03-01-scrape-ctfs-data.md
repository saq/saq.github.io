---
layout: post
categories: R, ctfs

---



library( XML )

dat <- readHTMLTable( "http://www.ctfs.si.edu/site/Yasuni/abundance/?size=100", header=T, which=3 )
