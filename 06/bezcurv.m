function bezcurv(d)
    n = size(d, 2);
    X = d*bernstein(length(d)-1, 0:0.001:1);
    plot(X(1,:),X(2,:));
    hold on
    plot(d(1, :), d(2, :), '*');
    hold off
end