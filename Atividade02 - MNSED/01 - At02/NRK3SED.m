%%          M�TODO DE RUNGE - KUTTA DE ORDEM 3 (RK3) para SED.
%   [t,u,v] = NRK3SED(f,g,a,b,n,u0,v0) 
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   f, g - fun��es do 2.� membro das Equa��es Diferenciais
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0, v0 - condi��es iniciais t=a -> u=u0 e v=v0
%OUTPUT: 
%   [t,u,v] - vector das solu��es aproxima��es e da discretiza��o de t
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
%   O m�todo de Runge - Kutta de ordem 3 (RK3) � um dos m�todos n�mericos
%   desenvolvidos pelos matem�ticos alem�es Carl Runge e Martin Kutta, por
%   volta de 1900. Os m�todos desenvolvidos pelos dois matem�ticos formam 
%   uma vasta fam�lia de m�todos num�ricos diretos de passo simples para a 
%   resolu��o de Equa��es Diferenciais Ordin�rias / Problemas de Valor Inicial.
%
%
%   27/03/2020 - Arm�nioCorreia  .: armenioc@isec.pt
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
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