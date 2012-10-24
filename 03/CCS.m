function [ val, row_ind, col_ptr ] = CCS(A)
% Convert full matrix to CCS representation
    [rs cs vs] = find(A);    
    n = length(rs);
    val = zeros(1, n);
    row_ind = zeros(1, n);
    col_ptr = [];

    last_c = 0;
    for i=[1:length(rs)]
        val(i) = vs(i);
        row_ind(i) = rs(i);
        if cs(i) ~= last_c
            col_ptr = [col_ptr i];
            last_c = cs(i);
        end 
    end
end

