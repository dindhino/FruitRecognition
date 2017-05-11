function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 11-May-2017 18:19:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global R;
global im;
handles.output = hObject;
[fn pn] = uigetfile({'*.jpg;*.png;*.bmp'},'Select Image File');
complete = strcat(pn,fn);
% handles.
[X,map] = imread(complete);
axes(handles.axes1);
imshow(X,map);
R=X;
im=X;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global R;

s=segmemtasi(im);
Nama_model=struct('Nama',{},'Jumlah',{});
Nama_model(1).Nama='Apple Merah'; Nama_model(1).Jumlah=0;
Nama_model(2).Nama='Pear Hijau'; Nama_model(2).Jumlah=0;
Nama_model(3).Nama='Strawbery Merah'; Nama_model(3).Jumlah=0;
Nama_model(4).Nama='Banana Kuning'; Nama_model(4).Jumlah=0;
Nama_model(5).Nama='Unknown'; Nama_model(5).Jumlah=0;

for i=1:s
    a=imread(strcat(num2str(i),'.jpg'));
    M=ekstraksi(~(im2bw(a)));
    hasil1=matching(M);
    
    M=glcm(a);
    hasil2=matchingtexture(M);
    
    M=colorMoments(a);
    hasil3=matchingwarna(M);
    
    hasil1=ceil(hasil1/6);
    hasil2=ceil(hasil2/6);
    hasil3=ceil(hasil3/6);
    
    
    if (hasil1 == hasil2 || hasil1==hasil3 )
        hasil=hasil1;
%     elseif(hasil2 == hasil3)
%         hasil=hasil2;
    else
        hasil=5;
    end
    
    Nama_model(hasil).Jumlah=Nama_model(hasil).Jumlah+1;
end
for i=1:5
    output(i)={[strcat(Nama_model(i).Nama,'=',num2str(Nama_model(i).Jumlah))]};
end
set(handles.listbox1,'string',output);
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
global R;

Nama_model=struct('Nama',{},'Jumlah',{});
Nama_model(1).Nama='Apple Merah'; Nama_model(1).Jumlah=0;
Nama_model(2).Nama='Pear Hijau'; Nama_model(2).Jumlah=0;
Nama_model(3).Nama='Strawbery Merah'; Nama_model(3).Jumlah=0;
Nama_model(4).Nama='Banana Kuning'; Nama_model(4).Jumlah=0;
Nama_model(5).Nama='Unknown'; Nama_model(5).Jumlah=0;

    M=ekstraksi(~(im2bw(im)));
    hasil1=matching(M);
    
    M=glcm(im);
    hasil2=matchingtexture(M);
    
    M=colorMoments(im);
    hasil3=matchingwarna(M);
    
    hasil1=ceil(hasil1/6);
    hasil2=ceil(hasil2/6);
    hasil3=ceil(hasil3/6);
    hasil1
    hasil2
    hasil3
    if (hasil1 == hasil2 || hasil1==hasil3 )
        hasil=hasil1;
%     elseif(hasil2 == hasil3)
%         hasil=hasil2;
    else
        hasil=5;
    end
    Nama_model(hasil).Jumlah=Nama_model(hasil).Jumlah+1;

for i=1:5
    output(i)={[strcat(Nama_model(i).Nama,'=',num2str(Nama_model(i).Jumlah))]};
end
set(handles.listbox1,'string',output);
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Nama_model=struct('Nama',{},'Jumlah',{});
Nama_model(1).Nama='Apple Merah'; Nama_model(1).Jumlah=0;
Nama_model(2).Nama='Pear Hijau'; Nama_model(2).Jumlah=0;
Nama_model(3).Nama='Strawbery Merah'; Nama_model(3).Jumlah=0;
Nama_model(4).Nama='Banana Kuning'; Nama_model(4).Jumlah=0;
Nama_model(5).Nama='Unknown'; Nama_model(5).Jumlah=0;

ind=0;
for i=1:6
    nama=strcat('Data_1301144360\Apple\Latih_Apple_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
    ind=ind+1;
    imgar{ind}=a;
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Pear\Data Latih Pear\Latih_Pear_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
    ind=ind+1;
    imgar{ind}=a;
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Strawberry\Data Latih Strawberry\Latih_Strawberry_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
    ind=ind+1;
    imgar{ind}=a;
end
for i=1:6
    nama=strcat('Data_1301144360\Pisang\Latih_Banana_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
    ind=ind+1;
    imgar{ind}=a;
end
benar=0;
for i=1:ind
    M=ekstraksi(~(im2bw(imgar{i})));
    hasil1=matching(M);
    
    M=glcm(imgar{i});
    hasil2=matchingtexture(M);
    
    M=colorMoments(imgar{i});
    hasil3=matchingwarna(M);
    
    hasil1=ceil(hasil1/6);
    hasil2=ceil(hasil2/6);
    hasil3=ceil(hasil3/6);
    
    if (hasil1 == hasil2 || hasil1==hasil3 )
        hasil=hasil1;
    elseif(hasil2 == hasil3)
        hasil=hasil2;
    else
        hasil=5;
    end
    asli=ceil(i/6);
    if hasil1==asli
        benar=benar+1;
    end
    Nama_model(hasil).Jumlah=Nama_model(hasil).Jumlah+1;
end
for i=1:5
    output(i)={[strcat(Nama_model(i).Nama,'=',num2str(Nama_model(i).Jumlah))]};
    benar
end
set(handles.listbox1,'string',output);
guidata(hObject, handles);
