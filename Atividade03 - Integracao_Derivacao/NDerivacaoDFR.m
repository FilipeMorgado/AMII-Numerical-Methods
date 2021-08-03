%%                          Derivação Numérica - Diferenças Finitas em 2 pontos 
%
%       f'(xi)=(f(x(i))-f(x(i-1))/h - Formúla das Diferenças Regressivas
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

function [x,y,dydx]=NDerivacaoDFR(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
dydx(1)=(y(2)-y(1))/h;
for i=2:n
    dydx(i)=(y(i)-y(i-1))/h;
end
dydx(n)=(y(n)-y(n-1))/h;