%%                          Regra de Simpson
%
%       A Regra de Simpson (em nome de Thomas Simpson, um matemático inglês), 
%       também conhecida como fórmula de Simpson é uma forma de se obter
%       uma aproximação do integral definido.
%       A regra de Simpson baseia-se em aproximar a integral definida,
%       pela área sob arcos de parábola que interpolam a função.
%
%       ->Input:
%         f      - função
%         [a, b] - intervalo
%         n      - subdivisões do intervalo
%
%       ->Output:
%         S      - Solução aproximada por arcos de parábola
%         h/3*(f(a)+s+f(b));
%
%   Autores: Armenio Correia     .: armenioc@isec.pt
%            Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%%

function S = NSimpson(f,a,b,n)
h = (b-a)/n;
x=a;
s=0;
for i=1:n-1
    x=x+h;
    if mod(i,2)==0
        s=s+2*f(x);
    else
        s=s+4*f(x);
    end
end
S = h/3*(f(a)+s+f(b));