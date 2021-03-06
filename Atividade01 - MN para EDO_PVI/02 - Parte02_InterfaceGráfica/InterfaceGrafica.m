function varargout = InterfaceGrafica(varargin)
% INTERFACEGRAFICA MATLAB code for InterfaceGrafica.fig
%      INTERFACEGRAFICA, by itself, creates a new INTERFACEGRAFICA or raises the existing
%      singleton*.
%
%      H = INTERFACEGRAFICA returns the handle to a new INTERFACEGRAFICA or the handle to
%      the existing singleton*.
%
%      INTERFACEGRAFICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACEGRAFICA.M with the given input arguments.
%
%      INTERFACEGRAFICA('Property','Value',...) creates a new INTERFACEGRAFICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfaceGrafica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfaceGrafica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfaceGrafica

% Last Modified by GUIDE v2.5 27-Apr-2020 12:10:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfaceGrafica_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfaceGrafica_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InterfaceGrafica is made visible.
function InterfaceGrafica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfaceGrafica (see VARARGIN)

% Choose default command line output for InterfaceGrafica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfaceGrafica wait for user response (see UIRESUME)
% uiwait(handles.figIntGrafica);


% --- Outputs from this function are returned to the command line.
function varargout = InterfaceGrafica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edtFunc_Callback(hObject, eventdata, handles)
% hObject    handle to edtFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtFunc as text
%        str2double(get(hObject,'String')) returns contents of edtFunc as a double
    strF = get(hObject, 'String');
    f = @(t,y) eval(vectorize(strF));
    try
        syms t y;
        fTest = f(t,y);
        set(hObject, 'BackgroundColor', 'white');
    catch me
        set(hObject, 'BackgroundColor', 'red');
        errordlg('ERRO! Introduza uma fun????o em t e y', ...
                 'ERRO', 'modal');
    end
    
    handles.funcao = f;
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edtFunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edtY0_Callback(hObject, eventdata, handles, abase)
% hObject    handle to edtY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtY0 as text
%        str2double(get(hObject,'String')) returns contents of edtY0 as a double
    y0 = str2num(get(hObject,'string'));
    a = get(handles.edtA,'string');
    if (isscalar(y0) && isreal(y0))
        set(hObject, 'BackgroundColor', 'white');
    else
        set(hObject, 'BackgroundColor', 'red');
        errordlg(['Introduza o valor de y(', a,')'],...
                 'ERRO', 'modal');
    end
    
    handles.y0 = y0;
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edtY0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edtA_Callback(hObject, eventdata, handles)
% hObject    handle to edtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtA as text
%        str2double(get(hObject,'String')) returns contents of edtA as a double
    
    a = str2num(get(hObject, 'string'));
    if (isscalar(a) && isreal(a) && a < str2num(get(handles.edtB, 'String')))
        set(hObject, 'BackgroundColor', 'white');
    else
        set(hObject, 'BackgroundColor', 'red');
        errordlg('Introduza um n??mero real a, com a < b',...
                 'ERRO', 'modal');
    end
    
    handles.a = a;
    guidata(hObject, handles);
    
    set(handles.text5, 'String', ['y (', num2str(a),')']);


% --- Executes during object creation, after setting all properties.
function edtA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edtB_Callback(hObject, eventdata, handles)
% hObject    handle to edtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtB as text
%        str2double(get(hObject,'String')) returns contents of edtB as a double
    
    b = str2num(get(hObject, 'String'));
    if (isscalar(b) && isreal(b) && b > str2num(get(handles.edtA, 'String')))
        set(hObject, 'BackgroundColor', 'white');
    else
        set(hObject, 'BackgroundColor', 'red');
        errordlg('Introduza um n??mero real b, com b > a',...
                 'ERRO', 'modal');
    end
    
    handles.b = b;
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edtB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function sliderH_Callback(hObject, eventdata, handles)
% hObject    handle to sliderH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
    val = round(hObject.Value);
    hObject.Value = val;
    set(handles.edtN, 'String', num2str(get(hObject, 'Value')));
    handles.N = val;
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sliderH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in btnAtualizar.
function btnAtualizar_Callback(hObject, eventdata, handles)
% hObject    handle to btnAtualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    strF = get(handles.edtFunc, 'String');
    f = @(t,y) eval(vectorize(strF));
    try
        syms t y;
        fTest = f(t,y);
        set(handles.edtFunc, 'BackgroundColor', 'white');
    catch me
        set(handles.edtFunc, 'BackgroundColor', 'red');
        errordlg('ERRO! Introduza uma fun????o em t e y', ...
                 'ERRO', 'modal');
    end
    
    a = str2num(get(handles.edtA, 'string'));
    if (isscalar(a) && isreal(a) && a < str2num(get(handles.edtB, 'String')))
        set(handles.edtA, 'BackgroundColor', 'white');
    else
        set(handles.edtA, 'BackgroundColor', 'red');
        errordlg('Introduza um n??mero real a, com a < b',...
                 'ERRO', 'modal');
    end
    
    b = str2num(get(handles.edtB, 'String'));
    if (isscalar(b) && isreal(b) && b > str2num(get(handles.edtA, 'String')))
        set(handles.edtB, 'BackgroundColor', 'white');
    else
        set(handles.edtB, 'BackgroundColor', 'red');
        errordlg('Introduza um n??mero real b, com b > a',...
                 'ERRO', 'modal');
    end

    y0 = str2num(get(handles.edtY0,'string'));
    ya = get(handles.edtA,'string');
    if (isscalar(y0) && isreal(y0))
        set(handles.edtY0, 'BackgroundColor', 'white');
    else
        set(handles.edtY0, 'BackgroundColor', 'red');
        errordlg(['Introduza o valor de y(', ya,')'],...
                 'ERRO', 'modal');
    end
    
    n = get(handles.sliderH, 'Value');
    
    % Calculo da solu????o particular
    solucao_particular = dsolve(['Dy = ', char(strF)],['y(', num2str(a), ') = ', num2str(y0)]);
    g = @(t)    eval(vectorize(char(solucao_particular)));
    h = (b - a) / n;
    t = a:h:b;
    yExata = g(t);
    
    table_data = [transpose(t), transpose(yExata)];
    set(handles.objTable, 'Data', table_data, 'ColumnName', {'T', 'Exata'});
    table_data = get(handles.objTable, 'Data');
    plot(handles.objGraph, t, yExata);
    plot(t, yExata, '-r*');
    legend('Exata');
    hold on
    
    % Fazer o plot dos outros m??todos
    if (get(handles.cbEuler, 'Value') == 1)
        yEuler = Euler(f, a, b, n, y0);
        erroEuler = abs(yEuler - yExata);
        table_data(:,end+1) = transpose(yEuler);
        table_data(:,end+1) = transpose(erroEuler);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'Euler';
        table_name{end+1} = 'Erro - Euler';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yEuler, '-bo', 'DisplayName', 'Euler');
        legend('off');
        legend('show');
    end
    
    if (get(handles.cbEulerM, 'Value') == 1)
        yEulerM = EulerM(f, a, b, n, y0);
        erroEulerM = abs(yEulerM - yExata);
        table_data(:,end+1) = transpose(yEulerM);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'Euler Melhorado';
        table_name{end+1} = 'Erro - EulerM';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yEulerM, '-go', 'DisplayName', 'Euler Melhorado');
        legend('off');
        legend('show');
    end 
        
    if (get(handles.cbRK2, 'Value') == 1)
        yRK2 = RK2(f, a, b, n, y0);
        erroRK2 = abs(yRK2 - yExata);
        table_data(:,end+1) = transpose(yRK2);
        table_data(:,end+1) = transpose(erroRK2);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'RK2';
        table_name{end+1} = 'Erro - RK2';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yRK2, '-co', 'DisplayName', 'Runge-Kutta 2');
        legend('off');
        legend('show');
    end 
    
    if (get(handles.cbRK3, 'Value') == 1)
        yRK3 = RK3(f, a, b, n, y0);
        erroRK3 = abs (yRK3 - yExata);
        table_data(:,end+1) = transpose(yRK3);
        table_data(:,end+1) = transpose(erroRK3);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'RK3';
        table_name{end+1} = 'Erro - RK3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yRK3, '-yo', 'DisplayName', 'Runge-Kutta 3');
        legend('off');
        legend('show');
    end 
    
    if (get(handles.cbRK4, 'Value') == 1)
        yRK4 = RK4(f, a, b, n, y0);
        erroRK4 = abs (yRK4 - yExata);
        table_data(:,end+1) = transpose(yRK4);
        table_data(:,end+1) = transpose(erroRK4);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'RK4';
        table_name{end+1} = 'Erro - RK4';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yRK4, '-mo', 'DisplayName', 'Runge-Kutta 4');
        legend('off');
        legend('show');
    end 
    
    if (get(handles.cbODE45, 'Value') == 1)
        [~,yODE45] = ODE45(f, a, b, n, y0);
        yODE45 = yODE45.';
        erroODE45 = abs (yODE45 - yExata);
        table_data(:,end+1) = transpose(yODE45);
        table_data(:,end+1) = transpose(erroODE45);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'ODE45';
        table_name{end+1} = 'Erro - ODE45';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yODE45, '-ko', 'DisplayName', 'ODE45');
        legend('off');
        legend('show');
        
    end 
    
    if (get(handles.cbODE113, 'Value') == 1)
        [~,yODE113] = ODE113(f, a, b, n, y0);
        yODE113 = yODE113.';
        erroODE113 = abs (yODE113 - yExata);
        table_data(:,end+1) = transpose(yODE113);
        table_data(:,end+1) = transpose(erroODE113);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'ODE113';
        table_name{end+1} = 'Erro - ODE113';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yODE113, '-k*', 'DisplayName', 'ODE113');
        legend('off');
        legend('show');
        
    end 
    
     if (get(handles.cbAdams, 'Value') == 1)
        yAdams = Adams(f, a, b, n, y0);
        erroAdams = abs (yAdams - yExata);
        table_data(:,end+1) = transpose(yAdams);
        table_data(:,end+1) = transpose(erroAdams);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'Adams';
        table_name{end+1} = 'Erro - Adams';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, t, yAdams, ':r*', 'DisplayName', 'Adams-Bashforth');
        legend('off');
        legend('show');
        
    end 
    
    hold off
    
    if(get(handles.cbGuide, 'Value') == 1)
        grid on;
    else
        grid off;
    end
    
    

% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   
    cla(handles.objGraph);
    set(handles.edtA, 'String', '0');
    set(handles.edtB, 'String', '2');
    set(handles.edtY0, 'String', '1');
    set(handles.edtN, 'String', '10');
    set(handles.sliderH, 'Value', 10);
    set(handles.objTable, 'Data', {});
    
    set(handles.cbEuler, 'Value', 0);
    set(handles.cbEulerM, 'Value', 0);
    set(handles.cbRK2, 'Value', 0);
    set(handles.cbRK3, 'Value', 0);
    set(handles.cbRK4, 'Value', 0);
    set(handles.cbODE45, 'Value', 0);
    set(handles.cbODE113, 'Value', 0);
    set(handles.cbAdams, 'Value', 0);
    
    table_name = {'t', 'Exata'};
    set(handles.objTable, 'ColumnName', table_name);


% --- Executes on button press in hlpEuler.
function hlpEuler_Callback(hObject, eventdata, handles)
% hObject    handle to hlpEuler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                                       M??TODO DE EULER PARA PVI';' ';...
        'yEuler = Euler(f, a, b, n, y0) - M??todo num??rico para a resolu????o de um PVI';...
        "y'= f(t,y) com t=[a, b] e y(a)=y0 - Condi????o inicial"; ' ';...

        '   -> INPUT:';"f       - fun????o do 2.?? membro da Equa????o Diferencial: y' = f(t,y)";...
        "[a, b]  - extremos do intervalo da vari??vel independente t";...
        "n       - n??mero de subintervalos ou itera????es do m??todo";...
        "y0      - condi????o inicial t = a -> y = y0";' ';...

        '   -> OUTPUT: '; "y - vetor das solu????es aproximadas da solu????o exata";...
        "y(i+1) = y(i)+h*f(t(i),y(i)) , i = 0, 1, ..., n-1";' ';...

        'De acordo com Boyce e Diprima os trabalhos iniciais em m??todos';['num??ricos',...
        'se iniciaram com Isaac Newton e Leibniz, mas foi com Lehonard'];['Euler',...
        'no sec. XVIII que os m??todos num??ricos tiveram forma mais concreta,'];['Euler',...
        'deduziu um processo iterativo que permitia determinar, de forma'];['aproximada,',...
        'a solu????o de um problema de condi????o inicial num determinado'];'ponto. ';['?? o tipo',...
        'mais b??sico de m??todo expl??cito para integra????o num??rica '];'para equa????es diferenciais ordin??rias.';' '; ' '},...
        'M??todo de Euler');


% --- Executes on button press in hlpEulerM.
function hlpEulerM_Callback(hObject, eventdata, handles)
% hObject    handle to hlpEulerM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                                METODO DE EULER MELHORADO PARA PVI';' ';...
           'y = MEulerM(f,a,b,n,y0) - M??todo num??rico para a resolu????o de um PVI';...
           "y'= f(t,y) com t=[a, b] e y(a)=y0 - Condi????o inicial";' ';... 

           '-> INPUT:';"f       - fun????o do 2.?? membro da Equa????o Diferencial: y' = f(t,y)";...
           "[a, b]  - extremos do intervalo da vari??vel independente t";...
           "n       - n??mero de subintervalos ou itera????es do m??todo";...
           "y0      - condi????o inicial t = a -> y = y0";' ';...

           '->  OUTPUT:';"y - vetor das solu????es aproximadas da solu????o exata";...
           "y(i+1) = y(i)+h/2 * f(t(i), y(i)) + f(t(i+1), y(i+1), i =0,1,...,n-1";' ';...

           'O M??todo de Euler Melhorado, consiste em uma aproxima????o semelhante';...
           'ao primeiro m??todo utilizado, o M??todo de Euler, onde para fazer a aproxima????o devemos';...
           'realizar todos os passos do m??todo de Euler, desta forma observamos que o';...
           'm??todo de Euler melhorado ?? uma modifica????o do m??todo de Euler.';' '; ' '},...
           'M??todo de Euler Melhorado');

% --- Executes on button press in hlpRK2.
function hlpRK2_Callback(hObject, eventdata, handles)
% hObject    handle to hlpRK2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                    M??TODO DE RUNGE - KUTTA DE ORDEM 2 (RK2)';' ';...
          'y  = RK2(f, a, b, n, y0) - M??todo num??rico para a resolu????o de um PVI';...
          "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"y - vetor das solu????es aproximadas da solu????o exata";...
          "y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2:";...
              "k1     = h * f(t(i), y(i)),";...
              "k2     = h * f(t(i+1), y(i+1)).";' ';...

       'O m??todo de Runge - Kutta de ordem 2 (RK2) ?? um dos m??todos n??mericos';...
       'desenvolvidos pelos matem??ticos alem??es Carl Runge e Martin Kutta, por';...
       'volta de 1900. Os m??todos desenvolvidos pelos dois matem??ticos formam';... 
       'uma vasta fam??lia de m??todos num??ricos diretos de passo simples para a';... 
       'resolu????o de Equa????es Diferenciais Ordin??rias / Problemas de Valor Inicial.';' '; ' '},...
       'M??todo de Runge-Kutta de Ordem 2');


% --- Executes on button press in hlpRK3.
function hlpRK3_Callback(hObject, eventdata, handles)
% hObject    handle to hlpRK3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                    M??TODO DE RUNGE - KUTTA DE ORDEM 3 (RK3)';' ';...
          'y  = RK3(f, a, b, n, y0) - M??todo num??rico para a resolu????o de um PVI';...
          "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"y - vetor das solu????es aproximadas da solu????o exata";...
          "y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2:";...
              "k1     = h * f(t(i), y(i)),";...
              "k2     = h * f(t(i+1), y(i+1)),";...
              "K3     = h * f(t(i)+(h/2), y(i)+(K2/2)).;";' ';...

       'O m??todo de Runge - Kutta de ordem 3 (RK3) ?? um dos m??todos n??mericos';...
       'desenvolvidos pelos matem??ticos alem??es Carl Runge e Martin Kutta, por';...
       'volta de 1900. Os m??todos desenvolvidos pelos dois matem??ticos formam';...
       'uma vasta fam??lia de m??todos num??ricos diretos de passo simples para a';...
       'resolu????o de Equa????es Diferenciais Ordin??rias / Problemas de Valor Inicial.';' '; ' '},...
       'M??todo de Runge-Kutta de Ordem 3');

% --- Executes on button press in hlpRK4.
function hlpRK4_Callback(hObject, eventdata, handles)
% hObject    handle to hlpRK4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                    M??TODO DE RUNGE - KUTTA DE ORDEM 4 (RK4)';' ';...
          'y  = RK4(f, a, b, n, y0) - M??todo num??rico para a resolu????o de um PVI';...
          "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"y - vetor das solu????es aproximadas da solu????o exata";...
          "y(i+1) = y(i) + 1/2 * (k1 * k2), i = 0, 1, ..., n-1, com k1, k2, k3, k4:";...
               "K1 = h * f(t(i), yRK4(i));";...   
               "K2 = h * f(t(i)+(h/2), yRK4(i)+(K1)/2);";...
               "K3 = h * f(t(i)+(h/2),yRK4(i)+(K2/2));";...
               "K4 = h * f(t(i+1), yRK4(i)+K3).";' ';...

       'O m??todo de Runge-Kutta de ordem 4 (RK4) ?? mais um dos muitos m??todos num??ricos';... 
       'iterativos, impl??citos e expl??citos, para a resolu????o num??rica (aproxima????o) de';...
       'solu????es de Equa????es Diferenciais Ordin??rias / Problemas de Valor Inicial.';...
       'O RK4 ?? considerado o m??todo mais preciso da fam??lia Runge - Kutta, sendo que';...
       'quanto maior for o n??mero de subintervalos, maior ser?? a aproxima????o ?? solu????o';...
       'exata.';' '; ' '},...
       'M??todo de Runge-Kutta de Ordem 4');

% --- Executes on button press in hlpODE45.
function hlpODE45_Callback(hObject, eventdata, handles)
% hObject    handle to hlpODE45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                                       ODE 45 do Matlab (ODE45)';' ';...
          'y  = ODE45(f, a, b, n, y0) - Fun????o do Matlab para a resolu????o de um PVI';...
          "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"t      - discretiza????o do dom??nio";...
          "y      - vector das aproxima????es discretas da solu????o exacta";' ';...

       'A ODE45 ?? uma fun????o do Matlab para resolver sistemas de equa????es';...
       "do tipo y' = f(t,y), ou problemas que envolvem matrizes de massa,";...
       "M(t,y)y'=f(t,y). Esta fun????o implementa um m??todo de Runge-Kutta,";...
       'atrav??s de itera????es sucessivas computacionalmente.';' '; ' '},...
       'Fun????o ODE45 do Matlab');

% --- Executes on button press in hlpODE113.
function hlpODE113_Callback(hObject, eventdata, handles)
% hObject    handle to hlpODE113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                                       ODE 113 do Matlab (ODE113)';' ';...
          'y  = ODE45(f, a, b, n, y0) - Fun????o do Matlab para a resolu????o de um PVI';...
          "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"t      - discretiza????o do dom??nio";...
          "y      - vector das aproxima????es discretas da solu????o exacta";' ';...

       'A ODE113 ?? uma fun????o do Matlab para resolver sistemas de equa????es';...
       "do tipo y' = f(t,y), ou problemas que envolvem matrizes de massa,";...
       "M(t,y)y'=f(t,y). Esta fun????o implementa um m??todo de resolu????o";...
       'multipasso, muito mais preciso que qualquer outro m??todo abordado,';...
       'por??m menos utilizado devido ?? sua complexidade de c??lculo.';' '; ' '},...
       'Fun????o ODE113 do Matlab');

% --- Executes on button press in hlpAdams.
function hlpAdams_Callback(hObject, eventdata, handles)
% hObject    handle to hlpAdams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    h = msgbox({'                    M??TODO DE ADAMS-BASHFORTH DE ORDEM 4';' ';...
           'y  = Adams(f, a, b, n, y0) - M??todo num??rico para a resolu????o de um PVI';...
           "y' = f(t,y), com t = [a,b] e y(a) = y0 - Condi????o inicial";' ';...

       '-> INPUT:';"f      - fun????o do 2?? membro da Equa????o Diferencial: y' = f(t,y)";...
          "[a, b] - extremos do intervalo da vari??vel independente t";...
          "n      - n??mero de subintervalos ou intera????es do m??todo";...
          "y0     - condi????o inicial: t = a -> y = y0";' ';...

       '-> OUTPUT:';"yAdams - Vetor das solu????es aproximadas da solu????o exata";...
          "y(n+1) = y(n) + (55 * f(t(n), y(n)) - 59 * f(t(n-1), y(n-1)) + 37 * f(t(n-2), y(n-2)) - 9 * f(t(n-3), y(n-3))) * (h / 24);";' ';...

          'O m??todo de previs??o e corre????o de Adams-Bashforth ?? um m??todo de';... 
          'passo m??ltiplo que combina as f??rmulas de Adams-Bashforth e Adams-Moulton';...
          'de quarto grau. Ambas s??o de passo m??ltiplo, mas a diferen??a ?? que a primeira';...
          '?? uma f??rmula expl??cita e a segunda impl??cita. Os m??todos de passo m??ltiplo';...
          'evitam as m??ltiplas etapas do m??todo de Runge-Kutta, embora haja a necessidade';...
          'de serem iniciados com suas condi????es iniciais.';' '; ' '},...
          'M??todo de Adams-Bashforth de Ordem 4');

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ctrlSave_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ctrlMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    SN=questdlg('Quer mesmo sair?','Sair','Sim','N??o','Sim');
    if strcmp(SN,'N??o')
        return;
    end
    delete(handles.figIntGrafica)
    run menu.m



% --------------------------------------------------------------------
function ctrlSair_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    SN=questdlg('Quer mesmo sair?','Sair','Sim','N??o','Sim');
    if strcmp(SN,'N??o')
        return;
    end
    delete(handles.figIntGrafica)


% --- Executes on button press in cbGuide.
function cbGuide_Callback(hObject, eventdata, handles)
% hObject    handle to cbGuide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbGuide
    if(get(hObject, 'Value') == 1)
        grid on;
    else
        grid off;
    end


% --- Executes when user attempts to close figIntGrafica.
function figIntGrafica_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figIntGrafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
    SN=questdlg('Quer mesmo sair?','Sair','Sim','N??o','Sim');
    if strcmp(SN,'N??o')
        return;
    end
    delete(handles.figIntGrafica)

% --- Executes on button press in cbEuler.
function cbEuler_Callback(hObject, eventdata, handles)
% hObject    handle to cbEuler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbEuler


% --- Executes on button press in cbEulerM.
function cbEulerM_Callback(hObject, eventdata, handles)
% hObject    handle to cbEulerM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbEulerM


% --- Executes on button press in cbRK2.
function cbRK2_Callback(hObject, eventdata, handles)
% hObject    handle to cbRK2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbRK2


% --- Executes on button press in cbRK3.
function cbRK3_Callback(hObject, eventdata, handles)
% hObject    handle to cbRK3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbRK3


% --- Executes on button press in cbRK4.
function cbRK4_Callback(hObject, eventdata, handles)
% hObject    handle to cbRK4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbRK4


% --- Executes on button press in cbODE45.
function cbODE45_Callback(hObject, eventdata, handles)
% hObject    handle to cbODE45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbODE45


% --- Executes on button press in cbODE113.
function cbODE113_Callback(hObject, eventdata, handles)
% hObject    handle to cbODE113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbODE113


% --- Executes on button press in cbAdams.
function cbAdams_Callback(hObject, eventdata, handles)
% hObject    handle to cbAdams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbAdams


% C??digo fornecido pela MatWorks num exemplo 
function edtN_Callback(hObject, eventdata, handles)
% hObject    handle to edtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtN as text
%        str2double(get(hObject,'String')) returns contents of edtN as a double

    val = str2double(get(hObject,'String'));

    if isnumeric(val) && length(val)==1 && ...
            val >= get(handles.sliderH,'Min') && ...
            val <= get(handles.sliderH,'Max')
        set(handles.sliderH,'Value',val);
        set(hObject, 'BackgroundColor', 'white');

    else
        errordlg({'     Introduziu um valor de N inv??lido';...
            'N deve estar compreendido entre 1 e 100'},...
            'ERRO', 'modal');
        set(hObject, 'BackgroundColor', 'red');
        uicontrol(hObject)
    end

% --- Executes during object creation, after setting all properties.
function edtN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btnPrint.
function btnPrint_Callback(hObject, eventdata, handles)
% hObject    handle to btnPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% print(handles.figIntGrafica, 'Interface Grafica', '-dpdf', 'PaperOrientation', 'landscape');
    exportgraphics(handles.objGraph, 'Plot.png');
    a = msgbox("Ficheiro guardado na pasta com o nome 'Plot.png'", 'modal');

% --------------------------------------------------------------------
function ctrlPrint_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    exportgraphics(handles.objGraph, 'Plot.png');
    a = msgbox("Ficheiro guardado na pasta com o nome 'Plot.png'", 'modal');

function objTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ctrlPrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%     exportgraphics(handles.objGraph, 'Plot.png');
%     a = msgbox("Ficheiro guardado na pasta com o nome 'Plot.png'", 'modal');
