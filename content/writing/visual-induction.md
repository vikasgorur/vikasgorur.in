---
title: "Visualizing an Induction Proof"
date: 2020-03-22T21:08:41+05:30
draft: false
markup: mmark
---

Like many nerds I was obsessed with math in my late teens, until that obsession was replaced by computers and programming.
I recently decided to restart my math education and go back all the way to the beginning.

The beginning, of course, is the set of natural numbers. The natural numbers are defined by induction, thus induction is one
of the primary means of proving results about them.

Here's a typical exercise in induction. Prove by induction that:

$$ 1 + 3 + 5 + ... + (2n-1) = n^2 $$

The algebra is straight-forward:

Let:
$$P(n) = 1 + 3 + 5 + ... + (2n-1)$$

We verify that $$P(1) = 1^2$$.

Since $$2n+1$$ is the next odd number after $$2n-1$$, we can write:

$$\begin{aligned}
P(n+1) &= P(n) + (2n+1) \\
&= n^2 + 2n + 1 \\
&= (n+1)^2 \\
\end{aligned}$$

But this gives us no insight. Why should the sum of the first $$n$$ odd numbers be $$n^2$$. Is this just a co-incidence or part of a general pattern?

The first question can be answered if we draw successive squares as layers wrapping around a central core of $$1$$. In the image below
the zeroth layer is just the small square containing $$1$$ (this drawing only works if we use 0-based indexing).
The next layer (corresponding to $$2^2$$) adds $$3$$ small squares around $$1$$. The next layer after that adds $$5$$ small squares around that to produce $$9$$ small squares in total.

![Visual proof](/images/induction.png)

Extending the analogy, the $$n$$th layer adds two stripes of size $$n$$ and one small square in the corner, for a total of $$2n+1$$. 

So is there a pattern here? The odd/even distinction splits the natural numbers into two sets, and the square is a two-dimensional shape. Is that a connection? What happens if we split the natural numbers into three sets and sum one of them ($$1 + 4 + 7 + ...$$)? More generally, what does $$P(n, k)$$ look like, where

$$P(n, k) = 1 + (k + 1) + (2k + 1) + ... + (nk + 1)$$

We can graph this for a few values of $$k$$. We see that each curve appears to be quadratic. Can we derive the general closed-form expression for this series?

![Visual proof](/images/pnk.svg)

$$\begin{aligned}
P(n, k) &= (0k + 1) + (1k + 1) + (2k + 1) + ... + (nk + 1) \\
&= k(1 + 2 + 3 + ... + n) + (n + 1) \\
&= \frac{kn(n+1)}{2} + (n + 1)\\
&= \frac{k(n^2 + n)}{2} + n+1 \\
&= \frac{k}{2}n^2 + \frac{k+2}{2}n + 1
\end{aligned}$$

When $$k=2$$ this reduces to $$(n+1)^2$$.