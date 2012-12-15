Exercise 16
===========

16a
---
```matlab
function B = bernstein(n,t)
    lt = length(t);
    one = ones(lt,1);
    faks = [1 zeros(1,n)];
    onemint = [zeros(lt,n) one]';
    tpot = [one zeros(lt,n)]';
    for i = 1:n
        faks(i+1) = ((n-i+1)/(i))*faks(i);
        onemint(n-i+1,:) = onemint(n-i+2,:).*(1-t);
        tpot(i+1,:) = tpot(i,:).*t;
    end
    B = diag(sparse(faks))*(tpot.*onemint);
end
````

&rArr; Code [bernstein.m](https://github.com/alshain/eth-numcse/blob/master/06/bernstein.m)

16b
---

````matlab
function bezcurv(d)
    n = size(d, 2);
    X = d*bernstein(length(d)-1,linspace(0,1,1000));
    plot(X(1,:),X(2,:));
    hold on
    plot(d, '*');
    hold off
end
````

16c
----


````matlab
function bezcurv_comp(d1, d2)
    bezcurv(d1);
    hold on
    bezcurv(d2);
    hold off
end
`````

Yes, the curve lies in the convex hull as defined by the Theorem given in Lecture 10, slide 12.

16d
---






