%%                          Regra dos Trapézios
%
%       A regra dos trapézios faz uso de uma aproximação de uma função f(x) por meio de uma reta. 
%       A aproximação da integral desejada é feita a partir da área do trapézio obtido. 
%       Ao aplicar diversas vezes esta regra em um intervalo [a, b], ela adequa-se melhor ao cálculo integral, 
%       sendo uma técnica mais refinada em relação à simples aproximação da área por um trapézio, 
%       é muito útil quando temos uma função f(x) com grau maior que 1 e desejamos, ainda assim, 
%       a aproximação por trapézios.
%
%       ->Input:
%         f      - função
%         [a, b] - intervalo
%         n      - subdivisões do intervalo
%         
%       ->Output:
%         T - Solução aproximada por trapézios
%         h/2*(f(a)+2*s+f(b));
%
%   Autores: Armenio Correia     .: armenioc@isec.pt
%            Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%%

function T = NTrapezios(f,a,b,n)
h=(b-a)/n;          
x=a;
s=0;
for i=1:n-1
    x=x+h;
    s=s+f(x);
end
T = h/2*(f(a)+2*s+f(b));