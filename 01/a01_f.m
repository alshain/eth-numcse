nruns = 3; res = [];
ns = 2.^(2:12);
for n = ns
  a = rand(n,1); d = rand(n,1); x = rand(n,1);
  t = realmax;
  t2 = realmax;
  for k=1:nruns
    tic; arrowmatvec(d,a,x); t = min(toc,t); 
    tic; arrowmatvec2(d,a,x); t2 = min(toc, t2); 
  end;
  res = [res; t t2];
end
figure('name','timings arrowmatvec');
c1 = sum(res)/sum(ns.^3);
c2 = sum(res)/sum(ns);
loglog(ns, res(:, 1),'r+',...
       ns, res(:, 2), 'go',...
       ns, c1*ns.^3, 'b-',...
       ns, c2*ns, 'k-');
xlabel('{\bf vector size n}','fontsize',14);
ylabel('{\bf time[s]}','fontsize',14);
title('{\bf timings for arrowmatvec}','fontsize',14);
legend('tic-toc time', 'a01_d','O(n^3)', 'O(n)','location','best');
print -depsc2 '../PICTURES/arrowmatvectiming.eps';
print -djpeg95 '../PICTURES/arrowmatvectiming.jpg';
