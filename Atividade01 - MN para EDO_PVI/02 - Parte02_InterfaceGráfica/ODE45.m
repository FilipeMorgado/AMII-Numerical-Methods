%%                          ODE 45 do Matlab (ODE45)
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
%   A ODE45 é uma função do Matlab para resolver sistemas de equações
%   do tipo y' = f(t,y), ou problemas que envolvem matrizes de massa, 
%   M(t,y)y'=f(t,y). Esta função implementa um método de Runge-Kutta,
%   através de iterações sucessivas computacionalmente.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 28 de março de 2020
%
%%

function [t, yA] = ODE45(f, a, b, n, y0)

h = (b-a)/n;
t = a:h:b;

tspan = t;                                 % Vetor que define o inicio e fim dos limites de integração
[t, yA]  = ode45(f,tspan, y0);             % Sintaxe da função ODE45 do Matlab
