n = 10;
D = [-ones(n,1),[2*ones(n-1,1);1],-ones(n,1)];
B = spdiags(D,[-1,0,1],n,n); 
x = rand(n,1);
fprintf('|x-y| = %d\n',norm(multAmin(B*x)-x));
