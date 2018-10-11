function [ y ] = init( x, ug, ud )
%Condition initiale de Riemann
y = (x<0.25).*ud + (x>0.25).*(x<0.5)*ug + (x>0.5).*ud;
end
