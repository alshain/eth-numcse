
From the [documentation](http://www.mathworks.ch/ch/help/matlab/ref/gallery.html)

> `A = gallery('poisson',n)` returns the block tridiagonal (sparse) matrix of order *n<sup>2</sup>*
 resulting from discretizing Poisson's equation with the 5-point operator on an *n-by-n* mesh.

Exercise 7
==========

7a
--

Executed provided code:

````matlab
spy(gallery('poisson', 10))
````

Picture with three diagonal lines, one in the center, the others offset by approximately ~10 units. Dotted lines represent non-zero elements per spy documentation.

7b
--

````matlab
A = diag(1./diag(A))*A;
````

`A` is an *n<sup>2</sup>&times;n<sup>2</sup>* matrix.
=> `diag(·)` creates a non-sparse matrix => complexity *n<sup>4</sup>*.

7c
--

[`spdiags(A, d, m, n)` documentation](http://www.mathworks.ch/ch/help/matlab/ref/spdiags.html) 

> Extract and create sparse band and diagonal matrices

`spdiags(A, d, m, n)` needs an additional parameter

 - `0` to specify the diagonal (positive: counting towards the right, negative: counting towards the bottom)
 - `m`, `n`: The dimensions of the matrix to be created, same as `A`

<!-- break -->
````matlab
spdiags(1 ./ spdiags(A), 0, size(A, 1), size(A, 1) * A;
````

&rArr; Code [A7c.m](https://github.com/alshain/eth-numcse/blob/master/03/A7c.m)

8a
--

From the [documentation](http://www.mathworks.ch/ch/help/matlab/ref/find.html)

> `[row,col,v] = find(X, ...)` returns a column or row vector v of the nonzero entries in X, as well as row and column indices. If X is a logical expression, then v is a logical array. Output v contains the non-zero elements of the logical array obtained by evaluating the expression X. For example,

8b
--

````matlab
function [ val, row_ind, col_ptr ] = CCS(A)
% Convert full matrix to CCS representation
    [rs cs vs] = find(A);    
    n = length(rs);
    val = zeros(1, n);
    row_ind = zeros(1, n);
    col_ptr = [];

    last_c = 0;
    for i=[1:length(rs)]
        val(i) = vs(i);
        row_ind(i) = rs(i);
        if cs(i) ~= last_c
            col_ptr = [col_ptr i];
            last_c = cs(i);
        end 
    end
end
````

&rArr; File [CCS.m](https://github.com/alshain/eth-numcse/blob/master/03/CCS.m)


8c
--

Complexity analysis

 - *full*  
 `O(n^2)` because `find()` has to process each of the *n<sup>2</sup>* elements at least once.
 - *sparse*  
`O(p)` assuming `find()` runs in `O(p)` for sparse matrices, where `p` denotes the amount of non-zero elements.


8d
--

````matlab
function [ y ] = mul_CCS( val, row_ind, col_ptr, x )
% Multiply matrix given in CCS representation by vector x
    n = max(row_ind);
    y = zeros(n, 1);
    
    n_values = length(val);
    
    col = 0;
    for i=1:n_values
        row = row_ind(i);
        if i == col_ptr(col + 1);
            col = col + 1;
        end
        y(row) = y(row) + val(i)*x(col);
    end
end
````

&rArr; File [mul_CCS.m](https://github.com/alshain/eth-numcse/blob/master/03/mul_CCS.m)

9A
--

&rArr; Code [A9.m](https://github.com/alshain/eth-numcse/blob/master/03/A9.m)