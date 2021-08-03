%%                  M�TODO DE RUNGE - KUTTA DE ORDEM 4 (RK4)
%      y  = RK4(f, a, b, n, y0) - M�todo num�rico para a resolu��o de um PVI
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
%      y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2, k3, k4:
%           K1 = h * f(t(i), yRK4(i));   
%           K2 = h * f(t(i)+(h/2), yRK4(i)+(K1)/2);
%           K3 = h * f(t(i)+(h/2),yRK4(i)+(K2/2));
%           K4 = h * f(t(i+1), yRK4(i)+K3);
%
%   O m�todo de Runge-Kutta de ordem 4 (RK4) � mais um dos muitos m�todos num�ricos 
%   iterativos, impl�citos e expl�citos, para a resolu��o num�rica (aproxima��o) de 
%   solu��es de Equa��es Diferenciais Ordin�rias / Problemas de Valor Inicial. 
%   O RK4 � considerado o m�todo mais preciso da fam�lia Runge - Kutta, sendo que 
%   quanto maior for o n�mero de subintervalos, maior ser� a aproxima��o � solu��o
%   exata.  
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 27 de mar�o de 2020
%
%%
function yRK4 = RK4(f, a, b, n, y0)     

% Inicializa��o das matrizes y e t com o valor 0 em todas as suas entradas
yRK4    = zeros(1, n+1);     
h       = (b-a)/n;          % Divis�o em partes iguais do intervalo [a, b] com passo n
t       = a:h:b;            % Valor de a guardado na posi��o 1 da matriz t   
yRK4(1) = y0;               % Valor inicial de y guardado na posi��o 1 da matriz y

for i = 1:n
    K1        = h * f(t(i), yRK4(i));   
    K2        = h * f(t(i)+(h/2), yRK4(i)+(K1)/2);
    K3        = h * f(t(i)+(h/2),yRK4(i)+(K2/2));
    K4        = h * f(t(i+1), yRK4(i)+K3);
    yRK4(i+1) = yRK4(i)+(K1+2*K2+2*K3+K4)/6;
end
