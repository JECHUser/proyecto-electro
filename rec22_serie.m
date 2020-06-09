function [X,Y,Z,U,V,Potencial,Campo,Densidad] = rec22_serie(a,b,n)
% Esta función calcula el potencial (serie).
x = 0:0.05:a;
y = 0:0.05:b;

[X,Y] = meshgrid(x,y);
serie = 0;
e_0 = 8.84*10^-12;
Z = X;

for i = 1:n
    k = i*pi/b; % valor de k obtenido
    
    %   solucion integral
    funcion = @(y)(2/(b*exp(i*pi*a/b))).*((2.*(y.^3)+5).*sin(k.*y));
    Fn = integral(funcion, 0, b);
    
    %   generacion de serie
    termino_serie = Fn .* exp(i*pi*X/b).* sin(Y.*k);
    serie = serie + termino_serie;
end

Potencial = serie;
neg_pot =(-1) * Potencial;
Campo = gradient(neg_pot);
[U,V] =  gradient(neg_pot);

Densidad = divergence(U,V);
Densidad = e_0 * Densidad;

end