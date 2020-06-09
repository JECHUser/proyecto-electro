clc
e_0 = 8.84*10^-12;
V_0 = 50;
k = 5;
a = 10;
b = 15;

tab1 = uitab('Title','V_in');
ax1 = axes(tab1);

r = linspace(a,b,4);
theta = linspace(0, 2*pi,60);
[theta, r] = meshgrid(theta, r);
Vin = ((b*k)/e_0).*(1-(a./r))+(2*k/(15*b*e_0)).*((r.^2)-((a^5)./(r.^3))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[x,y,z]= pol2cart(theta,r,Vin);
contour(x,y,Vin)
colorbar

xlabel("x")
ylabel("y")
zlabel("V")


tab2 = uitab('Title','V_out');
ax2 = axes(tab2);

r = linspace(b,50);
theta = linspace(0, 2*pi,70);
[theta, r] = meshgrid(theta, r);
Vout = (((-b*k*(b-a))./(e_0.*r)))+(((2*k*(b^5-a^5))/(15*b*e_0))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[x,y,z]= pol2cart(theta,r,Vout);
contour(x,y,Vout,100);
colorbar

xlabel("x")
ylabel("y")
zlabel("V")



tab3 = uitab('Title','E_in');
ax3 = axes(tab3);

phi = linspace(0,2*pi);
r = linspace(a,b,10);
theta = linspace(0,2*pi,60);

[theta, phi, r] = meshgrid(theta, phi, r);

[x,y,z] = sph2cart(theta, phi, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vin = ((b*k)/e_0).*(1-(a./r))+(2*k/(15*b*e_0)).*((r.^2)-((a^5)./(r.^3))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[U,V] = gradient(-Vin);

quiver3(x,y,z,U,V,Vin);
xlabel("x")
ylabel("y")
zlabel("z")

tab4 = uitab('Title','E_out');
ax4 = axes(tab4);

phi = linspace(0,pi);
r = linspace(b,20,10);
theta = linspace(0, 2*pi,60);

[theta, phi, r] = meshgrid(theta, phi, r);

[x,y,z] = sph2cart(phi, theta, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vout = (((-b*k*(b-a))./(e_0.*r)))+(((2*k*(b^5-a^5))/(15*b*e_0))).*(3.*(cos(theta-1)).^3)+V_0*a./r;

[U,V] = gradient(-Vout);

quiver3(x,y,z,U,V,z);
xlabel("x")
ylabel("y")
zlabel("z")

tab5 = uitab('Title','Carga inducida');
ax5 = axes(tab5);
r = a;
sigma = e_0 .* (-(b*k*a)./e_0.*r.^2)+((2*k.*(cos(theta-1)).^3).*(2.*r.^5+3.*a.^5)./(5*b*e_0.*r.^4))-(a*V_0./(r.^2));

