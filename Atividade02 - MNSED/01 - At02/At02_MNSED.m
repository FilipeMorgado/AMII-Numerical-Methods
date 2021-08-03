%   Autores: Vasco Pereira       .: a2019134744@isec.pt
%            Filipe Morgado      .: a2019137625@isec.pt
%            Rui Ferreira        .: a2018013504@isec.pt
%            Mª Fátima Rodrigues .: a2019112924@isec.pt
%
%   Data: 27 de Abril de 2020
%
%%

function varargout = At02_MNSED(varargin)
% AT02_MNSED MATLAB code for At02_MNSED.fig
%      AT02_MNSED, by itself, creates a new AT02_MNSED or raises the existing
%      singleton*.
%
%      H = AT02_MNSED returns the handle to a new AT02_MNSED or the handle to
%      the existing singleton*.
%
%      AT02_MNSED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AT02_MNSED.M with the given input arguments.
%
%      AT02_MNSED('Property','Value',...) creates a new AT02_MNSED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before At02_MNSED_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to At02_MNSED_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help At02_MNSED

% Last Modified by GUIDE v2.5 06-May-2020 23:50:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @At02_MNSED_OpeningFcn, ...
    'gui_OutputFcn',  @At02_MNSED_OutputFcn, ...
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


% --- Executes just before At02_MNSED is made visible.
function At02_MNSED_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to At02_MNSED (see VARARGIN)

% Choose default command line output for At02_MNSED
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.cbEuler, 'Value', 1);
if get(handles.menuSelect, 'Value') == 1
    set(handles.cbEuler, 'Enable', 'Inactive');
end
% UIWAIT makes At02_MNSED wait for user response (see UIRESUME)
% uiwait(handles.UiControl);


% --- Outputs from this function are returned to the command line.
function varargout = At02_MNSED_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menuSelect.
function menuSelect_Callback(hObject, eventdata, handles)
% hObject    handle to menuSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuSelect
% Problema do Pendulo
if get(hObject, 'Value') == 1
    set(handles.StrF, 'String', 'v');
    set(handles.StrG, 'String', '-sin(u)-0.3*v');
    set(handles.edtA, 'String', '0');
    set(handles.edtB, 'String', '15');
    set(handles.sliderH, 'Value', 100);
    set(handles.edtN, 'String', '100');
    set(handles.edtU, 'String', 'pi/2');
    set(handles.edtV, 'String', '0');
    set(handles.cbEuler, 'Value', 1);
    set(handles.cbEulerM, 'Value', 0);
    set(handles.cbRK2, 'Value', 0);
    set(handles.cbRK3, 'Value', 0);
    set(handles.cbRK4, 'Value', 0);
    set(handles.cbEuler, 'Enable', 'Inactive');
end

% Sistema mola-massa s/ amortecimento
if get(hObject, 'Value') == 2
    set(handles.StrF, 'String', 'v');
    set(handles.StrG, 'String', '-16*u');
    set(handles.edtA, 'String', '0');
    set(handles.edtB, 'String', '2*pi');
    set(handles.sliderH, 'Value', 100);
    set(handles.edtN, 'String', '100');
    set(handles.edtU, 'String', '9');
    set(handles.edtV, 'String', '0');
    set(handles.cbEuler, 'Value', 0);
    set(handles.cbEulerM, 'Value', 0);
    set(handles.cbRK2, 'Value', 0);
    set(handles.cbRK3, 'Value', 0);
    set(handles.cbRK4, 'Value', 0);
    set(handles.cbEuler, 'Enable', 'on');
end

% Sistema mola-massa c/ amortecimento
if get(hObject, 'Value') == 3
    set(handles.StrF, 'String', 'v');
    set(handles.StrG, 'String', '-10*v-25*u');
    set(handles.edtA, 'String', '0');
    set(handles.edtB, 'String', '2*pi');
    set(handles.sliderH, 'Value', 100);
    set(handles.edtN, 'String', '100');
    set(handles.edtU, 'String', '0');
    set(handles.edtV, 'String', '-4');
    set(handles.cbEuler, 'Value', 0);
    set(handles.cbEulerM, 'Value', 0);
    set(handles.cbRK2, 'Value', 0);
    set(handles.cbRK3, 'Value', 0);
    set(handles.cbRK4, 'Value', 0);
    set(handles.cbEuler, 'Enable', 'on');
end

% Vibracao Forcada nao Amortecida
if get(hObject, 'Value') == 4
    set(handles.StrF, 'String', 'v');
    set(handles.StrG, 'String', '2.77778*sin(0.9*t)*sin(0.1*t)');
    set(handles.edtA, 'String', '0');
    set(handles.edtB, 'String', '80');
    set(handles.sliderH, 'Value', 800);
    set(handles.edtN, 'String', '800');
    set(handles.edtU, 'String', '0');
    set(handles.edtV, 'String', '0');
    set(handles.cbEuler, 'Value', 0);
    set(handles.cbEulerM, 'Value', 0);
    set(handles.cbRK2, 'Value', 0);
    set(handles.cbRK3, 'Value', 0);
    set(handles.cbRK4, 'Value', 0);
    set(handles.cbEuler, 'Enable', 'on');
end


% --- Executes during object creation, after setting all properties.
function menuSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StrG_Callback(hObject, eventdata, handles)
% hObject    handle to StrG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StrG as text
%        str2double(get(hObject,'String')) returns contents of StrG as a double
strG = get(hObject, 'String');
g = @(t,u,v) eval(vectorize(strG));
try
    syms t u v;
    fTest = g(t,u,v);
    set(hObject, 'BackgroundColor', 'white');
catch me
    set(hObject, 'BackgroundColor', 'red');
    errordlg('ERRO! Introduza uma função em t, u e v', ...
        'ERRO', 'modal');
end

handles.funcao = g;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function StrG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StrG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StrF_Callback(hObject, eventdata, handles)
% hObject    handle to StrF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StrF as text
%        str2double(get(hObject,'String')) returns contents of StrF as a double
strF = get(hObject, 'String');
f = @(t,u,v) eval(vectorize(strF));
try
    syms t u v;
    fTest = f(t,u,v);
    set(hObject, 'BackgroundColor', 'white');
catch me
    set(hObject, 'BackgroundColor', 'red');
    errordlg('ERRO! Introduza uma função em t, u e v', ...
        'ERRO', 'modal');
end

handles.funcao = f;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function StrF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StrF (see GCBO)
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
    errordlg('Introduza um número real a, com a < b',...
        'ERRO', 'modal');
end

handles.a = a;
guidata(hObject, handles);

set(handles.txtU, 'String', ['u (', num2str(a),') = ']);
set(handles.txtV, 'String', ['v (', num2str(a),') = ']);


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
    errordlg('Introduza um número real b, com b > a',...
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
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
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
    errordlg({'     Introduziu um valor de N inválido';...
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



function edtU_Callback(hObject, eventdata, handles)
% hObject    handle to edtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtU as text
%        str2double(get(hObject,'String')) returns contents of edtU as a double
u0 = str2num(get(hObject,'string'));
a = get(handles.edtA,'string');
if (isscalar(u0) && isreal(u0))
    set(hObject, 'BackgroundColor', 'white');
else
    set(hObject, 'BackgroundColor', 'red');
    errordlg(['Introduza o valor de u(', a,')'],...
        'ERRO', 'modal');
end

handles.u0 = u0;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edtU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtV_Callback(hObject, eventdata, handles)
% hObject    handle to edtV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtV as text
%        str2double(get(hObject,'String')) returns contents of edtV as a double
v0 = str2num(get(hObject,'string'));
a = get(handles.edtA,'string');
if (isscalar(v0) && isreal(v0))
    set(hObject, 'BackgroundColor', 'white');
else
    set(hObject, 'BackgroundColor', 'red');
    errordlg(['Introduza o valor de v(', a,')'],...
        'ERRO', 'modal');
end

handles.v0 = v0;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edtV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in helpEuler.
function helpEuler_Callback(hObject, eventdata, handles)
% hObject    handle to helpEuler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox({'                                  MÉTODO DE EULER PARA SED';' ';...
    '[t, uEuler, vEuler] = Euler(f, g, a, b, n, u0, y0) - Método numérico para a resolução de um PVI';...
    "u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  "; ' ';...
    
    '   -> INPUT:';"f, g - funções do 2.º membro das Equações Diferenciais";...
    '[a, b] - extremos do intervalo da variável independente t';...
    'n - número de subintervalos ou iterações do método';...
    'u0, v0 - condições iniciais t=a -> u=u0 e v=v0';' ';...
    
    '   -> OUTPUT: '; '[t,u,v] - vector das soluções aproximações e da discretização de t';...
    'u(i+1) = u(i)+h*f(t(i),u(i),v(i))';...
    'v(i+1) = v(i)+h*g(t(i),u(i),v(i)) , i =0,1,...,n-1';' ';...
    
    'De acordo com Boyce e Diprima os trabalhos iniciais em métodos';['numéricos ',...
    'se iniciaram com Isaac Newton e Leibniz, mas foi com Lehonard'];['Euler ',...
    'no sec. XVIII que os métodos numéricos tiveram forma mais concreta,'];['Euler ',...
    'deduziu um processo iterativo que permitia determinar, de forma'];['aproximada, ',...
    'a solução de um problema de condição inicial num determinado'];'ponto. ';['É o tipo ',...
    'mais básico de método explícito para integração numérica '];'para equações diferenciais ordinárias.';' '; ' '},...
    'Método de Euler');


% --- Executes on button press in helpEulerM.
function helpEulerM_Callback(hObject, eventdata, handles)
% hObject    handle to helpEulerM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox({'                          METODO DE EULER MELHORADO PARA SED';' ';...
    '[t, uEulerM, vEulerM] = EulerM(f, g, a, b, n, u0, y0) - Método numérico para a resolução de um PVI';...
    "u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  "; ' ';...
    
    '   -> INPUT:';"f, g - funções do 2.º membro das Equações Diferenciais";...
    '[a, b] - extremos do intervalo da variável independente t';...
    'n - número de subintervalos ou iterações do método';...
    'u0, v0 - condições iniciais t=a -> u=u0 e v=v0';' ';...
    
    '   -> OUTPUT: '; '[t,u,v] - vector das soluções aproximações e da discretização de t';...
    'u(i+1) = u(i)+h*f(t(i),u(i),v(i))';...
    'v(i+1) = v(i)+h*g(t(i),u(i),v(i)) , i =0,1,...,n-1';' ';...
    
    'O Método de Euler Melhorado, consiste em uma aproximação semelhante';...
    'ao primeiro método utilizado, o Método de Euler, onde para fazer a ';
    'aproximação devemos realizar todos os passos do método de Euler, ';
    'desta forma observamos que o método de Euler melhorado é uma ';
    'modificação do método de Euler.';' '; ' '},...
    'Método de Euler Melhorado');


% --- Executes on button press in helpRK2.
function helpRK2_Callback(hObject, eventdata, handles)
% hObject    handle to helpRK2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox({'                    MÉTODO DE RUNGE - KUTTA DE ORDEM 2 (RK2) para SED';' ';...
    '[t,uRK2,vRK2] = NRK2SED(f,g,a,b,n,u0,v0)';...
    "u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0";' ';...
    
    '-> INPUT:';"f, g - funções do 2.º membro das Equações Diferenciais";...
    "[a, b] - extremos do intervalo da variável independente t";...
    "n      - número de subintervalos ou interações do método";...
    "u0, v0 - condições iniciais t=a -> u=u0 e v=v0";' ';...
    
    '-> OUTPUT:';"[t,u,v] - vector das soluções aproximações e da discretização de t";...
    "k1_u        = h * f(t(i),u(i),v(i));";...
    "k1_v        = h * g(t(i),u(i),v(i));";...
    "k2_u        = h * f(t(i+1),   u(i)+k1_u,   v(i)+k1_v);";...
    "k2_v        = h * g(t(i+1),   u(i)+k1_u,   v(i)+k1_v);";...
    "u(i+1)=u(i)+(k1_u+k2_u)/2;";...
    "v(i+1)=v(i)+(k1_v+k2_v)/2;";' ';...

    'O método de Runge - Kutta de ordem 2 (RK2) é um dos métodos númericos';...
    'desenvolvidos pelos matemáticos alemães Carl Runge e Martin Kutta, por';...
    'volta de 1900. Os métodos desenvolvidos pelos dois matemáticos formam';...
    'uma vasta família de métodos numéricos diretos de passo simples para a';...
    'resolução de Equações Diferenciais Ordinárias / Problemas de Valor Inicial.';' '; ' '},...
    'Método de Runge-Kutta de Ordem 2');

% --- Executes on button press in helpRK4.
function helpRK4_Callback(hObject, eventdata, handles)
% hObject    handle to helpRK4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox({'                    MÉTODO DE RUNGE - KUTTA DE ORDEM 4 (RK4) para SED';' ';...
    '[t,uRK4,vRK4] = NRK4SED(f,g,a,b,n,u0,v0)';...
    "u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0";' ';...
    
    '-> INPUT:';"f, g - funções do 2.º membro das Equações Diferenciais";...
    "[a, b] - extremos do intervalo da variável independente t";...
    "n      - número de subintervalos ou interações do método";...
    "u0, v0 - condições iniciais t=a -> u=u0 e v=v0";' ';...
    
    '-> OUTPUT:';"[t,u,v] - vector das soluções aproximações e da discretização de t";...
    "k1_u        = h * f(t(i),u(i),v(i));";...
    "k1_v        = h * g(t(i),u(i),v(i));";...
    "k2_u        = h * f(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));";...
    "k2_v        = h * g(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));";...
    "k3_u        = h * f(  t(i)+h/2,  u(i)+k2_u*(1/2),  v(i)+k2_v*(1/2));";...
    "k3_v        = h * g(  t(i)+h/2,  u(i)+k2_u*(1/2),  v(i)+k2_v*(1/2))";...
    "k4_u        = h * f(  t(i)+h/2,  u(i)+k3_u*(1/2),  v(i)+k3_v*(1/2));";...
    "k4_v        = h * g(  t(i)+h/2,  u(i)+k3_u*(1/2),  v(i)+k3_v*(1/2));";...
    "u(i+1)=u(i)+(k1_u+2*k2_u+2*k3_u+k4_u)/6";...
    "v(i+1)=v(i)+(k1_v+2*k2_v+2*k3_v+k4_v)/6;";' ';...

    'O método de Runge-Kutta de ordem 4 (RK4) é mais um dos muitos métodos ';...
    'numéricos iterativos, implícitos e explícitos, para a resolução numérica ';...
    '(aproximação) de soluções de Equações Diferenciais Ordinárias / Problemas de Valor Inicial. ';...
    'O RK4 é considerado o método mais preciso da família Runge - Kutta, sendo ';...
    'que quanto maior for o número de subintervalos, maior será a aproximação à solução exata.';...
    ' '; ' '},...
    'Método de Runge-Kutta de Ordem 4');

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


% --- Executes on button press in cbRK4.
function cbRK4_Callback(hObject, eventdata, handles)
% hObject    handle to cbRK4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbRK4


% --- Executes on button press in pbAtualuzar.
function pbAtualuzar_Callback(hObject, eventdata, handles)
% hObject    handle to pbAtualuzar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

strG = get(handles.StrG, 'String');
g = @(t,u,v) eval(vectorize(strG));
try
    syms t u v;
    fTest = g(t,u,v);
    set(handles.StrG, 'BackgroundColor', 'white');
catch me
    set(handles.StrG, 'BackgroundColor', 'red');
    errordlg('ERRO! Introduza uma função em t, u e v', ...
        'ERRO', 'modal');
end

strF = get(handles.StrF, 'String');
f = @(t,u,v) eval(vectorize(strF));
try
    syms t u v;
    fTest = f(t,u,v);
    set(handles.StrF, 'BackgroundColor', 'white');
catch me
    set(handles.StrF, 'BackgroundColor', 'red');
    errordlg('ERRO! Introduza uma função em t, u e v', ...
        'ERRO', 'modal');
end

a = str2num(get(handles.edtA, 'string'));
if (isscalar(a) && isreal(a) && a < str2num(get(handles.edtB, 'String')))
    set(handles.edtA, 'BackgroundColor', 'white');
else
    set(handles.edtA, 'BackgroundColor', 'red');
    errordlg('Introduza um número real a, com a < b',...
        'ERRO', 'modal');
end

b = str2num(get(handles.edtB, 'String'));
if (isscalar(b) && isreal(b) && b > str2num(get(handles.edtA, 'String')))
    set(handles.edtB, 'BackgroundColor', 'white');
else
    set(handles.edtB, 'BackgroundColor', 'red');
    errordlg('Introduza um número real b, com b > a',...
        'ERRO', 'modal');
end

u0 = str2num(get(handles.edtU,'string'));
a = get(handles.edtA,'string');
if (isscalar(u0) && isreal(u0))
    set(handles.edtU, 'BackgroundColor', 'white');
else
    set(handles.edtU, 'BackgroundColor', 'red');
    errordlg(['Introduza o valor de u(', a,')'],...
        'ERRO', 'modal');
end

v0 = str2num(get(handles.edtV,'string'));
a = get(handles.edtA,'string');
if (isscalar(v0) && isreal(v0))
    set(handles.edtV, 'BackgroundColor', 'white');
else
    set(handles.edtV, 'BackgroundColor', 'red');
    errordlg(['Introduza o valor de v(', a,')'],...
        'ERRO', 'modal');
end

n = get(handles.sliderH, 'Value');
a = str2num(a);
h = (b-a)/n;
t = a:h:b;

selecao = get(handles.menuSelect, 'Value');
if selecao ~= 1
    
    % Calculo da solucao particular
    [sExata,~] = dsolve(['Du=', strF],['Dv=', strG],['u(', num2str(a), ')=' num2str(u0)'],...
        ['v(', num2str(a), ')=', num2str(v0)]);
    fExata=@(t,u,v) eval(vectorize(char(sExata)));
    uExata=fExata(t);
    
    table_data = [transpose(t), transpose(uExata)];
    set(handles.table, 'Data', table_data, 'ColumnName', {'t', 'Exata'});
    plot(handles.axes1, t, uExata, 'r');
    legend('Exata');
    hold on;
end

% Problema do Pendulo
if selecao == 1
    set(handles.cbEuler, 'Enable', 'Inactive');
    % EULER
    [~,uEuler,~] = NEulerSED(f, g, a, b, n, u0,v0);
    table_data = [transpose(t), transpose(uEuler)];
    set(handles.table, 'Data', table_data, 'ColumnName', {'t', 'Euler'});
    plot(handles.axes1, t, uEuler, 'b', 'DisplayName', 'Euler');
    legend('Euler');
    hold on
    
    % EULER MELHORADO
    if get(handles.cbEulerM, 'Value') == 1
        [~,uEulerM,~]= NEulerMSED(f, g, a, b, n, u0,v0);
        table_data(:,end+1) = transpose(uEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler Melhorado';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEulerM, 'g', 'DisplayName', 'Euler Melhorado');
        legend('off');
        legend('show');
    end
    
    % RK2
    if get(handles.cbRK2, 'Value') == 1
        [~,uRK2,~]   =   NRK2SED(f, g, a, b, n, u0,v0);
        table_data(:,end+1) = transpose(uRK2);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK2';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK2, 'm', 'DisplayName', 'RK2');
        legend('off');
        legend('show');
    end
    
    % RK3
    if get(handles.cbRK3, 'Value') == 1
        [~,uRK3,~]   =   NRK3SED(f, g, a, b, n, u0,v0);
        table_data(:,end+1) = transpose(uRK3);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK3';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK3, 'c', 'DisplayName', 'RK3');
        legend('off');
        legend('show');
    end
    
    % RK4
    if get(handles.cbRK4, 'Value') == 1
        [~,uRK4,~]   =   NRK4SED(f, g, a, b, n, u0,v0);
        table_data(:,end+1) = transpose(uRK4);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK4';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK4, 'k', 'DisplayName', 'RK4');
        legend('off');
        legend('show');
    end
end

% Sistema mola-massa s/ amortecimento
if selecao == 2
    set(handles.cbEuler, 'Enable', 'on');
    % EULER
    if get(handles.cbEuler, 'Value') == 1
        [~,uEuler,~] = NEulerSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEuler);
        table_data(:,end+1) = transpose(uEuler);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler';
        table_name{end+1} = 'Erro - Euler';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEuler, 'b', 'DisplayName', 'Euler');
        legend('off');
        legend('show');
    end
    
    % EULER MELHORADO
    if get(handles.cbEulerM, 'Value') == 1
        [~,uEulerM,~]= NEulerMSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEulerM);
        table_data(:,end+1) = transpose(uEulerM);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler Melhorado';
        table_name{end+1} = 'Erro - Euler Melhorado';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEulerM, 'g', 'DisplayName', 'Euler Melhorado');
        legend('off');
        legend('show');
    end
    
    % RK2
    if get(handles.cbRK2, 'Value') == 1
        [~,uRK2,~]   =   NRK2SED(f, g, a, b, n, u0,v0);
        erroRK2 = abs(uExata-uRK2);
        table_data(:,end+1) = transpose(uRK2);
        table_data(:,end+1) = transpose(erroRK2);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK2';
        table_name{end+1} = 'Erro - RK2';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK2, 'm', 'DisplayName', 'RK2');
        legend('off');
        legend('show');
    end
    
    % RK3
    if get(handles.cbRK3, 'Value') == 1
        [~,uRK3,~]   =   NRK3SED(f, g, a, b, n, u0,v0);
        erroRK3 = abs(uExata-uRK3);
        table_data(:,end+1) = transpose(uRK3);
        table_data(:,end+1) = transpose(erroRK3);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK3';
        table_name{end+1} = 'Erro - RK3';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK3, 'c', 'DisplayName', 'RK3');
        legend('off');
        legend('show');
    end
    
    % RK4
    if get(handles.cbRK4, 'Value') == 1
        [~,uRK4,~]   =   NRK4SED(f, g, a, b, n, u0,v0);
        erroRK4 = abs(uExata-uRK4);
        table_data(:,end+1) = transpose(uRK4);
        table_data(:,end+1) = transpose(erroRK4);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK4';
        table_name{end+1} = 'Erro - RK4';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK4, 'k', 'DisplayName', 'RK4');
        legend('off');
        legend('show');
    end
end

% Sistema mola-massa c/ amortecimento
if selecao == 3
    set(handles.cbEuler, 'Enable', 'on');
    % EULER
    if get(handles.cbEuler, 'Value') == 1
        [~,uEuler,~] = NEulerSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEuler);
        table_data(:,end+1) = transpose(uEuler);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler';
        table_name{end+1} = 'Erro - Euler';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEuler, 'b', 'DisplayName', 'Euler');
        legend('off');
        legend('show');
    end
    
    % EULER MELHORADO
    if get(handles.cbEulerM, 'Value') == 1
        [~,uEulerM,~]= NEulerMSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEulerM);
        table_data(:,end+1) = transpose(uEulerM);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler Melhorado';
        table_name{end+1} = 'Erro - Euler Melhorado';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEulerM, 'g', 'DisplayName', 'Euler Melhorado');
        legend('off');
        legend('show');
    end
    
    % RK2
    if get(handles.cbRK2, 'Value') == 1
        [~,uRK2,~]   =   NRK2SED(f, g, a, b, n, u0,v0);
        erroRK2 = abs(uExata-uRK2);
        table_data(:,end+1) = transpose(uRK2);
        table_data(:,end+1) = transpose(erroRK2);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK2';
        table_name{end+1} = 'Erro - RK2';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK2, 'm', 'DisplayName', 'RK2');
        legend('off');
        legend('show');
    end
    
    % RK3
    if get(handles.cbRK3, 'Value') == 1
        [~,uRK3,~]   =   NRK3SED(f, g, a, b, n, u0,v0);
        erroRK3 = abs(uExata-uRK3);
        table_data(:,end+1) = transpose(uRK3);
        table_data(:,end+1) = transpose(erroRK3);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK3';
        table_name{end+1} = 'Erro - RK3';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK3, 'c', 'DisplayName', 'RK3');
        legend('off');
        legend('show');
    end
    
    % RK4
    if get(handles.cbRK4, 'Value') == 1
        [~,uRK4,~]   =   NRK4SED(f, g, a, b, n, u0,v0);
        erroRK4 = abs(uExata-uRK4);
        table_data(:,end+1) = transpose(uRK4);
        table_data(:,end+1) = transpose(erroRK4);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK4';
        table_name{end+1} = 'Erro - RK4';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK4, 'k', 'DisplayName', 'RK4');
        legend('off');
        legend('show');
    end
end

% Vibracao Forcada nao Amortecida
if selecao == 4
    set(handles.cbEuler, 'Enable', 'on');
    % EULER
    if get(handles.cbEuler, 'Value') == 1
        [~,uEuler,~] = NEulerSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEuler);
        table_data(:,end+1) = transpose(uEuler);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler';
        table_name{end+1} = 'Erro - Euler';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEuler, 'b', 'DisplayName', 'Euler');
        legend('off');
        legend('show');
    end
    
    % EULER MELHORADO
    if get(handles.cbEulerM, 'Value') == 1
        [~,uEulerM,~]= NEulerMSED(f, g, a, b, n, u0,v0);
        erroEulerM = abs(uExata-uEulerM);
        table_data(:,end+1) = transpose(uEulerM);
        table_data(:,end+1) = transpose(erroEulerM);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'Euler Melhorado';
        table_name{end+1} = 'Erro - Euler Melhorado';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uEulerM, 'g', 'DisplayName', 'Euler Melhorado');
        legend('off');
        legend('show');
    end
    
    % RK2
    if get(handles.cbRK2, 'Value') == 1
        [~,uRK2,~]   =   NRK2SED(f, g, a, b, n, u0,v0);
        erroRK2 = abs(uExata-uRK2);
        table_data(:,end+1) = transpose(uRK2);
        table_data(:,end+1) = transpose(erroRK2);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK2';
        table_name{end+1} = 'Erro - RK2';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK2, 'm', 'DisplayName', 'RK2');
        legend('off');
        legend('show');
    end
    
    % RK3
    if get(handles.cbRK3, 'Value') == 1
        [~,uRK3,~]   =   NRK3SED(f, g, a, b, n, u0,v0);
        erroRK3 = abs(uExata-uRK3);
        table_data(:,end+1) = transpose(uRK3);
        table_data(:,end+1) = transpose(erroRK3);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK3';
        table_name{end+1} = 'Erro - RK3';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK3, 'c', 'DisplayName', 'RK3');
        legend('off');
        legend('show');
    end
    
    % RK4
    if get(handles.cbRK4, 'Value') == 1
        [~,uRK4,~]   =   NRK4SED(f, g, a, b, n, u0,v0);
        erroRK4 = abs(uExata-uRK4);
        table_data(:,end+1) = transpose(uRK4);
        table_data(:,end+1) = transpose(erroRK4);
        table_name = get(handles.table, 'ColumnName');
        table_name{end+1} = 'RK4';
        table_name{end+1} = 'Erro - RK4';
        set(handles.table, 'Data', table_data);
        set(handles.table, 'ColumnName', table_name);
        plot(handles.axes1, t, uRK4, 'k', 'DisplayName', 'RK4');
        legend('off');
        legend('show');
    end
end

hold off

if get(handles.cbGrelha, 'Value') == 1
    grid on;
else
    grid off;
end

% --- Executes on button press in pbReset.
function pbReset_Callback(hObject, eventdata, handles)
% hObject    handle to pbReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);

set(handles.menuSelect, 'Value', 1);
set(handles.StrF, 'String', 'v');
set(handles.StrG, 'String', '-sin(u)-0.3*v');
set(handles.edtA, 'String', '0');
set(handles.edtB, 'String', '15');
set(handles.sliderH, 'Value', 100);
set(handles.edtN, 'String', '100');
set(handles.edtU, 'String', 'pi/2');
set(handles.edtV, 'String', '0');

set(handles.table, 'Data', {});
table_name = {'t'};
set(handles.table, 'ColumnName', table_name);
set(handles.cbEuler, 'Value', 1);
set(handles.cbEulerM, 'Value', 0);
set(handles.cbRK2, 'Value', 0);
set(handles.cbRK3, 'Value', 0);
set(handles.cbRK4, 'Value', 0);

set(handles.menuSelect, 'Value', 1);
set(handles.cbEuler, 'Enable', 'Inactive');



% --- Executes on button press in cbGrelha.
function cbGrelha_Callback(hObject, eventdata, handles)
% hObject    handle to cbGrelha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of cbGrelha

if get(hObject, 'Value') == 0
    grid off
else
    grid on
end

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function probPendulo_Callback(hObject, eventdata, handles)
% hObject    handle to probPendulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.menuSelect, 'Value', 1);

set(handles.StrF, 'String', 'v');
set(handles.StrG, 'String', '-sin(u)-0.3*v');
set(handles.edtA, 'String', '0');
set(handles.edtB, 'String', '15');
set(handles.sliderH, 'Value', 100);
set(handles.edtN, 'String', '100');
set(handles.edtU, 'String', 'pi/2');
set(handles.edtV, 'String', '0');
set(handles.cbEuler, 'Value', 1);
set(handles.cbEulerM, 'Value', 0);
set(handles.cbRK2, 'Value', 0);
set(handles.cbRK3, 'Value', 0);
set(handles.cbRK4, 'Value', 0);
set(handles.cbEuler, 'Enable', 'Inactive');



% --------------------------------------------------------------------
function probMMSA_Callback(hObject, eventdata, handles)
% hObject    handle to probMMSA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.menuSelect, 'Value', 2);

set(handles.StrF, 'String', 'v');
set(handles.StrG, 'String', '-16*u');
set(handles.edtA, 'String', '0');
set(handles.edtB, 'String', '2*pi');
set(handles.sliderH, 'Value', 100);
set(handles.edtN, 'String', '100');
set(handles.edtU, 'String', '9');
set(handles.edtV, 'String', '0');
set(handles.cbEuler, 'Value', 0);
set(handles.cbEulerM, 'Value', 0);
set(handles.cbRK2, 'Value', 0);
set(handles.cbRK3, 'Value', 0);
set(handles.cbRK4, 'Value', 0);
set(handles.cbEuler, 'Enable', 'on');



% --------------------------------------------------------------------
function probMMCA_Callback(hObject, eventdata, handles)
% hObject    handle to probMMCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.menuSelect, 'Value', 3);

set(handles.StrF, 'String', 'v');
set(handles.StrG, 'String', '-10*v-25*u');
set(handles.edtA, 'String', '0');
set(handles.edtB, 'String', '2*pi');
set(handles.sliderH, 'Value', 100);
set(handles.edtN, 'String', '100');
set(handles.edtU, 'String', '0');
set(handles.edtV, 'String', '-4');
set(handles.cbEuler, 'Value', 0);
set(handles.cbEulerM, 'Value', 0);
set(handles.cbRK2, 'Value', 0);
set(handles.cbRK3, 'Value', 0);
set(handles.cbRK4, 'Value', 0);
set(handles.cbEuler, 'Enable', 'on');

% --------------------------------------------------------------------
function probBatimento_Callback(hObject, eventdata, handles)
% hObject    handle to probBatimento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.menuSelect, 'Value', 4);

set(handles.StrF, 'String', 'v');
set(handles.StrG, 'String', '2.77778*sin(0.9*t)*sin(0.1*t)');
set(handles.edtA, 'String', '0');
set(handles.edtB, 'String', '80');
set(handles.sliderH, 'Value', 800);
set(handles.edtN, 'String', '800');
set(handles.edtU, 'String', '0');
set(handles.edtV, 'String', '0');
set(handles.cbEuler, 'Value', 0);
set(handles.cbEulerM, 'Value', 0);
set(handles.cbRK2, 'Value', 0);
set(handles.cbRK3, 'Value', 0);
set(handles.cbRK4, 'Value', 0);
set(handles.cbEuler, 'Enable', 'on');


% --------------------------------------------------------------------
function ctrlAutores_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlAutores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Autor.m;

% --------------------------------------------------------------------
function ctrlSair_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SN = questdlg('Quer mesmo sair?', 'Sair', 'Sim', 'Nao', 'Sim');
if strcmp(SN, 'Nao')
    return;
end
delete(handles.UiControl);


% --- Executes when user attempts to close UiControl.
function UiControl_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to UiControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
SN = questdlg('Quer mesmo sair?', 'Sair', 'Sim', 'Nao', 'Sim');
if strcmp(SN, 'Nao')
    return;
end
delete(hObject);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function probPenduloDoc_Callback(hObject, eventdata, handles)
% hObject    handle to probPenduloDoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open 'Problema do Pendulo.pdf';


% --------------------------------------------------------------------
function probBatimentoDoc_Callback(hObject, eventdata, handles)
% hObject    handle to probBatimentoDoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open 'Vibraçaõ Livre Forçada.pdf'


% --- Executes on button press in hlpRK3.
function hlpRK3_Callback(hObject, eventdata, handles)
% hObject    handle to hlpRK3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = msgbox({'                    MÉTODO DE RUNGE - KUTTA DE ORDEM 3 (RK3) para SED';' ';...
    '[t,uRK3,vRK3] = NRK3SED(f,g,a,b,n,u0,v0)';...
    "u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0";' ';...
    
    '-> INPUT:';"f, g - funções do 2.º membro das Equações Diferenciais";...
    "[a, b] - extremos do intervalo da variável independente t";...
    "n      - número de subintervalos ou interações do método";...
    "u0, v0 - condições iniciais t=a -> u=u0 e v=v0";' ';...
    
    '-> OUTPUT:';"[t,u,v] - vector das soluções aproximações e da discretização de t";...
    "k1_u        = h * f(t(i),u(i),v(i));";...
    "k1_v        = h * g(t(i),u(i),v(i));";...
    "k2_u        = h * f(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));";...
    "k2_v        = h * g(  t(i)+h/2,  u(i)+k1_u*(1/2),  v(i)+k1_v*(1/2));";...
    "k3_u        = h * f(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);";...
    "k3_v        = h * g(  t(i)+h,  u(i)-k1_u+2*k2_u,  v(i)-k1_v+2*k2_v);";...
    "u(i+1)=u(i)+(k1_u+4*k2_u+k3_u)/6;";...
    "v(i+1)=v(i)+(k1_v+4*k2_v+k3_v)/6;";' ';...
   
    'O método de Runge - Kutta de ordem 3 (RK3) é um dos métodos númericos';...
    'desenvolvidos pelos matemáticos alemães Carl Runge e Martin Kutta, por';...
    'volta de 1900. Os métodos desenvolvidos pelos dois matemáticos formam';...
    'uma vasta família de métodos numéricos diretos de passo simples para a';...
    'resolução de Equações Diferenciais Ordinárias / Problemas de Valor Inicial.';' '; ' '},...
    'Método de Runge-Kutta de Ordem 3');



% --- Executes on button press in cbRK3.
function cbRK3_Callback(hObject, eventdata, handles)
% hObject    handle to cbRK3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbRK3


% --------------------------------------------------------------------
function ctrlRelatorio_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlRelatorio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Relatório-da-Atividade-02.pdf;


% --------------------------------------------------------------------
function ctrlExercicios_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlExercicios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open 'Equações Diferenciais de ordem 2 _ Problemas de aplicação.pdf'


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exportgraphics(handles.objGraph, 'Plot.png');
a = msgbox("Ficheiro guardado na pasta com o nome 'Plot.png'", 'modal');
