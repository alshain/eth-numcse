function [ x ] = normaleq( A, b )
    R = chol(A'*A);
    x = R'\(A'*b);
    x = R\x;
end
