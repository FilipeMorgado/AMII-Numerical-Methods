%%                   M�TODO DE ADAMS-BASHFORTH DE ORDEM 4
%       y  = Adams(f, a, b, n, y0) - M�todo num�rico para a resolu��o de um PVI
%       y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi��o inicial
%
%   -> INPUT:
%      f      - fun��o do 2� membro da Equa��o Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da vari�vel independente t
%      n      - n�mero de subintervalos ou intera��es do m�todo
%      y0     - condi��o inicial: t = a -> y = y0
%
%
%   -> OUTPUT:
%      yAdams - Vetor das solu��es aproximadas da solu��o exata
%      y(n+1) = y(n) + (55 * f(t(n), y(n)) - 59 * f(t(n-1), y(n-1)) + 37 * f(t(n-2), y(n-2)) - 9 * f(t(n-3), y(n-3))) * (h / 24);
%     
%      O m�todo de previs�o e corre��o de Adams-Bashforth � um m�todo de 
%      passo m�ltiplo que combina as f�rmulas de Adams-Bashforth e Adams-Moulton
%      de quarto grau. Ambas s�o de passo m�ltiplo, mas a diferen�a � que a primeira
%      � uma f�rmula expl�cita e a segunda impl�cita. Os m�todos de passo m�ltiplo
%      evitam as m�ltiplas etapas do m�todo de Runge-Kutta, embora haja a necessidade
%      de serem iniciados com suas condi��es iniciais.
%
%   Autor: Vasco Pereira       .: a2019134744@isec.pt
%          Filipe Morgado      .: a2019137625@isec.pt
%          Rui Ferreira        .: a2018013504@isec.pt
%          M� F�tima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de mar�o de 2020
%
%%
function yAdams = Adams(f, a, b, n, y0)

% Inicializa��o das matrizes y e t com o valor 0 em todas as suas entradas;
yAdams = zeros(1, n+1);     
h = (b - a) / n;
h24 = h / 24;
yAdams(1,:) = y0;
t = a:h:b;

m = min(3,n);

for i = 1 : m % fase de inicializa��o utilizando o m�todo RK4
    s(i) = f(t(i), yAdams(i));
    s2 = f(t(i) + h / 2, yAdams(i) + s(i) * h /2);
    s3 = f(t(i) + h / 2, yAdams(i) + s2 * h /2);
    s4 = f(t(i+1), yAdams(i) + s3 * h);
    yAdams(i+1) = yAdams(i) + (s(i) + s2+s2 + s3+s3 + s4) * h / 6;
end

for i = m + 1 : n 
    s(i) = f(t(i), yAdams(i));
    yAdams(i+1) = yAdams(i) + (55 * s(i) - 59 * s(i-1) + 37 * s(i-2) - 9 * s(i-3)) * h24; % preditor
    t(i+1) = t(i) + h;
    yAdams(i+1) = yAdams(i) + (9 * f(t(i+1), yAdams(i+1)) + 19 * s(i) - 5 * s(i-1) + s(i-2)) * h24; % corretor
end
