function A9
    Band([1 2], [1 2 3 4], [1 2 3])
    BandSparse([1 2], [1 2 3 4], [1 2 3])
end
function A = Band(u, v, w)
    A = diag(v) + diag(u, -2) + diag(w, 1);
end


function A = BandSparse(u, v, w)
    n = length(v);
    A = spdiags([[u(:); 0; 0], v(:) [w(:); 0]], [-2 0 1], n, n);
end