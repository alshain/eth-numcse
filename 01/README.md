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
````matlab
function y = arrowmatvec2(d, a, x)
    n = size(x, 1);
    y = zeros(n, 1);
    Ax = y;
    for i = 1:(n-1)
        Ax(i) = y(i) + d(i) * x(i) + a(i) * x(end);
    end
    
    Ax(end) = [a(1:end-1)', d(end)] * x;
    
    for i = 1:(n-1)
        y(i) = d(i) * Ax(i) + a(i) * Ax(end);
    end
    
    y(end) = [a(1:end-1)', d(end)] * Ax;   
end
````

&rArr; File [arrowmatvec2.m](https://github.com/alshain/eth-numcse/blob/master/01/arrowmatvec2.m)

1e
--

Complexity: `O(n)`

2a
--
Asymptotic complexity

 - `Ax = (I + αuv')x`
  `uv'` has complexity `O(n^2)` and results in a matrix, multiplied by `x` is another `O(n^2)` operation.  
 &rArr; `O(n^2)`
 - `Ax = x + αu(v'x)`
  The dot product `v'x` has complexity `O(n)` and results in a scalar, multiplied by `u` is another `O(n)` operation as is the addition to `x`.  
 &rArr; `O(n)`


2c
--

![scan](https://raw.github.com/alshain/eth-numcse/master/01/2c_small.png)

2d
--

Complexity: `O(n^2)` because of the outer product.

2e
--

The structure remains the same, because only `Α` changes.

3a
--

`ones(n, 1)*1:n` has complexity `O(n^2)`.

3b
--
````matlab
function y = multAmin(x)
    y = zeros(length(x), 1);
    y(1) = sum(x);
    acc = y(1);
    for i=2:length(x)
        acc = acc - x(i - 1);
        y(i) = y(i - 1) + acc;
    end
end
````

&rArr; File [multAmin.m](https://github.com/alshain/eth-numcse/blob/master/01/multAmin.m)

3c
--

No solution found without ML.

3f
--

````matlab
>> full(spdiags(D, [-1, 0, 1], n, n))

     2    -1     0     0     0     0     0     0     0     0
    -1     2    -1     0     0     0     0     0     0     0
     0    -1     2    -1     0     0     0     0     0     0
     0     0    -1     2    -1     0     0     0     0     0
     0     0     0    -1     2    -1     0     0     0     0
     0     0     0     0    -1     2    -1     0     0     0
     0     0     0     0     0    -1     2    -1     0     0
     0     0     0     0     0     0    -1     2    -1     0
     0     0     0     0     0     0     0    -1     2    -1
     0     0     0     0     0     0     0     0    -1     1
````
