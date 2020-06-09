function [X,Y,Z,U,V,Potencial,Campo,Densidad] = rec3_serie(a,b,n,m)
% Esta función calcula el potencial (serie).
x = 0:0.05:a;
y = 0:0.05:b;
[X,Y] = meshgrid(x,y);
serie = 0;
e_0 = 8.84*10^-12;
Z = X;

for i = 1:n
    for j = 1:m
        k = i*pi/a;
        l = j*pi/b;
        
        %   solucion integral
        funcion = @(x,y) (4/a*b)*(x.*(y.^2)).*sin(k.*y).*sin(l.*x);
        C_nm = integral2(funcion,0,b,0,a);
        
        %   generacion de la serie
        termino_serie = C_nm * sin(k*Y).*sin(l*X);
        serie = serie + termino_serie;
    end
end

Potencial = serie;
neg_pot =(-1) * Potencial;
Campo = gradient(neg_pot);
[U,V] =  gradient(neg_pot);

Densidad = divergence(U,V);
Densidad = e_0 * Densidad;

end