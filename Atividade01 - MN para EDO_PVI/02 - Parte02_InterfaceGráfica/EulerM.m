%%                  METODO DE EULER MELHORADO PARA PVI
%       y = MEulerM(f,a,b,n,y0) - M�todo num�rico para a resolu��o de um PVI
%       y'= f(t,y) com t=[a, b] e y(a)=y0 - Condi��o inicial  
%
%    -> INPUT:
%       f       - fun��o do 2.� membro da Equa��o Diferencial: y' = f(t,y)
%       [a, b]  - extremos do intervalo da vari�vel independente t
%       n       - n�mero de subintervalos ou itera��es do m�todo
%       y0      - condi��o inicial t = a -> y = y0
%
%   ->  OUTPUT: 
%       y - vetor das solu��es aproximadas da solu��o exata
%       y(i+1) = y(i)+h/2 * f(t(i), y(i)) + f(t(i+1), y(i+1), i =0,1,...,n-1
%
%   O M�todo de Euler Melhorado, consiste em uma aproxima��o semelhante
%   ao primeiro m�todo utilizado, o M�todo de Euler, onde para fazer a aproxima��o devemos
%   realizar todos os passos do m�todo de Euler, desta forma observamos que o
%   m�todo de Euler melhorado � uma modifica��o do m�todo de Euler.
%
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de mar�o de 2020
%
%%

function yEulerM = EulerM(f, a, b, n, y0)

h    = (b-a)/n;                  % Divis�o em partes iguais do intervalo [a, b] com passo n
t    = a:h:b;                    % Matriz linear com os valores de t, partindo de a at� b, com passo n  
yEulerM    = zeros(1, n+1);      % Aloca��o de mem�ria - Inicializa��o da matriz de resultado y com o valor 0 em todas as suas entradas
yEulerM(1) = y0;                 % Valor inicial de y guardado na posi��o 1 da matriz y 

for i = 1:n
    yEulerM(i+1) = yEulerM(i) + h * f(t(i), yEulerM(i));
    yEulerM(i+1) = yEulerM(i) + h/2 * (f(t(i), yEulerM(i)) + f(t(i+1), yEulerM(i+1)));
end


