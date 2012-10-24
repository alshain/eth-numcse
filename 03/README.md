
http://www.mathworks.ch/ch/help/matlab/ref/gallery.html

A = gallery('poisson',n) returns the block tridiagonal (sparse) matrix of order n^2 resulting from discretizing Poisson's equation with the 5-point operator on an n-by-n mesh.

Exercise 7
==========

7a
--

Executed provided code:

        spy(gallery('poisson', 10))

Picture with three diagonal lines, one in the senter, the others offset by approximately ~10 units. Dotted lines represent non-zero elements per spy documentation.

7b
--

    A = diag(1./diag(A))*A;

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

        spdiags(1 ./ spdiags(A), 0, size(A, 1), size(A, 1) * A;

&rArr; Code

8a
--

From the [documentation](http://www.mathworks.ch/ch/help/matlab/ref/find.html)

> `[row,col,v] = find(X, ...)` returns a column or row vector v of the nonzero entries in X, as well as row and column indices. If X is a logical expression, then v is a logical array. Output v contains the non-zero elements of the logical array obtained by evaluating the expression X. For example,

8b
--
&rArr; Code [CCS.m](CCS.m)
