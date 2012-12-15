Problem 19
-----------

19a
---

[![19a.jpg](https://raw.github.com/alshain/eth-numcse/master/07/A19a_small.jpg)](https://raw.github.com/alshain/eth-numcse/master/07/A19a.jpg)

19b
---

````matlab
function [ y ] = toepm( c, r, x )
    % Acc to Lecture 11, Slide 35
    n = length(c);
    z = [c; r(n:-1:2)];
    y = [x; zeros(n-1, 1)];
    % Acc to Lecture 11, Slide 38
    y = ifft(n*fft(y) .* fft(z));
    y = y(1:n);
end
````

19c
----

`toepmatmult()` uses a matrix-vector product and is thus `O(n^2)`, whereas `toepm()` uses the approach described in the lecture slides, which is said to be `O(nlogn)`.

19d
----

![A19d.png](https://raw.github.com/alshain/eth-numcse/master/07/A19d.png)




