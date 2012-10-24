function y = arrowmatvec2(d, a, x)
    n = size(x, 1);
    y = zeros(n, 1);
    Ax = y;
    for i = 1:(n-1)
        Ax(i) = y(i) + d(i) * x(i) + a(i) * x(end);
    end
    
    Ax(end) = [a(1:end-1)', d(end)] * x;
    
    for i = 1:(n-1)
        y(i) = d(i) * Ax(i) + a(i) * Ax(end);
    end
    
    y(end) = [a(1:end-1)', d(end)] * Ax;   
end