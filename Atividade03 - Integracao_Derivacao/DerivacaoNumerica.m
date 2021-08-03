%%                          DerivacaoNumerica Derivação Numérica
%
%                           Máquina para calcular soluções aproximadas de derivadas
%
%   Autor:          Arménio Correia     .: armenioc@isec.pt
%
%   Modificado por: Vasco Pereira       .: a2019134744@isec.pt
%                   Filipe Morgado      .: a2019137625@isec.pt
%                   Rui Ferreira        .: a2018013504@isec.pt         
%                   Mª Fátima Rodrigues .: a2019112924@isec.pt 
%%

function varargout = DerivacaoNumerica(varargin)
% DERIVACAONUMERICA M-file for DerivacaoNumerica.fig
%      DERIVACAONUMERICA, by itself, creates a new DERIVACAONUMERICA or raises the existing
%      singleton*.
%
%      H = DERIVACAONUMERICA returns the handle to a new DERIVACAONUMERICA or the handle to
%      the existing singleton*.
%
%      DERIVACAONUMERICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DERIVACAONUMERICA.M with the given input arguments.
%
%      DERIVACAONUMERICA('Property','Value',...) creates a new DERIVACAONUMERICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DerivacaoNumerica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DerivacaoNumerica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DerivacaoNumerica

% Last Modified by GUIDE v2.5 11-Jan-2016 22:40:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DerivacaoNumerica_OpeningFcn, ...
                   'gui_OutputFcn',  @DerivacaoNumerica_OutputFcn, ...
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


% --- Executes just before DerivacaoNumerica is made visible.
function DerivacaoNumerica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DerivacaoNumerica (see VARARGIN)

% Choose default command line output for DerivacaoNumerica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DerivacaoNumerica wait for user response (see UIRESUME)
% uiwait(handles.figureDerivacaoNumerica);



% --- Outputs from this function are returned to the command line.
function varargout = DerivacaoNumerica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAtualiza.
function pbAtualiza_Callback(hObject, eventdata, handles)
% hObject    handle to pbAtualiza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms x;
    strF=get(handles. eFuncao,'String');
    f=@(x,y) eval(vectorize(char(strF)));
    try
        syms x y;
        fTest = f(x,y);
        set(handles.eFuncao, 'BackgroundColor', 'white');
    catch me
        set(handles.eFuncao, 'BackgroundColor', 'red');
        errordlg('ERRO! Introduza uma função em x e y', ...
                 'ERRO', 'modal');
    end
    
    a = str2num(get(handles.eA, 'string'));
    if (isscalar(a) && isreal(a) && a < str2num(get(handles.eB, 'String')))
        set(handles.eA, 'BackgroundColor', 'white');
    else
        set(handles.eA, 'BackgroundColor', 'red');
        errordlg('Introduza um número real a, com a < b',...
                 'ERRO', 'modal');
    end
    
    b = str2num(get(handles.eB, 'String'));
    if (isscalar(b) && isreal(b) && b > str2num(get(handles.eA, 'String')))
        set(handles.eB, 'BackgroundColor', 'white');
    else
        set(handles.eB, 'BackgroundColor', 'red');
        errordlg('Introduza um número real b, com b > a',...
                 'ERRO', 'modal');
    end
    
    h = str2num(get(handles.eH, 'String'));
    if (isscalar(h) && isreal(h))
        set(handles.eH, 'BackgroundColor', 'white');
    else
        set(handles.eH, 'BackgroundColor', 'red');
        errordlg('Introduza um número real h',...
                 'ERRO', 'modal');
    end

    df=diff(f(x));
    g=@(x) eval(vectorize(char(df)));
    x = a:h:b;
    dydxExata=g(x);

    table_data = [transpose(x), transpose(dydxExata)];
    set(handles.objTable, 'Data', table_data, 'ColumnName', {'X', 'Exata'});
    table_data = get(handles.objTable, 'Data');
    plot(handles.objGraph, x, dydxExata);
    plot(x, dydxExata, '-r*');
    legend('Exata');
    hold on
    
    if (get(handles.rbDFP3, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFP3(f,a,b,h);
        erroDFP3 = abs(dydxExata - dydx);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFP3);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFP3';
        table_name{end+1} = 'Erro - DFP3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-bo', 'DisplayName', 'DFP3');
        legend('show');
    end
    
    if (get(handles.rbDFR3, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFR3(f,a,b,h);
        erroDFR3 = abs(dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFR3);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFR3';
        table_name{end+1} = 'Erro - DFR3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-go', 'DisplayName', 'DFR3');
        legend('show');
    end 
        
    if (get(handles.rbDFC3, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFC(f,a,b,h);
        erroDFC = abs(dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFC);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFC3';
        table_name{end+1} = 'Erro - DFC3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-co', 'DisplayName', 'DFC3');
        legend('show');
    end 
    
    if (get(handles.rbDFP, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFP(f,a,b,h);
        erroDFP = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFP);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFP';
        table_name{end+1} = 'Erro - DFP';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-yo', 'DisplayName', 'DFP');
        legend('show');
    end 
    
    if (get(handles.rbDFR, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFR(f,a,b,h);
        erroDFR = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFR);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFR';
        table_name{end+1} = 'Erro - DFR';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-mo', 'DisplayName', 'DFR');
        legend('show');
    end 
    
    if (get(handles.rb2D, 'Value') == 1)
        [x,y,dydx]=NDerivacao2D(f,a,b,h);
        erro2D = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erro2D);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = '2 Derivada';
        table_name{end+1} = 'Erro - 2 Derivada';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-ko', 'DisplayName', '2 Derivada');
        legend('show');
        
    end 
    
    if (get(handles.rbTodas, 'Value') == 1)
        [x,y,dydx]=NDerivacaoDFP3(f,a,b,h);
        erroDFP3 = abs(dydxExata - dydx);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFP3);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFP3';
        table_name{end+1} = 'Erro - DFP3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-bo', 'DisplayName', 'DFP3');
        
        [x,y,dydx]=NDerivacaoDFR3(f,a,b,h);
        erroDFR3 = abs(dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFR3);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFR3';
        table_name{end+1} = 'Erro - DFR3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-go', 'DisplayName', 'DFR3');
        
        [x,y,dydx]=NDerivacaoDFC(f,a,b,h);
        erroDFC = abs(dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFC);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFC3';
        table_name{end+1} = 'Erro - DFC3';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-co', 'DisplayName', 'DFC3');
        
        [x,y,dydx]=NDerivacaoDFP(f,a,b,h);
        erroDFP = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFP);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFP';
        table_name{end+1} = 'Erro - DFP';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-yo', 'DisplayName', 'DFP');
        
        [x,y,dydx]=NDerivacaoDFR(f,a,b,h);
        erroDFR = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erroDFR);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = 'DFR';
        table_name{end+1} = 'Erro - DFR';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-mo', 'DisplayName', 'DFR');
        
        [x,y,dydx]=NDerivacao2D(f,a,b,h);
        erro2D = abs (dydx - dydxExata);
        table_data(:,end+1) = transpose(dydx);
        table_data(:,end+1) = transpose(erro2D);
        table_name = get(handles.objTable, 'ColumnName');
        table_name{end+1} = '2 Derivada';
        table_name{end+1} = 'Erro - 2 Derivada';
        set(handles.objTable, 'Data', table_data);
        set(handles.objTable, 'ColumnName', table_name);
        plot(handles.objGraph, x, dydx, '-ko', 'DisplayName', '2a Derivada');
        legend('show');
        
    end
        
hold off


function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double


% --- Executes during object creation, after setting all properties.
function eA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eH_Callback(hObject, eventdata, handles)
% hObject    handle to eH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eH as text
%        str2double(get(hObject,'String')) returns contents of eH as a double


% --- Executes during object creation, after setting all properties.
function eH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eB_Callback(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eB as text
%        str2double(get(hObject,'String')) returns contents of eB as a double


% --- Executes during object creation, after setting all properties.
function eB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figureDerivacaoNumerica.
function figureDerivacaoNumerica_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figureDerivacaoNumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);
set(hObject,'Visible','Off');
