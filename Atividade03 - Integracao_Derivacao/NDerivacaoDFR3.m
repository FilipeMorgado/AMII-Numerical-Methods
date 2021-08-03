%%                          Derivação Numérica - Diferenças Finitas em 3 pontos 
%
%       f'(xi)=(f(x(i-2))-4*f(x(i-1)+3*f(x(i))/2*h - Formúla das Diferenças Regressivas
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

function [x,y,dydx]=NDerivacaoDFR3(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
for i=3:n
    dydx(i)=(y(i-2)-4*y(i-1)+3*y(i))/(2*h);
end
dydx(2)=dydx(3);
dydx(1)=dydx(2);