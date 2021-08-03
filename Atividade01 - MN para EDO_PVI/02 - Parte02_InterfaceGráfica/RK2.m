%%                  M�TODO DE RUNGE - KUTTA DE ORDEM 2 (RK2)
%      y  = RK2(f, a, b, n, y0) - M�todo num�rico para a resolu��o de um PVI
%      y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi��o inicial
%
%   -> INPUT:
%      f      - fun��o do 2� membro da Equa��o Diferencial: y' = f(t,y)
%      [a, b] - extremos do intervalo da vari�vel independente t
%      n      - n�mero de subintervalos ou intera��es do m�todo
%      y0     - condi��o inicial: t = a -> y = y0
%
%   -> OUTPUT:
%      y - vetor das solu��es aproximadas da solu��o exata
%      y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2:
%          k1     = h * f(t(i), y(i)),
%          k2     = h * f(t(i+1), y(i+1)).
%
%   O m�todo de Runge - Kutta de ordem 2 (RK2) � um dos m�todos n�mericos
%   desenvolvidos pelos matem�ticos alem�es Carl Runge e Martin Kutta, por
%   volta de 1900. Os m�todos desenvolvidos pelos dois matem�ticos formam 
%   uma vasta fam�lia de m�todos num�ricos diretos de passo simples para a 
%   resolu��o de Equa��es Diferenciais Ordin�rias / Problemas de Valor Inicial.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%   Data: 26 de mar�o de 2020
%
%%

function yRK2 = RK2(f, a, b, n, y0)

h       = (b-a)/n;          % Divis�o em partes iguais do intervalo [a, b] com passo n
t       = a:h:b;            % Matriz linear com os valores de t, partindo de a at� b, com passo n
yRK2    = zeros(1, n+1);    % Aloca��o de mem�ria - Inicializa��o da matriz de resultado y com o valor 0 em todas as suas entradas
yRK2(1) = y0;               % Valor inicial de y guardado na posi��o 1 da matriz y

for i = 1:n 
    k1        = h * f(t(i), yRK2(i));
    k2        = h * f(t(i+1), yRK2(i) + k1);
    yRK2(i+1) = yRK2(i) + (k1 + k2)/2;
end