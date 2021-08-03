%%                          ODE 113 do Matlab (ODE113)
%      y  = ODE45(f, a, b, n, y0) - Função do Matlab para a resolução de um PVI
%      y' = f(t,y), com t = [a,b] e y(a) = y0 - Condição inicial
%
%   -> INPUT:
%      f      - função do 2º membro da Equação Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da variável independente t
%      n      - número de subintervalos ou interações do método
%      y0     - condição inicial: t = a -> y = y0
%
%   -> OUTPUT:
%      t      - discretização do domínio
%      y      - vector das aproximações discretas da solução exacta
%
%   A ODE113 é uma função do Matlab para resolver sistemas de equações
%   do tipo y' = f(t,y), ou problemas que envolvem matrizes de massa, 
%   M(t,y)y'=f(t,y). Esta função implementa um método de resolução
%   multipasso, muito mais preciso que qualquer outro método abordado,
%   porém menos utilizado devido à sua complexidade de cálculo.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 31 de março de 2020
%
%%
function [t, yB] = ODE113(f, a, b, n, y0)

h       = (b-a)/n;
t    = a:h:b;

tspan = t;                             % Vetor que define o início e fim dos limites de integração
[t, yB]  = ode113(f,tspan, y0);           % Sintaxe da função ODE113 do Matlab