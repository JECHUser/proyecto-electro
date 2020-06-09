a = 1; b = 1;

figure('name', 'Potencial y Campo eléctrico', 'NumberTitle', 'off')
tab1 = uitab('Title','Potencial Eléctrico');
ax1 = axes(tab1);

subplot(2,2,1)

[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,1);
surf(X,Y,Potencial);
legend({' n = 1'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("V")

subplot(2,2,2)

[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,5);
surf(X,Y,Potencial);
legend({' n = 5'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("V")

subplot(2,2,3)

[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,10);
surf(X,Y,Potencial);
legend({' n = 10'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("V")

subplot(2,2,4)

[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,20);
surf(X,Y,Potencial);
legend({' n = 20'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("V")

tab2 = uitab('Title','Campo Eléctrico');
ax2 = axes(tab2);

subplot(2,2,1)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,1);
quiver3(X,Y,U,V)

legend({' n = 1'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("z")

subplot(2,2,2)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,5);
quiver3(X,Y,U,V)

legend({' n = 5'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("z")

subplot(2,2,3)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,10);
quiver3(X,Y,U,V)

legend({' n = 10'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("z")

subplot(2,2,4)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,20);
quiver3(X,Y,U,V)

legend({' n = 20'},'Location','northwest','Orientation','horizontal')
xlabel("x")
ylabel("y")
zlabel("z")

tab3 = uitab('Title','Densidad de Carga');
ax3 = axes(tab3);

subplot(2,2,1)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,1);
surf(X,Y,Densidad)
legend({' n = 1'},'Location','southeast','Orientation','horizontal')

xlabel("x")
ylabel("y")
zlabel("Densidad")

subplot(2,2,2)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,5);
surf(X,Y,Densidad)
legend({' n = 5'},'Location','southeast','Orientation','horizontal')

xlabel("x")
ylabel("y")
zlabel("Densidad")

subplot(2,2,3)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,10);
surf(X,Y,Densidad)
legend({' n = 10'},'Location','southeast','Orientation','horizontal')

xlabel("x")
ylabel("y")
zlabel("Densidad")

subplot(2,2,4)
[X,Y,Z,U,V,Potencial,Campo,Densidad] = rec21_serie(a,b,20);
surf(X,Y,Densidad)
legend({' n = 20'},'Location','southeast','Orientation','horizontal')

xlabel("x")
ylabel("y")
zlabel("Densidad")