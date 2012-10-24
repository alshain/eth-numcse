function y = multAmin(x)
    y = zeros(length(x), 1);
    y(1) = sum(x);
    acc = y(1);
    for i=2:length(x)
        acc = acc - x(i - 1);
        y(i) = y(i - 1) + acc;
    end
end

