%%                  METODO DE EULER MELHORADO PARA PVI
%       y = MEulerM(f,a,b,n,y0) - Método numérico para a resolução de um PVI
%       y'= f(t,y) com t=[a, b] e y(a)=y0 - Condição inicial  
%
%    -> INPUT:
%       f       - função do 2.º membro da Equação Diferencial: y' = f(t,y)
%       [a, b]  - extremos do intervalo da variável independente t
%       n       - número de subintervalos ou iterações do método
%       y0      - condição inicial t = a -> y = y0
%
%   ->  OUTPUT: 
%       y - vetor das soluções aproximadas da solução exata
%       y(i+1) = y(i)+h/2 * f(t(i), y(i)) + f(t(i+1), y(i+1), i =0,1,...,n-1
%
%   O Método de Euler Melhorado, consiste em uma aproximação semelhante
%   ao primeiro método utilizado, o Método de Euler, onde para fazer a aproximação devemos
%   realizar todos os passos do método de Euler, desta forma observamos que o
%   método de Euler melhorado é uma modificação do método de Euler.
%
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de março de 2020
%
%%

function yEulerM = EulerM(f, a, b, n, y0)

h    = (b-a)/n;                  % Divisão em partes iguais do intervalo [a, b] com passo n
t    = a:h:b;                    % Matriz linear com os valores de t, partindo de a até b, com passo n  
yEulerM    = zeros(1, n+1);      % Alocação de memória - Inicialização da matriz de resultado y com o valor 0 em todas as suas entradas
yEulerM(1) = y0;                 % Valor inicial de y guardado na posição 1 da matriz y 

for i = 1:n
    yEulerM(i+1) = yEulerM(i) + h * f(t(i), yEulerM(i));
    yEulerM(i+1) = yEulerM(i) + h/2 * (f(t(i), yEulerM(i)) + f(t(i+1), yEulerM(i+1)));
end


