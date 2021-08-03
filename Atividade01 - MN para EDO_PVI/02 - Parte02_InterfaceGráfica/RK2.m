%%                  MÉTODO DE RUNGE - KUTTA DE ORDEM 2 (RK2)
%      y  = RK2(f, a, b, n, y0) - Método numérico para a resolução de um PVI
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
%      y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2:
%          k1     = h * f(t(i), y(i)),
%          k2     = h * f(t(i+1), y(i+1)).
%
%   O método de Runge - Kutta de ordem 2 (RK2) é um dos métodos númericos
%   desenvolvidos pelos matemáticos alemães Carl Runge e Martin Kutta, por
%   volta de 1900. Os métodos desenvolvidos pelos dois matemáticos formam 
%   uma vasta família de métodos numéricos diretos de passo simples para a 
%   resolução de Equações Diferenciais Ordinárias / Problemas de Valor Inicial.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 26 de março de 2020
%
%%

function yRK2 = RK2(f, a, b, n, y0)

h       = (b-a)/n;          % Divisão em partes iguais do intervalo [a, b] com passo n
t       = a:h:b;            % Matriz linear com os valores de t, partindo de a até b, com passo n
yRK2    = zeros(1, n+1);    % Alocação de memória - Inicialização da matriz de resultado y com o valor 0 em todas as suas entradas
yRK2(1) = y0;               % Valor inicial de y guardado na posição 1 da matriz y

for i = 1:n 
    k1        = h * f(t(i), yRK2(i));
    k2        = h * f(t(i+1), yRK2(i) + k1);
    yRK2(i+1) = yRK2(i) + (k1 + k2)/2;
end