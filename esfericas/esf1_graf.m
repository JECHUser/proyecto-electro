clc
e_0 = 8.84*10^-12;
R = 10;

tab1 = uitab('Title','V_in');
ax1 = axes(tab1);

r = linspace(0,R,4);
theta = linspace(0, 2*pi,60);
[theta, r] = meshgrid(theta, r);
Vin = ((3.*r.*cos(theta))./(10*e_0))-((6.*(r.^3).*((5.*(cos(theta)).^3)-3.*cos(theta)))./(35*(e_0)*R^2));

[x,y,z]= pol2cart(theta,r,Vin);
contour(x,y,Vin,50)

xlabel("x")
ylabel("y")
zlabel("V")

tab2 = uitab('Title','V_out');
ax2 = axes(tab2);

r = linspace(10,20,10);
theta = linspace(0, 2*pi,40);
[theta, r] = meshgrid(theta, r);
Vout = ((3.*(R^3).*cos(theta))./(10*e_0.*(r.^2)))-((6.*(R^7).*((5.*(cos(theta)).^3)-3.*cos(theta)))./(35*(e_0).*(r.^4)));

[x,y,z]= pol2cart(theta,r,Vout);
contour(x,y,Vout,100);

xlabel("x")
ylabel("y")
zlabel("V")

tab3 = uitab('Title','E_in');
ax3 = axes(tab3);

phi = linspace(0,2*pi);
r = linspace(0,10,10);
theta = linspace(0,2*pi,60);

[theta, phi, r] = meshgrid(theta, phi, r);

[x,y,z] = sph2cart(theta, phi, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vin = ((3.*r.*cos(theta))./(10*e_0))-((6.*(r.^3).*((5.*(cos(theta)).^3)-3.*cos(theta)))./(35*(e_0)*R^2));

[U,V] = gradient(-Vin);

quiver3(x,y,z,U,V,Vin);
xlabel("x")
ylabel("y")
zlabel("z")


tab4 = uitab('Title','E_out');
ax4 = axes(tab4);

phi = linspace(0,pi);
r = linspace(10,20,10);
theta = linspace(0, 2*pi,60);

[theta, phi, r] = meshgrid(theta, phi, r);

[x,y,z] = sph2cart(phi, theta, r);
r = ((x.^2+y.^2+z.^2).^(1/2));
theta = atan(((x.^2+y.^2).^(1/2))./z);
Vout = ((3.*(R^3).*cos(theta))./(10*e_0.*(r.^2)))-((6.*(R^7).*((5.*(cos(theta)).^3)-3.*cos(theta)))./(35*(e_0).*(r.^4)));

[U,V] = gradient(-Vout);

quiver3(x,y,z,U,V,z);
xlabel("x")
ylabel("y")
zlabel("z")



