qn = 2*10^5;
deltax = 0.05;
k = 401;
alpha = 117*(10^-6);
tau = 1/4;
deltat = (deltax*deltax)/(alpha*4);
A = zeros(9,9);
C = zeros(9,1);
for i=1:9
  for j = 1:9
    if i==1
      A(1,1) = 2;
      A(1,2) = -1;
     elseif i==9
      A(9,8) = -1;
      A(9,9) = 4;
     else
      A(i,i-1) = -1;
      A(i,i) = 4;
      A(i,i+1) = -1;
    endif
  endfor
 end
for i=1:9
  if i==1
    C(1,1) = (qn*deltax/k)+20;
   elseif i==9
    C(9,1) = 60;
  else
    C(i,1) = 40;
 end
end
disp(C)
for i=0:12:120
  X = linsolve(A,C);
  for j=1:9
    C(j,1) = 2*X(j,1);
  endfor
  C(1,1) = (qn*deltax/k)+ X(1,1);
  C(9,1) = C(9,1) + 20;
  
end
 disp("The temp is");
 disp(X(4,1));