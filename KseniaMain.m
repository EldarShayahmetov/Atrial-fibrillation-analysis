function varargout = KseniaMain(varargin)
% KSENIAMAIN MATLAB code for KseniaMain.fig
%      KSENIAMAIN, by itself, creates a new KSENIAMAIN or raises the existing
%      singleton*.
%
%      H = KSENIAMAIN returns the handle to a new KSENIAMAIN or the handle to
%      the existing singleton*.
%
%      KSENIAMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KSENIAMAIN.M with the given input arguments.
%
%      KSENIAMAIN('Property','Value',...) creates a new KSENIAMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KseniaMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KseniaMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KseniaMain

% Last Modified by GUIDE v2.5 18-Nov-2017 22:26:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KseniaMain_OpeningFcn, ...
                   'gui_OutputFcn',  @KseniaMain_OutputFcn, ...
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


% --- Executes just before KseniaMain is made visible.
function KseniaMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KseniaMain (see VARARGIN)

% Choose default command line output for KseniaMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

tab1_Callback(hObject, eventdata, handles);



% UIWAIT makes KseniaMain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = KseniaMain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

 function ShowTab(handles, tab)
         switch tab
             case 1
                 set(handles.tab1, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.tab2, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab3, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.uipanel2, 'Visible', 'On');
                 set(handles.uipanel3, 'Visible', 'Off');
                 set(handles.uipanel4, 'Visible', 'Off');
             case 2
                 set(handles.tab1, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab2, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.tab3, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.uipanel2, 'Visible', 'Off');
                 set(handles.uipanel3, 'Visible', 'On');
                 set(handles.uipanel4, 'Visible', 'Off');

             case 3
                 set(handles.tab1, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab2, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab3, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.uipanel2, 'Visible', 'Off');
                 set(handles.uipanel3, 'Visible', 'Off');
                 set(handles.uipanel4, 'Visible', 'On');
         end

function PlotSpan(handles)
    global t1 t2 T t L Lim sig0 sigm sig1 lvl rpeacks hr Fd data disc H dH% Глобальные имена
    i1=fix(t1/T)+1; % Индекс для левого маркера
    i2=fix(t2/T); % Индекс для правого маркера
    sigm = sig0(i1:i2);
    
    sig1 = PanTomp(sigm, Fd);
    lvl = max(sig1(1:200))/4;
    rpeacks = RPeacksIndexes(sig1, lvl,10,10);
    rr = GetRR(rpeacks);
    
    
    
    
    axes(handles.axes2);
    plot(t1:T:t2-T,sigm);
    title('ECG(Span)');
    ylabel('Amplitude');
    xlabel('Time(sec)');
      set(handles.axes2, 'XLim', [t1,t2]);
    
    
    axes(handles.axes3);
    plot(t1:T:t2-T, sig1);
    hold on
    stem(t1+rpeacks*T, sig1(rpeacks(1:length(rpeacks))));
    title('Detect R-edge');
    ylabel('Amplitude')
    xlabel('Time(sec)')
    hold off;
    set(handles.axes3, 'XLim', [t1,t2]);
    
    
    axes(handles.axes5);
    DrawRR(rr);
     set(handles.axes5, 'XLim', [0,length(rr)]);
     
         axes(handles.axes6);
    DrawRR(rr);
     set(handles.axes6, 'XLim', [0,length(rr)]);
     
     axes(handles.axes7);
     RRHist(rr);
     
      axes(handles.axes8);
     ScatterRR(rr);
     

     
 RRsr=mean(rr);		% Средний RR-интервал
RRmin=min(rr);		% Минимальный RR-интервал
RRmax=max(rr);		% Максимальный RR-интервал
dRR=RRmax-RRmin;	% Вариационный размах
SH=sum(H);
PH = H/SH * 100;
[AMo,iMo]=max(PH);	% Амплитуда моды и индекс моды
dH=0.05;
Mo=iMo*dH;		% Мода

    
    
disc{1} = 'Max R-R';
disc{2} = 'Min R-R';
disc{3} = 'Mean R-R';
disc{4} = 'Variables';
disc{5} = 'Moda' 
disc{6} = 'Param: Atrial Fibrillatin'; 
disc{7} = 'Result: Detected'; 

data(1) = RRmax;
data(2) = RRmin;
data(3) = RRsr;
data(4) = dRR;
data(5) = Mo;
data(6) = 1;
data(7) = 1;

res = GetResults(data, disc)
set(handles.text6, 'String', res);




function Get_t1(handles) % Объявление функции
global t1 t2 Mark1 t L Lim % Глобальные имена
str=get(handles.edit1,'String'); % Ввод строки из поля 1
t1 = str2double(str); % Преобразование в число
if t1<0 % Проверка на допустимость:
t1=0;
elseif t1>t2
t1=t2;
end
axes(handles.axes1) % Активизация поля 3
hold on
delete(Mark1); % Удаление прежнего маркера
Mark1=plot([t1 t1],[Lim(1) Lim(2)],':k'); % Новый маркер
hold off;
set(handles.edit1,'String',num2str(t1)); % Запись t1 в поле ввода
PlotSpan(handles); % Вызов функции построения ВКГ


function Get_t2(handles) % Объявление функции
global t1 t2 Mark2 t L Lim % Глобальные имена
str=get(handles.edit2,'String'); % Ввод строки из поля 1
t2 = str2double(str); % Преобразование в число
if t2<0 % Проверка на допустимость:
t2=0;
elseif t2<t1
t1=t2;
end
axes(handles.axes1) % Активизация поля 3
hold on
delete(Mark2); % Удаление прежнего маркера
Mark2=plot([t2 t2],[Lim(1) Lim(2)],':k'); % Новый маркер
hold off
set(handles.edit2,'String',num2str(t2)); % Запись t1 в поле ввода
PlotSpan(handles);




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fd;
global dur;
global T;
global t1 t2 Mark1 Mark2 t L Lim sig0 sig1 lvl rpeacks hr;
InitGlobalVars();
sig0 = ImportData(10000, dur, 1);
sig0 = InitECG(sig0);


            L=length(sig0);
            t = 0:T:T*(L-1); 
            axes(handles.axes1);
            plot(t, sig0);
            title('ECG(Full)');
            ylabel('Amplitude');
            xlabel('Time(sec)');
            set(handles.axes1, 'XLim', [0,T*(L-1)]);
            hold on;
            t1=0; % Время для левого маркера (начало фрагмента ЭКГ)
            t2=t(L); % Время для правого маркера (конец фрагмента ЭКГ)
            Lim=get(handles.axes1,'YLim') % Определение границ по ординате
            Mark1=plot([t1 t1],[Lim(1) Lim(2)],':k'); % Левый маркер
            Mark2=plot([t2 t2],[Lim(1) Lim(2)],':k'); % Правый маркер
            hold off;
            Get_t2(handles);
            Get_t1(handles);
            
      
           



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
Get_t1(handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
Get_t2(handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data disc;

SaveResults(data, disc);


% --- Executes on button press in tab1.
function tab1_Callback(hObject, eventdata, handles)
% hObject    handle to tab1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 1);


% --- Executes on button press in tab2.
function tab2_Callback(hObject, eventdata, handles)
% hObject    handle to tab2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 2);


% --- Executes on button press in tab3.
function tab3_Callback(hObject, eventdata, handles)
% hObject    handle to tab3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 3);
