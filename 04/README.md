Exercise 10
===========

10a
---

````matlab
function [ x ] = normaleq( A, b )
    R = chol(A'*A);
    x = R'\(A'*b);
    x = R\x;
end
````

10b
---

````matlab
function [ x ] = qrsolve( A, b )
    [Q, R] = qr(A);
    b = Q'*b;
    x = R\b;
end
`````

&rArr; Code [qrsolve.m](https://github.com/alshain/eth-numcse/blob/master/04/qrsolve.m)
10c
---

Where do `U` and `V` come from?


Exercise 11

11a
---
[![A11a.jpg](https://raw.github.com/alshain/eth-numcse/master/04/A11a_small.jpg)](https://github.com/alshain/eth-numcse/blob/master/04/A11a.jpg)

11b
---

````matlab
function [ alpha, beta ] = lsqest( z, c )
    n = length(z);
    za = [z(2:end); 0];
    zb = [0; z(1:end-1)];
    A = [z; za + zb];
    solution = qrsolve(A, c);
    alpha = solution(1);
    beta = solution(2);
end
````


&rArr; Code [lsqest.m](https://github.com/alshain/eth-numcse/blob/master/04/lsqest.m)

Exercise 12
===========

12a
----
[![A12a.jpg](https://raw.github.com/alshain/eth-numcse/master/04/A12a_small.jpg)](https://raw.github.com/alshain/eth-numcse/master/04/A12a.jpg)

````matlab
function [A b] = A12a(t, y, lambda)
    n = (length(t) - 1) / 2;
    A = fliplr(vander(exp(lambda*t)));
    b = y .* exp(lambda*t*n);
end
`````

&rArr; Code [A12a.m](https://github.com/alshain/eth-numcse/blob/master/04/A12a.m)


