%%              INTERFACE DO CONJUNTO DE TODOS OS MÉTODOS
%
%   Esta interface tem o objetivo de apresentar ao utilizador todos os
%   métodos abordados individualmente, condesando todos numa única tabela e
%   gráfico para facilitar a visualuzação e análise por parte do utilizador
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 30 de março de 2020
%
%% Apresentação da Interface

disp('---------------------------------------------------------')
disp('     INTERFACE CONJUNTA DE TODOS OS MÉTODOS ABORDADOS    ')
disp('      EULER, EULER MODIFICADO, RK2, RK3, RK4, ODE45,     ')
disp('    ODE113 e ADAMS-BASHFORTH PARA RESOLUÇÃO DE UM PVI    ')
disp(' ')

%% Obtenção dos dados do PVI através de um documento externo

fileID = fopen('pvi.txt');
C = textscan(fileID,'%s%s%s%s%s');
fclose(fileID);

%% Associação dos valores do PVI aos dados necessários

strF  = string(C{1});
f  = @(t,y) eval(vectorize(strF));
a  = str2num(string(C{2}));
b  = str2num(string(C{3}));
n  = str2num(string(C{4}));
y0 = str2num(string(C{5}));

%% CHAMADA DOS MÉTODOS NUMÉRICOS

yEuler   = Euler(f, a, b, n, y0);
yEulerM  = EulerM(f, a, b, n, y0);
yRK2     = RK2(f, a, b, n, y0);
yRK3     = RK3(f,a,b,n,y0);
yRK4     = RK4(f, a, b, n, y0);
[t, yA]  = ODE45(f, a, b, n, y0);
[t, yB]  = ODE113(f, a, b, n, y0);
yAdams   = Adams(f, a, b, n, y0);

%% CALCULO DA SOLUÇÃO PARTICULAR

solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
            
g = @(t)    eval(vectorize(char(solucao_particular)));
yExata = g(t);

%% CALCULO DO ERRO DE CADA MÉTODO

eEuler = abs(yEuler - yExata.');
eEulerM = abs(yEulerM - yExata.');
eRK2 = abs(yRK2 - yExata.');
eRK3 = abs(yRK3 - yExata.');
eRK4 = abs(yRK4 - yExata.');
eODE45 = abs(yA - yExata);
eODE113 = abs(yB - yExata);
eAdams = abs(yAdams - yExata.');

%% APRESENTAÇÃO DOS DADOS NA FORMA DE TABELA

disp('-------- Solução do PVI em modo tabela de valores -------')
disp(' ')
varNames1 = {'t', 'Euler', 'EulerModificado', 'RK2', 'RK3', 'RK4', 'ODE45', 'ODE113', 'Adams', 'Exata'};
varNames2 = {'t', 'ErroEuler', 'ErroEulerModificado', 'ErroRK2', 'ErroRK3', 'ErroRK4', 'ErroODE45', 'ErroODE113', 'ErroAdams'};
TR = table(t, transpose(yEuler), transpose(yEulerM), transpose(yRK2), transpose(yRK3), transpose(yRK4), yA, yB, transpose(yAdams), yExata, 'VariableNames', varNames1);
TE = table(t, transpose(eEuler), transpose(eEulerM), transpose(eRK2), transpose(eRK3), transpose(eRK4), eODE45, eODE113, transpose(eAdams), 'VariableNames', varNames2);
disp(TR)
disp(' ')
disp(TE)
disp(' ')

%% APRESENTAÇÃO DOS RESULTADOS NA FORMA GRÁFICA

input('------------- Prima uma tecla para continuar ------------')
disp('---------------- Solução em modo gráfico ----------------')
plot(t, yEuler, '-r*')
hold on
plot(t, yEulerM, '-bo')
plot(t, yRK2, '-g^')
plot(t, yRK3, ':b')
plot(t, yRK4, ':m')
plot(t, yA, '--c')
plot(t, yB, ':c*')
plot(t, yAdams, '--r*')
plot(t, yExata, '-ks')
hold off
grid on
legend('Euler', 'EulerModificado', 'RK2', 'RK3', 'RK4', 'ODE45', 'ODE113', 'Adams', 'Exata')
shg;

%% Voltar para a interface de menu
writetable(TR, 'resultados_MNEDOPVI.xlsx', 'Sheet', 9, 'Range', 'B2:K600');
writetable(TE, 'resultados_MNEDOPVI.xlsx', 'Sheet', 9, 'Range', 'M2:U600');
run InterfaceMenu.m




