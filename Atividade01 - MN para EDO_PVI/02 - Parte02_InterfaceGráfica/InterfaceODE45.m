%%                 INTERFACE PARA O M�TODO ODE45
%
%   Aplica��o do ODE45 solver do Matlab e apresenta��o do seu
%   resultado, juntamente com o resultado da solu��o exata do PVI, sob a
%   forma de tabela e gr�fico.
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 28 de mar�o de 2020
% 
%% Apresenta��o da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('                    ODE45 do Matlab                      ')
disp('    EQUA��ES DIFERENCIAIS ORDIN�RIAS E PROBLEMAS DE      ')
disp('                     VALOR INICIAL                       ')
disp(' ')

%% Obten��o dos dados do PVI atrav�s de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associa��o dos valores do PVI aos dados necess�rios para o ODE45

strF  = char(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implemta��o da fun��o para resolu��o de EDO/PVI pelo ODE45 e calculo da S_Exata

[t, yA] = ODE45(f, a, b, n, y0);

%% C�lculo da solu��o exata para o PVI apresentado
solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
yExata = g(t);

%% C�lculo do erro do m�todo

erro = abs(yA - yExata);

%% Apresenta��o dos resultados obtidos

disp('-------- Solu��o do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'ODE45', 'Exata', 'Erro'};
T = table(t, yA, yExata, erro, 'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solu��o em modo gr�fico ----------------')
plot(t, yA, '-r*')
hold on
plot(t, yExata, '-bo')
hold off
grid on
legend('ODE45', 'Exata')
shg;

%% Voltar para a interface de Menu
writetable(T, 'resultados_MNEDOPVI.xlsx', 'Sheet', 6, 'Range', 'B2:E600');
run InterfaceMenu.m
