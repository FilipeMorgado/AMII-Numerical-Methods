%%                          Deriva��o Num�rica - Diferen�as Finitas em 3 pontos 
%
%       f'(xi)=(-3*f(x(i))+4*f(x(i+1)-f(x(i+2))/2*h - F�rmula das Diferen�as Progressivas
%
%     ->INPUT:  
%       f - fun��o
%       [a, b] - intervalo de deriva��o
%       h - passo da discretiza��o
%       y - imagens x vs y
%
%     ->OUTPUT: 
%       [x, y] - malha de pontos
%       dydx - derivada de f 
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%%

function [x,y,dydx]=NDerivacaoDFP3(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
for i=1:n-2
    dydx(i)=(-3*y(i)+4*y(i+1)-y(i+2))/(2*h);
end
dydx(n-1)=dydx(n-2);
dydx(n)=dydx(n-1);