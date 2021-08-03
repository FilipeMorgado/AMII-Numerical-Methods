%%       INTERFACE PARA O MÉTODO DE RUNGE - KUTTA DE ORDEM 4 (RK4)
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
%   Data: 27 de março de 2020
%
%% Apresentação da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('  MÉTODO DE RUNGE - KUTTA DE ORDEM 4 PARA RESOLUÇÃO DE  ')
disp('    EQUAÇÕES DIFERENCIAIS ORDINÁRIAS E PROBLEMAS DE     ')
disp('                    VALOR INICIAL                       ')
disp(' ')

%% Obtenção dos dados do PVI atravavés de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associação dos valores do PVI aos dados necessários para o M_RK4

strF  = string(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implementação da função para resolução de EDO/PVI pelo M_RK4 e calculo da S_Exata

yRK4      = RK4(f, a, b, n, y0);

%% Cálculo da solução exata para o PVI apresentado

solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
t = a:h:b;
yExata = g(t);

%% Cálculo do erro do método

erro = abs(yRK4 - yExata);

%% Apresentação dos resultados obtidos

disp('-------- Solução do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'RK4', 'Exata', 'Erro'};
T = table(transpose(t), transpose(yRK4), transpose(yExata), transpose(erro), 'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solucao em modo grafico ----------------')
plot(t, yRK4, '-r*')
hold on
plot(t, yExata, '-bo')
hold off
grid on
legend('RK4', 'Exata')
shg;

%% Voltar para a interface de Menu
writetable(T, 'resultados_MNEDOPVI.xlsx', 'Sheet', 5, 'Range', 'B2:E600');
run InterfaceMenu.m
