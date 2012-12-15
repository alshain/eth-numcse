clear all; close all;

k = 3:11;
n = 2.^k;

t = inf*ones(length(n), 2);

for i = 1:length(n)
    c = rand(n(i), 1);
    r = [c(1); rand(n(i) - 1, 1)];
    h = [1:n(i)]';
    y = rand(n(i), 1);
    
    for j=1:3
        tic;
        toepmatmult(c, r, y);
        t(i, 1) = min(t(i, 1), toc);
        
        tic;
        toepm(c, r, y);
        t(i, 2) = min(t(i, 2), toc);
    end
end

figure (1), clf
loglog(n, t(:, 1:2), '-', n, 1e-7*n.^2, 'k--', n, 1e-7*n.*log(n), 'k-.', 'linewidth', 2)
legend('toepmatmult', 'toepm', 'n^2', 'nlog(n)', 'Location', 'NorthWest')
ylabel('{\bf runtime(s)}')
xlabel('{\bf problem size n}')
    