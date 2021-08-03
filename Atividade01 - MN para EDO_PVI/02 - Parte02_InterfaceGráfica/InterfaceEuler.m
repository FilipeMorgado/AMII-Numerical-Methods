%%                INTERFACE PARA O M�TODO DE EULER
%
%   Aplica��o do M�todo de Euler e apresenta��o do seu resultado, 
%   juntamente com o resultado da solu��o exata do PVI, sob a
%   forma de tabela e gr�fico.
%   
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de mar�o de 2020
%
%% Apresenta��o da interface

disp(' ')
disp(' ')
disp('---------------------------------------------------------')
disp(' ')
disp('               M�TODO NUM�RICO DE EULER               ')
disp('     EQUA��ES DIFERENCIAIS ORDIN�RIAS E PROBLEMAS DE  ')
disp('                     VALOR INICIAL                    ')
disp(' ')

%% Obten��o dos dados do PVI atrav�s de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associa��o dos valores do PVI aos dados necess�rios para o MEuler

strF  = string(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% Implemta��o da fun��o para resolu��o de EDO/PVI pelo MEuler e calculo da S_Exata

yEuler = Euler(f, a, b, n, y0);

%% C�lculo da solu��o exata para o PVI apresentado

solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));

h = (b - a) / n;
t = a:h:b;
yExata = g(t);

%% C�lculo do erro do m�todo

erro = abs(yEuler - yExata);

%% Apresenta��o dos resultados obtidos

disp('-------- Solu��o do PVI em modo tabela de valores -------')
disp(' ')

varNames = {'t', 'Euler', 'Exata', 'Erro'};
T = table(transpose(t), transpose(yEuler), transpose(yExata), transpose(erro), 'VariableNames', varNames);
disp(T)

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solu��o em modo gr�fico ----------------')
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
