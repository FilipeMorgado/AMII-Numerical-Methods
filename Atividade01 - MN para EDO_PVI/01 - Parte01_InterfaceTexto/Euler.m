%%                  METODO DE EULER PARA PVI
%       yEuler = MEuler(f, a, b, n, y0) - M�todo num�rico para a resolu��o de um PVI
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
%       y(i+1) = y(i)+h*f(t(i),y(i)) , i = 0, 1, ..., n-1
% 
%   De acordo com Boyce e Diprima os trabalhos iniciais em m�todos
%   num�ricos se iniciaram com Isaac Newton e Leibniz, mas foi com Lehonard
%   Euler no sec. XVIII que os m�todos num�ricos tiveram forma mais concreta,
%   Euler deduziu um processo iterativo que permitia determinar, de forma
%   aproximada, a solu��o de um problema de condi��o inicial num determinado
%   ponto. 
%   � o tipo mais b�sico de m�todo expl�cito para integra��o num�rica 
%   para equa��es diferenciais ordin�rias.
% 
%
%   Autores: Arm�nio Correia     .: armenioc@isec.pt
%            Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de mar�o de 2020
%
%%
function yEuler = Euler(f, a, b, n, y0)

h         = (b-a)/n;            % Divis�o em partes iguais do intervalo [a, b] com passo n
t         = a:h:b;
yEuler    = zeros(1, n+1);      % Aloca��o de mem�ria - Inicializa��o da matriz de resultado y com o valor 0 em todas as suas entradas
yEuler(1) = y0;                 % Valor inicial de y guardado na posi��o 1 da matriz y 

for i = 1:n
    yEuler(i+1) = yEuler(i) + h * f(t(i), yEuler(i));
end

