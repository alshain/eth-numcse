Exercise 2
==========


4
--

&rArr; [PDF: Scan](https://github.com/alshain/eth-numcse/blob/master/02/4.pdf)

5
--

&rArr; [PDF: Scan](https://github.com/alshain/eth-numcse/blob/master/02/5.pdf)

6a
--

&rArr; Code [multA.m](https://github.com/alshain/eth-numcse/blob/master/02/multA.m)

6b
--

Assumed size `n=8`:

````matlab
>> P = [r1; r5; r3; r7; r2; r6; r4; r8]

P =

     1     0     0     0     0     0     0     0
     0     0     0     0     1     0     0     0
     0     0     1     0     0     0     0     0
     0     0     0     0     0     0     1     0
     0     1     0     0     0     0     0     0
     0     0     0     0     0     1     0     0
     0     0     0     1     0     0     0     0
     0     0     0     0     0     0     0     1
````

6c
--

Not yet digitized.

6d
--

````matlab
function y = multA(d1,c,d2,x)
    n = size(d1, 2);
    y = [d1 d2] .* x;
    y(:, 1:n) = y(:, 1:n) +  c .* x(:, n+1:end);
    y(:, n+1:end) = y(:, n+1:end) + c .* x(:, 1:n);
end
````

&rArr; File [multA.m](https://github.com/alshain/eth-numcse/blob/master/02/solveA.m)
