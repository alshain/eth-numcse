function B = bernstein(n, t)
    lt = length(t);
    one = ones(lt,1);
    faks = [1 zeros(1,n)];
    onemint = [zeros(lt,n) one]';
    tpot = [one zeros(lt,n)]';
    for i = 1:n
        faks(i+1) = ((n-i+1)/(i))*faks(i);
        onemint(n-i+1,:) = onemint(n-i+2,:).*(1-t);
        tpot(i+1,:) = tpot(i,:).*t;
    end
    B = diag(sparse(faks))*(tpot.*onemint);
end