function y = multA(d1,c,d2,x)
    n = size(d1, 2);
    y = [d1 d2] .* x;
    y(:, 1:n) = y(:, 1:n) +  c .* x(:, n+1:end);
    y(:, n+1:end) = y(:, n+1:end) + c .* x(:, 1:n);
end