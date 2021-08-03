%%                          ODE 45 do Matlab (ODE45)
%      y  = ODE45(f, a, b, n, y0) - Fun��o do Matlab para a resolu��o de um PVI
%      y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi��o inicial
%
%   -> INPUT:
%      f      - fun��o do 2� membro da Equa��o Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da vari�vel independente t
%      n      - n�mero de subintervalos ou intera��es do m�todo
%      y0     - condi��o inicial: t = a -> y = y0
%
%   -> OUTPUT:
%      t      - discretiza��o do dom�nio
%      y      - vector das aproxima��es discretas da solu��o exacta
%
%   A ODE45 � uma fun��o do Matlab para resolver sistemas de equa��es
%   do tipo y' = f(t,y), ou problemas que envolvem matrizes de massa, 
%   M(t,y)y'=f(t,y). Esta fun��o implementa um m�todo de Runge-Kutta,
%   atrav�s de itera��es sucessivas computacionalmente.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 28 de mar�o de 2020
%
%%

function [t, yA] = ODE45(f, a, b, n, y0)

h = (b-a)/n;
t = a:h:b;

tspan = t;                                 % Vetor que define o inicio e fim dos limites de integra��o
[t, yA]  = ode45(f,tspan, y0);             % Sintaxe da fun��o ODE45 do Matlab
