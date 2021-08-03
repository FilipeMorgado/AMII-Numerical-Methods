function varargout = Autor(varargin)
% AUTOR M-file for Autor.fig
%      AUTOR, by itself, creates a new AUTOR or raises the existing
%      singleton*.
%
%      H = AUTOR returns the handle to a new AUTOR or the handle to
%      the existing singleton*.
%
%      AUTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOR.M with the given input arguments.
%
%      AUTOR('Property','Value',...) creates a new AUTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Autor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Autor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Autor

% Last Modified by GUIDE v2.5 20-Apr-2020 22:34:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Autor_OpeningFcn, ...
                   'gui_OutputFcn',  @Autor_OutputFcn, ...
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


% --- Executes just before Autor is made visible.
function Autor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Autor (see VARARGIN)

% Choose default command line output for Autor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% I = imread('ArmenioCorreia.jpg');
% image(I);
% axis image
% axis off
I1=imread('ArmenioCorreia.JPG','JPEG');
imshow(I1,[],'Parent',handles.axesArmenio)

I2=imread('VascoPereira.JPEG', 'JPEG');
imshow(I2, [], 'Parent', handles.axesVasco);

I3=imread('RuiFerreira.JPG', 'JPEG');
imshow(I3, [], 'Parent', handles.axesRui);

I4=imread('FilipeMorgado.JPG', 'JPEG');
imshow(I4, [], 'Parent', handles.axesFilipe);

I5=imread('FatimaRodrigues.JPG', 'JPEG');
imshow(I5, [], 'Parent', handles.axesFatinha);

% UIWAIT makes Autor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Autor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ctrlMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ctrlMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1)
run menu.m;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(handles.figure1)
run menu.m;
