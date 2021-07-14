deltax = 1/9;
deltay = 0.2/4;
h = 10/401;
T = zeros(45,15);
Tf = zeros(5,10);
T(:,1) = 30;
for i=2:15
  disp("Calculating for t =");
  disp(i);
  tspan = [i-1 i];
  for j=1:45
    if j>=1 && j<=9
      if j==1
        [t,y] = ode45(@(t,y) 2*((-y+30)/(2*(deltax^2))+(-y+T(2,i-1))/(2*(deltax^2))+(-y+T(10,i-1))/((deltay^2))+((h*(-y+20))/(deltay))), tspan, T(j,i-1));
        T(1,i) = y(end);
      elseif j==9
        [t,y] = ode45(@(t,y) 4*((-y+T(j-1,i-1))/(2*(deltax^2))+(-y+T(j+9,i-1))/(2*(deltay^2))+((h*(-y+20))/(2*deltay))), tspan, T(j,i-1));
        T(9,i) = y(end);
      else
        [t,y] = ode45(@(t,y) 2*((-y+T(j-1,i-1))/(2*(deltax^2))+(-y+T(j+1,i-1))/(2*(deltax^2))+(-y+T(j+9,i-1))/((deltay^2))+((h*(-y+20))/(deltay))), tspan, T(j,i-1));
        T(j,i) = y(end);
      endif 
    elseif j>9 && j<37
      if j==10 || j==19 || j==28
        [t,y] = ode45(@(t,y) ((-y+30)/(deltax^2)+(-y+T(j+1,i-1))/(deltax^2)+(-y+T(j+9,i-1))/(deltay^2)+(-y+T(j-9,i-1))/(deltay^2)), tspan, T(j,i-1));
        T(j,i) = y(end);
      elseif j == 18 || j==27 || j==36
        [t,y] = ode45(@(t,y) 2*((-y+T(j-1,i-1))/(deltax^2)+(-y+T(j+9,i-1))/(2*(deltay^2))+(-y+T(j-9,i-1))/(2*(deltay^2))), tspan, T(j,i-1));
        T(j,i) = y(end);
      else
        [t,y] = ode45(@(t,y) ((-y+T(j-1,i-1))/(deltax^2)+(-y+T(j+1,i-1))/(deltax^2)+(-y+T(j+9,i-1))/(deltay^2)+(-y+T(j-9,i-1))/(deltay^2)), tspan, T(j,i-1));
        T(j,i) = y(end);        
      endif
     else
      if j==37
        [t,y] = ode45(@(t,y) 2*((-y+30)/(2*(deltax^2))+(-y+T(38,i-1))/(2*(deltax^2))+(-y+T(28,i-1))/((deltay^2))+((h*(-y+20))/(deltay))), tspan, T(j,i-1));
        T(37,i) = y(end);
      elseif j==45
        [t,y] = ode45(@(t,y) 4*((-y+T(j-1,i-1))/(2*(deltax^2))+(-y+T(j-9,i-1))/(2*(deltay^2))+((h*(-y+20))/(2*deltay))), tspan, T(j,i-1));
        T(45,i) = y(end);
      else
        [t,y] = ode45(@(t,y) 2*((-y+T(j-1,i-1))/(2*(deltax^2))+(-y+T(j+1,i-1))/(2*(deltax^2))+(-y+T(j-9,i-1))/((deltay^2))+((h*(-y+20))/(deltay))), tspan, T(j,i-1));
        T(j,i) = y(end);
      endif 
    endif
  endfor
end
disp(T);
Tf(:,1) = 30;
for i=2:10
  Tf(:,i) = [T(i-1,15);T(i+8,15);T(i+17,15);T(i+26,15);T(i+35,15)];
end
disp(Tf);
x = 0:(1/9):1;
y = 0:0.05:0.2;
surf(x,y,Tf);