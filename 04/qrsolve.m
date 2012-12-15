function [ x ] = qrsolve( A, b )
    [Q, R] = qr(A);
    b = Q'*b;
    x = R\b;
end