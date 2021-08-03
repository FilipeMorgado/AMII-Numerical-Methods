%%          MÉTODO DE RUNGE - KUTTA DE ORDEM 3 (RK3) para SED.
%   [t,u,v] = NRK3SED(f,g,a,b,n,u0,v0) 
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   f, g - funções do 2.º membro das Equações Diferenciais
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   u0, v0 - condições iniciais t=a -> u=u0 e v=v0
%OUTPUT: 
%   [t,u,v] - vector das soluções aproximações e da discretização de t
%    k1_u        = h * f(t(i),u(i),v(i));
%    k1_v        = h * g(t(i),u(i),v(i));
%    
%    k2_u        = h * f(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));   
%    k2_v        = h * g(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));
%    
%    k3_u        = h * f(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);   
%    k3_v        = h * g(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);
%
%    u(i+1)=u(i)+(k1_u+4*k2_u+k3_u)/6;
%    v(i+1)=v(i)+(k1_v+4*k2_v+k3_v)/6;
%
%
%   O método de Runge - Kutta de ordem 3 (RK3) é um dos métodos númericos
%   desenvolvidos pelos matemáticos alemães Carl Runge e Martin Kutta, por
%   volta de 1900. Os métodos desenvolvidos pelos dois matemáticos formam 
%   uma vasta família de métodos numéricos diretos de passo simples para a 
%   resolução de Equações Diferenciais Ordinárias / Problemas de Valor Inicial.
%
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

function [t,u,v] = NRK3SED(f, g, a, b, n, u0,v0)

h = (b-a)/n;            
t = a:h:b;
u = zeros(1,n+1);            
v = zeros(1,n+1);
u(1) = u0;
v(1) = v0;            

for i = 1:n
    k1_u        = h * f(t(i),u(i),v(i));
    k1_v        = h * g(t(i),u(i),v(i));
    
    k2_u        = h * f(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));   
    k2_v        = h * g(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));
    
    k3_u        = h * f(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);   
    k3_v        = h * g(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);

    u(i+1)=u(i)+(k1_u+4*k2_u+k3_u)/6;
    v(i+1)=v(i)+(k1_v+4*k2_v+k3_v)/6;

end