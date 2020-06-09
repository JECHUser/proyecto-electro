clc

theta = linspace(0,2*pi);
r = 10;
s = linspace(10,30,5);
e_0 = 8.84*10^-12;
E_0 = 5;

[theta, s] = meshgrid(theta, s);

z = -E_0.*s.*cos(theta).*(((r.^2)./(s.^2))-1);
[x,y,z] = pol2cart(theta, s, z);
surf(x,y,z)
colorbar
xlabel("x")
ylabel("y")
zlabel("V")

% subplot(1,2,2)
% x = s.*cos(theta);
% y = s.*sin(theta);
% z = -E_0.*s.*cos(theta).*(((r.^2)./(s.^2))-1);
% z = -E_0.*((x.^2+y.^2).^(1/2)).*cos(atan(y./x)).*(((r.^2)./(((x.^2+y.^2).^(1/2)).^2))-1);
% 
% [U,V] = gradient(-z);
% quiver3(x,y,z,U,V,z)
% xlabel("x")
% ylabel("y")
% zlabel("V")

