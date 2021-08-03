%%       INTERFACE PARA O MÉTODO DE RUNGE - KUTTA DE ORDEM 3 (RK3)
%
%   Aplicação do Método Numérico de Runge - Kutta e apresentação do seu
%   resultado, juntamente com o resultado da solução exata do PVI, sob a
%   forma de tabela e gráfico.
%   
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 30 de março de 2020
%
%% Apresentação da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('  MÉTODO DE RUNGE - KUTTA DE ORDEM 3 PARA RESOLUÇÃO DE   ')
disp('    EQUAÇÕES DIFERENCIAIS ORDINÁRIAS E PROBLEMAS DE      ')
disp('                    VALOR INICIAL                        ')
disp(' ')

%% Obtenção dos dados do PVI através de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associação dos valores do PVI aos dados necessários para o M_RK3

strF  = string(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implemtação da função para resolução de EDO/PVI pelo M_RK3 e calculo da S_Exata

yRK3 = RK3(f, a, b, n, y0);

%% Cálculo da solução exata para o PVI apresentado

solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
t = a:h:b;
yExata = g(t);

%% Cálculo do erro do método

erro = abs(yRK3 - yExata);

%% Apresentação dos resultados obtidos

disp('-------- Solução do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'RK3', 'Exata', 'Erro'};
T = table(transpose(t), transpose(yRK3), transpose(yExata), transpose(erro),'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solução em modo gráfico ----------------')
plot(t, yRK3, '-r*')
hold on
plot(t, yExata, '-bo')
hold off
grid on
legend('RK3', 'Exata')
shg;

%% Voltar para a interface de Menu
writetable(T, 'resultados_MNEDOPVI.xlsx', 'Sheet', 4, 'Range', 'B2:E600');
run InterfaceMenu.m
