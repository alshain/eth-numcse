% Benchmark
% diag vs spdiags
runs = 3;
dimensions = 2.^(2:6);
timings = [];
for dim = dimensions
    A = gallery('poisson', dim);

    t = realmax;
    t2 = realmax;
    
    for k = 1:runs
        tic; Af = diag(1./diag(A))*A; t = min(toc, t);
        clear Af;
        tic; Af = spdiags(1./spdiags(A), 0, dim^2, dim^2)*A; t2 = min(toc, t2);
        clear Af;
    end
    timings = [timings; t t2];
end

% plot
figure('name', 'Exerciose 7c');
loglog(...
    dimensions, timings(:,1), 'b.',...          % blue dots
    dimensions, timings(:,2), 'g.',...          % blue dots
    dimensions, dimensions .^2 * min(timings(:, 1) / 2^2), 'r',...
    dimensions, dimensions .^4 * min(timings(:, 2) / 2^4), 'k'...
);
xlabel('dimension');
ylabel('minimal runtime (s)')
title('Aufgabe 7c');
legend('Normal', 'Sparse', 'n^2', 'n^4');
    
    