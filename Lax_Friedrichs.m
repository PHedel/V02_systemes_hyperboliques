clear all
close all

% Parametres
N = 96000;
lambda = 0.9;
Tmax = 0.2; %temps de la simulation
% Valeurs a gauche et a droite dans le probleme de Riemann (ug > ud)
ug = 0.8;
ud = 0.4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialisation
h = 1/(N-1)
k = lambda*h;
nmax = floor(Tmax/k);
C = h*(0:(N-1)); %Centre des cellules: N points en tout (indexation de 0 a N-1)
%X = C + ones(1,N).*(0.5*h);
U = [ud init(C, ug, ud) ud];
% affichage de la condition initiale
figure(1)
plot(C, U(2:(N+1)) );
% schema de Lax Friedrichs
for n=1:nmax
    U(2:(N+1)) = 0.5*( U(3:(N+2)) + U(1:N)) - 0.5*lambda*( f(U(3:(N+2))) - f(U(1:N))) ;
    U(1) = U(N+1);
    U(N+2) = U(2);
end
tmax = k*nmax;
hold on
plot(C, U(2:(N+1)), 'Color', 'red');
hold on
plot(C, solution(tmax, C, ug, ud), 'Color', 'green');
legend('condition initiale', 'solution num', 'solution exacte' )
erreur = solution(tmax, C,ug, ud) - U(2:(N+1));
err_norm1 =  h*norm(erreur,1)
err_norm2 = sqrt(h)*norm(erreur,1)