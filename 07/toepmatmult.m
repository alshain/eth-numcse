function [ y ] = toepmatmult( c, r, x )
    T = toeplitz(c, r);
    y = T*x;
end

