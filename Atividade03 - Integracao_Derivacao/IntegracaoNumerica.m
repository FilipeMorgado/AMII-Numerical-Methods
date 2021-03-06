%%                          IntegracaoNumerica Integração Numérica
%
%                           Máquina para calcular soluções aproximadas de numericamente
%
%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%%

function varargout = IntegracaoNumerica(varargin)
% INTEGRACAONUMERICA MATLAB code for IntegracaoNumerica.fig
%      INTEGRACAONUMERICA, by itself, creates a new INTEGRACAONUMERICA or raises the existing
%      singleton*.
%
%      H = INTEGRACAONUMERICA returns the handle to a new INTEGRACAONUMERICA or the handle to
%      the existing singleton*.
%
%      INTEGRACAONUMERICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRACAONUMERICA.M with the given input arguments.
%
%      INTEGRACAONUMERICA('Property','Value',...) creates a new INTEGRACAONUMERICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IntegracaoNumerica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IntegracaoNumerica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IntegracaoNumerica

% Last Modified by GUIDE v2.5 08-Jun-2019 13:50:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @IntegracaoNumerica_OpeningFcn, ...
    'gui_OutputFcn',  @IntegracaoNumerica_OutputFcn, ...
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


% --- Executes just before IntegracaoNumerica is made visible.
function IntegracaoNumerica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IntegracaoNumerica (see VARARGIN)

% Choose default command line output for IntegracaoNumerica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IntegracaoNumerica wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IntegracaoNumerica_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PbActualizar.
function PbActualizar_Callback(hObject, eventdata, handles)
% hObject    handle to PbActualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x;

strF=get(handles.eFuncao,'String');
f=@(x) eval(vectorize(strF));
try
    syms x;
    fTest = f(x);
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

n = str2num(get(handles.eN, 'String'));
if (isscalar(n) && isreal(n))
    set(handles.eN, 'BackgroundColor', 'white');
else
    set(handles.eN, 'BackgroundColor', 'red');
    errordlg('Introduza um número real h',...
        'ERRO', 'modal');
end

h=(b-a)/n;
x=a:h:b;
y=f(x);
sExata = double(int(f(sym('x')),a,b));
plot(x, y);
legend('f(x)');

table_data = sExata;
set(handles.objTable, 'Data', table_data, 'ColumnName', {'Exata'});
table_data = get(handles.objTable, 'Data');
hold on

if get(handles.cbTrapezios, 'Value') == 1
    T = NTrapezios(f,a,b,n);
    erroT = abs(T - sExata);
    table_data(:,end+1) = T;
    table_data(:,end+1) = erroT;
    table_name = get(handles.objTable, 'ColumnName');
    table_name{end+1} = 'Trapezios';
    table_name{end+1} = 'Erro - Trapezios';
    set(handles.objTable, 'Data', table_data);
    set(handles.objTable, 'ColumnName', table_name);
end

if (get(handles.cbSimpson, 'Value') == 1)
    S = NSimpson(f, a, b, n);
    erroS = abs(S - sExata);
    table_data(:,end+1) = S;
    table_data(:,end+1) = erroS;
    table_name = get(handles.objTable, 'ColumnName');
    table_name{end+1} = 'Simpson';
    table_name{end+1} = 'Erro - Simpson';
    set(handles.objTable, 'Data', table_data);
    set(handles.objTable, 'ColumnName', table_name);
end

hold off

if(get(handles.cbPreencher, 'Value') == 1)
    A = area(x,y);
    A.FaceColor = '(1 ,.6,.7)';
    legend('f(x)');
end

if(get(handles.cbGrelha, 'Value') == 1)
    grid on;
else
    grid off;
end


% --- Executes during object creation, after setting all properties.
function PbActualizar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eFuncao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in rbTrapezios.
function cbTrapezios_Callback(hObject, eventdata, handles)
% hObject    handle to rbTrapezios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbTrapezios


% --- Executes on button press in rbSimpson.
function cbSimpson_Callback(hObject, eventdata, handles)
% hObject    handle to rbSimpson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbSimpson


function eFuncao_Callback(hObject, eventdata, handles)
% hObject    handle to eFuncao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eFuncao as text
%        str2double(get(hObject,'String')) returns contents of eFuncao as a double
strF=get(handles.eFuncao,'String');
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


% --- Executes during object creation, after setting all properties.
function eFuncao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eFuncao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double
a = str2num(get(handles.eA, 'string'));
if (isscalar(a) && isreal(a) && a < str2num(get(handles.eB, 'String')))
    set(handles.eA, 'BackgroundColor', 'white');
else
    set(handles.eA, 'BackgroundColor', 'red');
    errordlg('Introduza um número real a, com a < b',...
        'ERRO', 'modal');
end


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



function eB_Callback(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eB as text
%        str2double(get(hObject,'String')) returns contents of eB as a double
b = str2num(get(handles.eB, 'String'));
if (isscalar(b) && isreal(b) && b > str2num(get(handles.eA, 'String')))
    set(handles.eB, 'BackgroundColor', 'white');
else
    set(handles.eB, 'BackgroundColor', 'red');
    errordlg('Introduza um número real b, com b > a',...
        'ERRO', 'modal');
end


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



function eN_Callback(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eN as text
%        str2double(get(hObject,'String')) returns contents of eN as a double
n = str2num(get(handles.eN, 'String'));
if (isscalar(n) && isreal(n))
    set(handles.eN, 'BackgroundColor', 'white');
else
    set(handles.eN, 'BackgroundColor', 'red');
    errordlg('Introduza um número real h',...
        'ERRO', 'modal');
end


% --- Executes during object creation, after setting all properties.
function eN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cbGrelha.
function cbGrelha_Callback(hObject, eventdata, handles)
% hObject    handle to cbGrelha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbGrelha
if(get(hObject, 'Value') == 1)
    grid on;
else
    grid off;
end

% --- Executes on button press in cbPreencher.
function cbPreencher_Callback(hObject, eventdata, handles)
% hObject    handle to cbPreencher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbPreencher


% --- Executes when user attempts to close figureIntegracaoNumerica.
function figureIntegracaoNumerica_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figureIntegracaoNumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);
set(hObject,'Visible','Off');
