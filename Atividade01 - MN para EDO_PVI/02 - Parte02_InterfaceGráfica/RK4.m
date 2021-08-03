%%                  MÉTODO DE RUNGE - KUTTA DE ORDEM 4 (RK4)
%      y  = RK4(f, a, b, n, y0) - Método numérico para a resolução de um PVI
%      y' = f(t,y), com t = [a,b] e y(a) = y0 - Condição inicial
%
%   -> INPUT:
%      f      - função do 2º membro da Equação Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da variável independente t
%      n      - número de subintervalos ou interações do método
%      y0     - condição inicial: t = a -> y = y0
%
%   -> OUTPUT:
%      y - vetor das soluções aproximadas da solução exata
%      y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2, k3, k4:
%           K1 = h * f(t(i), yRK4(i));   
%           K2 = h * f(t(i)+(h/2), yRK4(i)+(K1)/2);
%           K3 = h * f(t(i)+(h/2),yRK4(i)+(K2/2));
%           K4 = h * f(t(i+1), yRK4(i)+K3);
%
%   O método de Runge-Kutta de ordem 4 (RK4) é mais um dos muitos métodos numéricos 
%   iterativos, implícitos e explícitos, para a resolução numérica (aproximação) de 
%   soluções de Equações Diferenciais Ordinárias / Problemas de Valor Inicial. 
%   O RK4 é considerado o método mais preciso da família Runge - Kutta, sendo que 
%   quanto maior for o número de subintervalos, maior será a aproximação à solução
%   exata.  
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 27 de março de 2020
%
%%
function yRK4 = RK4(f, a, b, n, y0)     

% Inicialização das matrizes y e t com o valor 0 em todas as suas entradas
yRK4    = zeros(1, n+1);     
h       = (b-a)/n;          % Divisão em partes iguais do intervalo [a, b] com passo n
t       = a:h:b;            % Valor de a guardado na posição 1 da matriz t   
yRK4(1) = y0;               % Valor inicial de y guardado na posição 1 da matriz y

for i = 1:n
    K1        = h * f(t(i), yRK4(i));   
    K2        = h * f(t(i)+(h/2), yRK4(i)+(K1)/2);
    K3        = h * f(t(i)+(h/2),yRK4(i)+(K2/2));
    K4        = h * f(t(i+1), yRK4(i)+K3);
    yRK4(i+1) = yRK4(i)+(K1+2*K2+2*K3+K4)/6;
end
