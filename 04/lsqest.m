function [ alpha, beta ] = lsqest( z, c )
    n = length(z);
    za = [z(2:end); 0];
    zb = [0; z(1:end-1)];
    A = [z; za + zb];
    solution = qrsolve(A, c);
    alpha = solution(1);
    beta = solution(2);
end

