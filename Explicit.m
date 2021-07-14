qn = 2*10^5;
deltax = 0.05;
k = 401;
alpha = 117*(10^-6);
tau = 1/4;
deltat = (deltax*deltax)/(alpha*4);
A = zeros(25,9);
A(1,:) = 20;
for i=2:25
  for j=1:9
    if j==1
      A(i,1) = (0.5*((qn*deltax/k)+A(i-1,2)))+0.5*(A(i-1,j));
     else
      if j!=9
        A(i,j) = (0.25*(A(i-1,j+1)+A(i-1,j-1)))+0.5*(A(i-1,j));
       else
        A(i,j) = (0.25*(20+A(i-1,j-1)))+0.5*(A(i-1,j));
      endif
      
    endif
  endfor
 end
 disp("Temp at 150mm is")
 disp(A(25,4))