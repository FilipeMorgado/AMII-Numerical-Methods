%%                          Deriva��o Num�rica - Diferen�as Finitas em 2 pontos
% 
%       f'(xi)=(f(x(i+1))-f(x(i))/h - F�rmula das Diferen�as Progressivas 
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
%   Autor:          Arm�nio Correia     .: armenioc@isec.pt
%
%   Modificado por: Vasco Pereira       .: a2019134744@isec.pt
%                   Filipe Morgado      .: a2019137625@isec.pt
%                   Rui Ferreira        .: a2018013504@isec.pt         
%                   M� F�tima Rodrigues .: a2019112924@isec.pt
%
%%

function [x,y,dydx]=NDerivacaoDFP(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
for i=1:n-1
    dydx(i)=(y(i+1)-y(i))/h;
end
dydx(n)=(y(n)-y(n-1))/h;