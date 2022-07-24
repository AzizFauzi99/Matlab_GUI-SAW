function varargout = Tugas_GUI_SAW(varargin)
% TUGAS_GUI_SAW MATLAB code for Tugas_GUI_SAW.fig
%      TUGAS_GUI_SAW, by itself, creates a new TUGAS_GUI_SAW or raises the existing
%      singleton*.
%
%      H = TUGAS_GUI_SAW returns the handle to a new TUGAS_GUI_SAW or the handle to
%      the existing singleton*.
%
%      TUGAS_GUI_SAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS_GUI_SAW.M with the given input arguments.
%
%      TUGAS_GUI_SAW('Property','Value',...) creates a new TUGAS_GUI_SAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tugas_GUI_SAW_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tugas_GUI_SAW_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tugas_GUI_SAW

% Last Modified by GUIDE v2.5 08-May-2022 21:13:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tugas_GUI_SAW_OpeningFcn, ...
                   'gui_OutputFcn',  @Tugas_GUI_SAW_OutputFcn, ...
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


% --- Executes just before Tugas_GUI_SAW is made visible.
function Tugas_GUI_SAW_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tugas_GUI_SAW (see VARARGIN)
global p;
p.Data = [];

% Choose default command line output for Tugas_GUI_SAW
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tugas_GUI_SAW wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tugas_GUI_SAW_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Kalkulasi.
function Kalkulasi_Callback(hObject, eventdata, handles)
% hObject    handle to Kalkulasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ambil data dari tabel
Data = cell2mat(get(handles.DataTabel, 'Data'));

%ambil bobot
nilaiC1 = str2double(get(handles.bobotC1, 'String'));
nilaiC2 = str2double(get(handles.bobotC2, 'String'));
nilaiC3 = str2double(get(handles.bobotC3, 'String'));
nilaiC4 = str2double(get(handles.bobotC4, 'String'));
nilaiC5 = str2double(get(handles.bobotC5, 'String'));
w = [nilaiC1 nilaiC2 nilaiC3 nilaiC4 nilaiC5];

%ambil cost & benefit
atributC1 = str2double(get(handles.cbC1, 'String'));
atributC2 = str2double(get(handles.cbC2, 'String'));
atributC3 = str2double(get(handles.cbC3, 'String'));
atributC4 = str2double(get(handles.cbC4, 'String'));
atributC5 = str2double(get(handles.cbC5, 'String'));
k = [atributC1 atributC2 atributC3 atributC4 atributC5];

[m, n] = size(Data);
R = zeros(m,n);
for j=1:n
    if k(j)==1
        R(:,j) = Data(:,j)./max(Data(:,j));
    else
        R(:,j) = min(Data(:,j))./Data(:,j);
    end
end

for i=1:m
    V(i) = sum(w.*R(i,:));
end

[~,hasil] = max(V);
hasilAlternatif = strcat('Data ke-', num2str(hasil));
set(handles.hasil, 'String', hasilAlternatif);

function cbC2_Callback(hObject, eventdata, handles)
% hObject    handle to cbC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cbC2 as text
%        str2double(get(hObject,'String')) returns contents of cbC2 as a double


% --- Executes during object creation, after setting all properties.
function cbC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cbC1_Callback(hObject, eventdata, handles)
% hObject    handle to cbC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cbC1 as text
%        str2double(get(hObject,'String')) returns contents of cbC1 as a double


% --- Executes during object creation, after setting all properties.
function cbC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cbC3_Callback(hObject, eventdata, handles)
% hObject    handle to cbC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cbC3 as text
%        str2double(get(hObject,'String')) returns contents of cbC3 as a double


% --- Executes during object creation, after setting all properties.
function cbC3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cbC4_Callback(hObject, eventdata, handles)
% hObject    handle to cbC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cbC4 as text
%        str2double(get(hObject,'String')) returns contents of cbC4 as a double


% --- Executes during object creation, after setting all properties.
function cbC4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cbC5_Callback(hObject, eventdata, handles)
% hObject    handle to cbC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cbC5 as text
%        str2double(get(hObject,'String')) returns contents of cbC5 as a double


% --- Executes during object creation, after setting all properties.
function cbC5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotC1_Callback(hObject, eventdata, handles)
% hObject    handle to bobotC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotC1 as text
%        str2double(get(hObject,'String')) returns contents of bobotC1 as a double


% --- Executes during object creation, after setting all properties.
function bobotC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotC2_Callback(hObject, eventdata, handles)
% hObject    handle to bobotC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotC2 as text
%        str2double(get(hObject,'String')) returns contents of bobotC2 as a double


% --- Executes during object creation, after setting all properties.
function bobotC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotC3_Callback(hObject, eventdata, handles)
% hObject    handle to bobotC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotC3 as text
%        str2double(get(hObject,'String')) returns contents of bobotC3 as a double


% --- Executes during object creation, after setting all properties.
function bobotC3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotC4_Callback(hObject, eventdata, handles)
% hObject    handle to bobotC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotC4 as text
%        str2double(get(hObject,'String')) returns contents of bobotC4 as a double


% --- Executes during object creation, after setting all properties.
function bobotC4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobotC5_Callback(hObject, eventdata, handles)
% hObject    handle to bobotC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobotC5 as text
%        str2double(get(hObject,'String')) returns contents of bobotC5 as a double


% --- Executes during object creation, after setting all properties.
function bobotC5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobotC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputC1_Callback(hObject, eventdata, handles)
% hObject    handle to inputC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputC1 as text
%        str2double(get(hObject,'String')) returns contents of inputC1 as a double


% --- Executes during object creation, after setting all properties.
function inputC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputC2_Callback(hObject, eventdata, handles)
% hObject    handle to inputC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputC2 as text
%        str2double(get(hObject,'String')) returns contents of inputC2 as a double


% --- Executes during object creation, after setting all properties.
function inputC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputC3_Callback(hObject, eventdata, handles)
% hObject    handle to inputC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputC3 as text
%        str2double(get(hObject,'String')) returns contents of inputC3 as a double


% --- Executes during object creation, after setting all properties.
function inputC3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputC4_Callback(hObject, eventdata, handles)
% hObject    handle to inputC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputC4 as text
%        str2double(get(hObject,'String')) returns contents of inputC4 as a double


% --- Executes during object creation, after setting all properties.
function inputC4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputC4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputC5_Callback(hObject, eventdata, handles)
% hObject    handle to inputC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputC5 as text
%        str2double(get(hObject,'String')) returns contents of inputC5 as a double


% --- Executes during object creation, after setting all properties.
function inputC5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputC5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TambahData.
function TambahData_Callback(hObject, eventdata, handles)
% hObject    handle to TambahData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
dataC1 = str2double(get(handles.inputC1, 'String'));
dataC2 = str2double(get(handles.inputC2, 'String'));
dataC3 = str2double(get(handles.inputC3, 'String'));
dataC4 = str2double(get(handles.inputC4, 'String'));
dataC5 = str2double(get(handles.inputC5, 'String'));

p.Data = [p.Data; [{dataC1} {dataC2} {dataC3} {dataC4} {dataC5}] ];
set(handles.DataTabel, 'Data', p.Data)

% setelah data masuk tabel, inputan direset
riset = '';
set(handles.inputC1, 'String', riset);
set(handles.inputC2, 'String', riset);
set(handles.inputC3, 'String', riset);
set(handles.inputC4, 'String', riset);
set(handles.inputC5, 'String', riset);
