tspan = [0 0.2];
y0 = 290;
err = 100;
n = 600;
while err > 0.01
    [t,y] = ode45(@(t,y) (-1)*((5.676*(10^(-8)))*(n^4 - (1273^4)))/(30*(1+(0.002*y))) , tspan, y0);
    err = abs((y(end)-n)/n);
    if(err > 0.01)
        n = y(end);
    else
        break;
    end
end
disp("The temperature at T2 is");
disp(y(end));
plot(t,y)