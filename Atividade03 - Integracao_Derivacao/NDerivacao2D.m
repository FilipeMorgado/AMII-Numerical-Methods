%%                          Derivação Numérica - Diferenças Finitas em 3 pontos
%
%       f''(xi)=(f(x(i+1))-2f(x(i)+f(x(i-1))/h^2 - Formúla da Segunda Derivada
%
%     ->INPUT:  
%       f - função
%       [a, b] - intervalo de derivação
%       h - passo da discretização
%       y - imagens x vs y
%
%     ->OUTPUT: 
%       [x, y] - malha de pontos
%       dydx - derivada de f 
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%%

function [x,y,dydx]=NDerivacao2D(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
for i=2:n-1
    dydx(i)=(y(i+1)-2*y(i)+y(i-1))/(h^2);
end
dydx(1)=dydx(2);
dydx(n)=dydx(n-1);