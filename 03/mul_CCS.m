function [ y ] = mul_CCS( val, row_ind, col_ptr, x )
% Multiply matrix given in CCS representation by vector x
    n = max(row_ind);
    y = zeros(n, 1);
    
    n_values = length(val);
    
    col = 0;
    for i=1:n_values
        row = row_ind(i);
        if i == col_ptr(col + 1);
            col = col + 1;
        end
        y(row) = y(row) + val(i)*x(col);
    end
end

