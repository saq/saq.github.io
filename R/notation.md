---
layout: r
title: Introduction to R

---


Notes on Scientific Notation and Standard Notation
==================================================

Source: [http://zoonek2.free.fr/UNIX/48_R/02_Programming.txt](http://zoonek2.free.fr/UNIX/48_R/02_Programming.txt)

Sometimes, the numbers get printed in scientific notation, while you
would prefer a more classical notation.

  > x <- as.data.frame(t(t(rcauchy(10)^2)))
  > x
               V1
  1  1.869630e+00
  2  5.909726e-01
  3  6.114153e-01
  4  5.320118e-01
  5  5.699883e+00
  6  2.616534e+04
  7  2.019110e-02
  8  1.910365e-01
  9  2.384527e-03
  10 7.097835e-02

The computer tries to choose between the standard notation
and the scientific one by comparing the length of the
various numbers. In this example, we want at least 7
significant digits (the "digits" option): for this, because
one value is around 2e-3, we need 10 decimal places. But as
we also 2e+4, we end up using as much as 16 characters to
display some of the numbers. On the contrary, in scientific
notation, we only use 12 characters: by parsimony, the
computer chooses the scientific notation.

But we can alter this by adding a penalty to the scientific
notation, with the "scipen" option: here, we add a
5-character penalty to the scientific notation; as 
16 <= 12 + 5, we keep the standard notation.

  > options(scipen=5)
  > x
                  V1
  1      1.869630292
  2      0.590972584
  3      0.611415260
  4      0.532011822
  5      5.699882601
  6  26165.335966629
  7      0.020191104
  8      0.191036531
  9      0.002384527
  10     0.070978346

Sometimes, when we want a greater control on the way the
numbers are printed (typically when you are writing the
"print" method of an object you have just defined), you can
resort to the lower-level "formatC" function, that
transforms numbers into strings, allows you to choose
between integer, standard or scientific notation, that
allows you to add marks between thousands, millions, etc.,
that allows you to change the symbol used as decimal point,
that allows you to align the numbers on the left or on the
right.

  > formatC(pi, digits=2, width=8, format="f")
  [1] "    3.14"

  > formatC(pi, digits=4, width=8, format="f")
  [1] "  3.1416"

  > formatC(pi, digits=4, width=8, format="f", flag="-")   # Flush left
  [1] "3.1416  "

  > formatC(1e6, digits=4, width=20, format="f", big.mark=",")
  [1] "        1,000,000.0000"

  > formatC(1e6, digits=0, width=20, format="f", big.mark=",")
  [1] "             1,000,000"

  > formatC(pi * 1e6, digits=9, width=20, format="f", big.mark=",", small.mark=" ")
  [1] "   3,141,592.65358 9793"

  > formatC(pi * 1e6, digits=9, width=20, format="f", big.mark=" ",
  +         small.mark=" ", small.interval=3, decimal.mark=",") # in France...
  [1] "   3 141 592,653 589 793 "

There is also a "format" function (slightly less powerful),
a "prettyNum" function (a variant of "format"), a
"format.pval" function (for p-values).



