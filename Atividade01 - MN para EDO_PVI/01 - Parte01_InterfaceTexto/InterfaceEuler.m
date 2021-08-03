%%                INTERFACE PARA O MÉTODO DE EULER
%
%   Aplicação do Método de Euler e apresentação do seu resultado, 
%   juntamente com o resultado da solução exata do PVI, sob a
%   forma de tabela e gráfico.
%   
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de março de 2020
%
%% Apresentação da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('               MÉTODO NUMÉRICO DE EULER               ')
disp('     EQUAÇÕES DIFERENCIAIS ORDINÁRIAS E PROBLEMAS DE  ')
disp('                     VALOR INICIAL                    ')
disp(' ')

%% Obtenção dos dados do PVI através de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associação dos valores do PVI aos dados necessários para o MEuler

strF  = string(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implemtação da função para resolução de EDO/PVI pelo MEuler e calculo da S_Exata

yEuler = Euler(f, a, b, n, y0);

%% Cálculo da solução exata para o PVI apresentado

solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
t = a:h:b;
yExata = g(t);

%% Cálculo do erro do método

erro = abs(yEuler - yExata);

%% Apresentação dos resultados obtidos

disp('-------- Solução do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'Euler', 'Exata', 'Erro'};
T = table(transpose(t), transpose(yEuler), transpose(yExata), transpose(erro), 'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solução em modo gráfico ----------------')
plot(t, yEuler, '-r*')
hold on
plot(t, yExata, '-bo')
hold off
grid on
legend('Euler', 'Exata')
shg;

%% Voltar para a interface de Menu
writetable(T, 'resultados_MNEDOPVI.xlsx', 'Sheet', 1, 'Range', 'B2:E600');
run InterfaceMenu.m
