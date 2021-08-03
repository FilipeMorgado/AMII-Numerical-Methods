%%                  METODO DE EULER PARA PVI
%       yEuler = MEuler(f, a, b, n, y0) - Método numérico para a resolução de um PVI
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
%       y(i+1) = y(i)+h*f(t(i),y(i)) , i = 0, 1, ..., n-1
% 
%   De acordo com Boyce e Diprima os trabalhos iniciais em métodos
%   numéricos se iniciaram com Isaac Newton e Leibniz, mas foi com Lehonard
%   Euler no sec. XVIII que os métodos numéricos tiveram forma mais concreta,
%   Euler deduziu um processo iterativo que permitia determinar, de forma
%   aproximada, a solução de um problema de condição inicial num determinado
%   ponto. 
%   É o tipo mais básico de método explícito para integração numérica 
%   para equações diferenciais ordinárias.
% 
%
%   Autores: Arménio Correia     .: armenioc@isec.pt
%            Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de março de 2020
%
%%
function yEuler = Euler(f, a, b, n, y0)

h         = (b-a)/n;            % Divisão em partes iguais do intervalo [a, b] com passo n
t         = a:h:b;
yEuler    = zeros(1, n+1);      % Alocação de memória - Inicialização da matriz de resultado y com o valor 0 em todas as suas entradas
yEuler(1) = y0;                 % Valor inicial de y guardado na posição 1 da matriz y 

for i = 1:n
    yEuler(i+1) = yEuler(i) + h * f(t(i), yEuler(i));
end

