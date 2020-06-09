clc
% definicion de variables
theta = linspace(0,2*pi);
r = 10;
s = linspace(10,30,5);
e_0 = 8.84*10^-12;
E_0 = 5;

% creacion de grilla de graficacion
[theta, s] = meshgrid(theta, s);

% potencial en el exterior del cilindro
z = -E_0.*s.*cos(theta).*(((r.^2)./(s.^2))-1);

% conversion polar a cartesiana
[x,y,z] = pol2cart(theta, s, z);

% creacion de superficie
surf(x,y,z)
colorbar

% ejes
xlabel("x")
ylabel("y")
zlabel("V")
