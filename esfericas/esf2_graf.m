clc
% problema 2 esfericas

% definicion de variables
e_0 = 8.84*10^-12;
V_0 = 50;
k = 5;
a = 10;
b = 15;

% tab 1
tab1 = uitab('Title','V_in');
ax1 = axes(tab1);

% valores de r, theta
r = linspace(a,b,4);
theta = linspace(0, 2*pi,60);

%creacion de grilla
[theta, r] = meshgrid(theta, r);
Vin = ((b*k)/e_0).*(1-(a./r))+(2*k/(15*b*e_0)).*((r.^2)-((a^5)./(r.^3))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

% conversion
[x,y,z]= pol2cart(theta,r,Vin);

% grafica de contorno
contour(x,y,Vin)
colorbar

xlabel("x")
ylabel("y")
zlabel("V")

% tab2
tab2 = uitab('Title','V_out');
ax2 = axes(tab2);

% valores de r, theta
r = linspace(b,50);
theta = linspace(0, 2*pi,70);
[theta, r] = meshgrid(theta, r);

% potencial en el exterio de la esfera
Vout = (((-b*k*(b-a))./(e_0.*r)))+(((2*k*(b^5-a^5))/(15*b*e_0))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[x,y,z]= pol2cart(theta,r,Vout);
contour(x,y,Vout,100);
colorbar

xlabel("x")
ylabel("y")
zlabel("V")

% tab 3
tab3 = uitab('Title','E_in');
ax3 = axes(tab3);

% valores de r, theta
phi = linspace(0,2*pi);
r = linspace(a,b,10);
theta = linspace(0,2*pi,60);

% creacion de grilla
[theta, phi, r] = meshgrid(theta, phi, r);

% conversion 
[x,y,z] = sph2cart(theta, phi, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);

% potencial en el interio de la esfera
Vin = ((b*k)/e_0).*(1-(a./r))+(2*k/(15*b*e_0)).*((r.^2)-((a^5)./(r.^3))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[U,V] = gradient(-Vin);

% creacion de campo vectorial
quiver3(x,y,z,U,V,Vin);
xlabel("x")
ylabel("y")
zlabel("z")

% tab 4
tab4 = uitab('Title','E_out');
ax4 = axes(tab4);

% valores de r, theta, phi
phi = linspace(0,pi);
r = linspace(b,20,10);
theta = linspace(0, 2*pi,60);

% creacion de grilla
[theta, phi, r] = meshgrid(theta, phi, r);

% conversion
[x,y,z] = sph2cart(phi, theta, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);

% pontencial en el exterior de la esfera
Vout = (((-b*k*(b-a))./(e_0.*r)))+(((2*k*(b^5-a^5))/(15*b*e_0))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[U,V] = gradient(-Vout);

% creacion de campo vectorial
quiver3(x,y,z,U,V,z);
xlabel("x")
ylabel("y")
zlabel("z")
