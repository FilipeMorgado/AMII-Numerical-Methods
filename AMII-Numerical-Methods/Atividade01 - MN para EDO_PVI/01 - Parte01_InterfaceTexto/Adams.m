%%                   MÉTODO DE ADAMS-BASHFORTH DE ORDEM 4
%       y  = Adams(f, a, b, n, y0) - Método numérico para a resolução de um PVI
%       y' = f(t,y), com t = [a,b] e y(a) = y0 - Condição inicial
%
%   -> INPUT:
%      f      - função do 2º membro da Equação Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da variável independente t
%      n      - número de subintervalos ou interações do método
%      y0     - condição inicial: t = a -> y = y0
%
%
%   -> OUTPUT:
%      yAdams - Vetor das soluções aproximadas da solução exata
%      y(n+1) = y(n) + (55 * f(t(n), y(n)) - 59 * f(t(n-1), y(n-1)) + 37 * f(t(n-2), y(n-2)) - 9 * f(t(n-3), y(n-3))) * (h / 24);
%     
%      O método de previsão e correção de Adams-Bashforth é um método de 
%      passo múltiplo que combina as fórmulas de Adams-Bashforth e Adams-Moulton
%      de quarto grau. Ambas são de passo múltiplo, mas a diferença é que a primeira
%      é uma fórmula explícita e a segunda implícita. Os métodos de passo múltiplo
%      evitam as múltiplas etapas do método de Runge-Kutta, embora haja a necessidade
%      de serem iniciados com suas condições iniciais.
%
%   Autor: Vasco Pereira       .: a2019134744@isec.pt
%          Filipe Morgado      .: a2019137625@isec.pt
%          Rui Ferreira        .: a2018013504@isec.pt
%          Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de março de 2020
%
%%
function yAdams = Adams(f, a, b, n, y0)

% Inicialização das matrizes y e t com o valor 0 em todas as suas entradas;
yAdams = zeros(1, n+1);     
h = (b - a) / n;
h24 = h / 24;
yAdams(1,:) = y0;
t = a:h:b;

m = min(3,n);

for i = 1 : m % fase de inicialização utilizando o método RK4
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
