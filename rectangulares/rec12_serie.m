function [X,Y,Z,U,V,Potencial,Campo,Densidad] = rec12_serie(a,b,n)
% Esta función calcula el potencial (serie).
x = -a:0.05:a;
y = 0:0.05:a;
[X,Y] = meshgrid(x,y);
serie = 0;
e_0 = 8.84*10^-12;
Z = X;

for i = 1:n
    k = i*pi/b; % valor de k obtenido
    
    %   solucion integral
    funcion = @(y)(2/(b*cosh(-i*pi)))*(((2*(y.^3))+5).*sin(k.*y));
    Fn = integral(funcion, 0, b);
    
    %   generacion de serie
    termino_serie = (Fn * cosh(X.*k) .* sin(Y.*k));
    serie = serie + termino_serie;
end

Potencial = serie;
neg_pot =(-1) * Potencial;
Campo = gradient(neg_pot);   % obtiene campo electrico
[U,V] =  gradient(neg_pot);

Densidad = divergence(U,V);   
Densidad = e_0 * Densidad;   % obtiene densidad de carga

end
