Exercise 1
==========

1a
--

Arrow matrix sketch

    d 0 0 0 a
    0 d 0 0 a
    0 0 d 0 a
    0 0 0 d a
    a a a a d

1b
--

The code performs a matrix multiplication `O(n^3)` and a matrix-vector multiplication which is `O(n^2)`. For big values of `n`, the runtime is dominated by `O(n^3)`.

1c
--

Replace line *7*:

````matlab
y = A*(A*x);
````

**Explanation**: Changes order of evaluation &rArr; two matrix-vector multiplications &rArr; `O(n^2)`

1d
--

&rArr; Code [arrowmatvec2.m](https://github.com/alshain/eth-numcse/blob/master/01/arrowmatvec2.m)

1e
--

Complexity: `O(n)`

2
--

Not yet digitized.