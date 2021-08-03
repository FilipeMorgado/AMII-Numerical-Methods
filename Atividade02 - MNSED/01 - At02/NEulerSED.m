%%       NEULERSED  Método de Euler para SED.
%   [t,u,v] = NEulerSED(f,g,a,b,n,u0,v0) 
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   f, g - funções do 2.º membro das Equações Diferenciais
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   u0, v0 - condições iniciais t=a -> u=u0 e v=v0
%OUTPUT: 
%   [t,u,v] - vector das soluções aproximações e da discretização de t
%   u(i+1) = u(i)+h*f(t(i),u(i),v(i))
%   v(i+1) = v(i)+h*g(t(i),u(i),v(i)) , i =0,1,...,n-1
%
%   De acordo com Boyce e Diprima os trabalhos iniciais em métodos
%   numéricos se iniciaram com Isaac Newton e Leibniz, mas foi com Lehonard
%   Euler no sec. XVIII que os métodos numéricos tiveram forma mais concreta,
%   Euler deduziu um processo iterativo que permitia determinar, de forma
%   aproximada, a solução de um problema de condição inicial num determinado
%   ponto. 
%   É o tipo mais básico de método explícito para integração numérica 
%   para equações diferenciais ordinárias.
% 
%   27/03/2020 - ArménioCorreia  .: armenioc@isec.pt
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de Abril de 2020
%
%%

function [t,u,v]=NEulerSED(f,g,a,b,n,u0,v0)
h=(b-a)/n;
t= a:h:b;
u=zeros(1,n+1);
v=zeros(1,n+1);
u(1)=u0;
v(1)=v0;
for i=1:n
    u(i+1)=u(i)+h*f(t(i),u(i),v(i));
    v(i+1)=v(i)+h*g(t(i),u(i),v(i));
end