l = 0.2;
h=15;
k= 180;
sinth = 0.0995;
tempinf = 25;
deltax = (l/19);
coeff1 = (l/deltax)+0.5;
coeff3 = (l/deltax) - 0.5;
coeff2 = -1*((h*deltax)/(k*sinth)) - coeff1 - coeff3;
A = zeros(20);
B = zeros(20,1);
A(1,1) = coeff2 + 2;
A(1,2) = coeff3 - 1;
B(1) = -1*(coeff1-1)*100+(-1*((h*deltax)/(k*sinth))*tempinf);
for i=2:19
    for j=i-1:i+1
        if j == i-1
            A(i,j) = coeff1 - (i);
        elseif j==i 
            A(i,j) = coeff2 + (2*i);
        else
            A(i,j) = coeff3 - (i);
        end
    end
	B(i) = -1*((h*deltax)/(k*sinth))*tempinf;
end
A(20,19) = 1;
A(20,20) = -1*((h*deltax)/(k*sinth)) -1;
B(20) = B(19);
disp("Temperatures are");
X = linsolve(A,B);
disp(X);
Y = 1:20;
plot(Y,X);