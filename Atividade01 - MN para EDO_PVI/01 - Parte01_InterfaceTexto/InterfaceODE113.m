%%                 INTERFACE PARA O MÉTODO ODE113
%
%   Aplicação do ODE113 solver do Matlab e apresentação do seu
%   resultado, juntamente com o resultado da solução exata do PVI,
%   sob a forma de tabela e gráfico.
%   
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 31 de março de 2020
% 
%% Apresentação da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('                    ODE113 do Matlab                     ')
disp('     EQUAÇÕES DIFERENCIAIS ORDINÁRIAS E PROBLEMAS DE     ')
disp('                     VALOR INICIAL                       ')
disp(' ') 

%% Obtenção dos dados do PVI através de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associação dos valores do PVI aos dados necessários para o ODE113

strF  = char(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implemtação da função para resolução de EDO/PVI pelo ODE45 e calculo da S_Exata

[t, yB] = ODE113(f, a, b, n, y0);

%% Cálculo da solução exata para o PVI apresentado
solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
yExata = g(t);

%% Cálculo do erro do método

erro = abs(yB - yExata);

%% Apresentação dos resultados obtidos

disp('-------- Solução do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'ODE113', 'Exata', 'Erro'};
T = table(t, yB, yExata, erro, 'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solução em modo gráfico ----------------')
plot(t, yB, '-r*')
hold on
plot(t, yExata, '-bo')
hold off
grid on
legend('ODE45', 'Exata')
shg;

%% Voltar para a interface de Menu
writetable(T, 'resultados_MNEDOPVI.xlsx', 'Sheet', 7, 'Range', 'B2:E600');
run InterfaceMenu.m
