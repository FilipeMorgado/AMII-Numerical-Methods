%%              INTERFACE DE MENU PARA GUIA DO UTILIZADOR
%
%   Esta interface tem o objetivo de guiar o utilizador pelas diversas
%   funcionalidades do nosso programa. Come�ando por recolher os valores do
%   PVI abordado e em seguida aplicando os m�todos num�ricos desejados,
%   sempre com a solu��o exata como refer�ncia
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt         
%            M� F�tima Rodrigues .: a2019112924@isec.pt
%
%
%   Data: 26 de mar�o de 2020
%
%%

clc;
clear;
select = '1';
while (select ~= '0')
    clc;
    % Verificar se j� existe algum PVI no sistema
    fileID = fopen('controlador.txt', 'r');
    aux = textscan(fileID, "%s");
    fclose(fileID);
    aux2 = string(aux{1});
    if (aux2 == "true")
        progStart = 1;
    else
        progStart = 0;
    end
    
    if (progStart == true)
        % Entrada de dados do PVI e valida��o dos valores introduzidos
        disp(' ')
        disp('-------------------------- PVI --------------------------')
        disp('--------------------- Dados do PVI ----------------------')
        disp(' ')
        
        while 1
            strF = input('f(t,y) = ', 's');
            funcao = strF;
            f = @(t,y) eval(vectorize(strF));
            try
                syms t y;
                fTest = f(t,y);
                break;
            catch me
                errordlg('ERRO! Introduza uma fun��o em t e y', ...
                         'ERRO', 'modal');
            end
        end

        while 1
            a = str2num(input('a = ', 's'));
            if (isscalar(a) && isreal(a))
                break;
            else
                errordlg('Introduza um n�mero real a',...
                         'ERRO', 'modal');
            end
        end

        while 1
            b = str2num(input('b = ', 's'));
            if (isscalar(b) && isreal(b) && b > a)
                break;
            else
                errordlg('Introduza um n�mero real b, com b > a',...
                         'ERRO', 'modal');
            end
        end

        while 1 
            n = str2num(input('n = ', 's'));
            if (isscalar(n) && mod(n,1) == 0 && n > 0)
                break;
            else
                errordlg('Introduza um n�mero inteiro n, com n > 0',...
                         'ERRO', 'modal');
            end
        end

        while 1
            y0 = str2num(input(['y(',num2str(a),') = '], 's'));
            if (isscalar(y0) && isreal(y0))
                break;
            else
                errordlg(['Introduza o valor de y(', num2str(a),')'],...
                         'ERRO', 'modal');
            end
        end

        % Passagem dos valores obtidos para string
        v_a  = num2str(a);
        v_b  = num2str(b);
        v_n  = num2str(n);
        v_y0 = num2str(y0);
        
        % Guardar os valores obtidos num documento externo para possivel
        % execu��o das diversas interfaces de cada um dos m�todos
        
        file = fopen('pvi.txt', 'w');
        fprintf(file, '%s %s %s %s %s\n', strF, v_a, v_b, v_n, v_y0);
        fclose(file);
        
        % Impedir que o programa volte autom�ticamente para a introdu��o
        % dos dados do PVI
        fileID = fopen('controlador.txt', 'w');
        fprintf('false\n');
        fclose(fileID);
        
        
    else
        fileID = fopen('pvi.txt', 'r');
        C = textscan(fileID,'%s%s%s%s%s');
        fclose(fileID);
        
        strF  = char(C{1});
        a  = str2num(string(C{2}));
        b  = str2num(string(C{3}));
        n  = str2num(string(C{4}));
        y0 = str2num(string(C{5}));
        
        
        disp(' ')
        disp('-------------------------- PVI --------------------------')
        disp(' ')
        disp(['(1) ED: ', strF])
        disp(['(2) t pertence ao intervalo [', num2str(a), ', ', num2str(b), ']'])
        disp(['(3) CI: y(',num2str(a),') = ', num2str(y0), ' '])
        disp(' ')
        
        % Inicializa��o do Menu do utilizador
        disp('------------------------- MENU --------------------------')
        disp(' ')
        disp('1 - M�todo de Euler')
        disp('2 - M�todo de Euler Melhorado')
        disp('3 - M�todo de Runge - Kutta de Ordem 2')
        disp('4 - M�todo de Runge - Kutta de Ordem 3')
        disp('5 - M�todo de Runge - Kutta de Ordem 4')
        disp('6 - Fun��o ODE45 (Passo Simples)')
        disp('7 - Fun��o ODE113 (Passo M�ltiplo)')
        disp('A - M�todo de Adams-Bashforth (Passo M�ltiplo)')
        disp(' ')
        disp('8 - Apresenta todos os m�todos')     
        disp('9 - Alterar os dados do PVI')
        disp('0 - Fechar Interface de Texto')
        disp('---------------------------------------------------------')
        
        select = input('Op��o: ', 's');
        
        switch select
            case '1'
                run InterfaceEuler.m;
            case '2'
                run InterfaceEulerM.m;
            case '3'
                run InterfaceRK2.m;
            case '4'
                run InterfaceRK3.m;
            case '5'
                run InterfaceRK4.m;
            case '6'
                run InterfaceODE45.m;
            case '7'
                run InterfaceODE113.m;
            case 'A'
                run InterfaceAdams.m;
            case 'a'
                run InterfaceAdams.m;
            case '8'
                run InterfaceConjunto.m;
            case '9'
                fileID = fopen('controlador.txt', 'w');
                fprintf(fileID, 'true\n');
                fclose(fileID);
            case '0'
                fileID = fopen('controlador.txt', 'w');
                fprintf(fileID, 'true\n');  % True -> Pede PVI na proxima inicializa��o // False -> Vai direto ao menu e usa o PVI anterior
                fclose(fileID);
                clc;
                run menu.m;
            otherwise
                errordlg('Op��o introduzida n�o � v�lida! PROGRAMA TERMINADO',...
                         'ERRO', 'MODAL');
                break;
        end
    end
end
