function [ y ] = toepm( c, r, x )
    % Acc to Lecture 11, Slide 35
    n = length(c);
    z = [c; r(n:-1:2)];
    y = [x; zeros(n-1, 1)];
    % Acc to Lecture 11, Slide 38
    y = ifft(n*fft(y) .* fft(z));
    y = y(1:n);
end

