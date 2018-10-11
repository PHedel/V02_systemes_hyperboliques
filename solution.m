function [ y ] = solution(t,  x, ug, ud)
%SOLUTION renvoie la solution exacte du probleme

xa = 0.25 + ud*t;
xb = 0.25 + ug*t;
xd = 0.5 + 0.5*(ud + ug)*t; % abscisse de la discontinuite
y = (x<xa).*ud + (x>xa).*(x<xb).*(x - 0.25)./t + (x>xb).*(x<xd).*ug + (x>xd).*ud ;

end

