function varargout = FINAL_CLASSIFICATION(varargin)
% FINAL_CLASSIFICATION MATLAB code for FINAL_CLASSIFICATION.fig
%      FINAL_CLASSIFICATION, by itself, creates a new FINAL_CLASSIFICATION or raises the existing
%      singleton*.
%
%      H = FINAL_CLASSIFICATION returns the handle to a new FINAL_CLASSIFICATION or the handle to
%      the existing singleton*.
%
%      FINAL_CLASSIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_CLASSIFICATION.M with the given input arguments.
%
%      FINAL_CLASSIFICATION('Property','Value',...) creates a new FINAL_CLASSIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FINAL_CLASSIFICATION_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FINAL_CLASSIFICATION_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FINAL_CLASSIFICATION

% Last Modified by GUIDE v2.5 19-Jul-2016 19:23:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FINAL_CLASSIFICATION_OpeningFcn, ...
                   'gui_OutputFcn',  @FINAL_CLASSIFICATION_OutputFcn, ...
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


% --- Executes just before FINAL_CLASSIFICATION is made visible.
function FINAL_CLASSIFICATION_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FINAL_CLASSIFICATION (see VARARGIN)

% Choose default command line output for FINAL_CLASSIFICATION
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FINAL_CLASSIFICATION wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FINAL_CLASSIFICATION_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=get(handles.popupmenu1,'value');

switch(p)
    case(1)
        %d = dir('SupraVentricular Arrhythmia_78Signals_(128Hz)_2Ch_30Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
            dete = importdata('01m.mat'); 
      case(2)
       % d = dir('SupraVentricular Arrhythmia_78Signals_(128Hz)_2Ch_30Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('03m.mat');   
      case(3)
        %d = dir('Ventricular Tachyarrhythmia_35Signals_(250Hz)1Ch_8Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('100m.mat');   
      case(4)
        %d = dir('Ventricular Tachyarrhythmia_35Signals_(250Hz)1Ch_8Min/*.mat');
       % [file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('101m.mat');   
      case(5)
       % d = dir('PrematureVentricularContraction_48Signals_(360Hz)_2Ch_30Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('418m.mat');
      case(6)
        %d = dir('PrematureVentricularContraction_48Signals_(360Hz)_2Ch_30Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('419m.mat');
      case(7)
       % d = dir('Maligant Ventricular Ectopic_22Signals_(250Hz)_2Ch_35Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('800m.mat');
      case(8)
        %d = dir('Maligant Ventricular Ectopic_22Signals_(250Hz)_2Ch_35Min/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('801m.mat');
       case(9)
        d = dir('MI_128Signals_(1000Hz)_1Ch_115Seconds/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('04048m.mat');
       case(10)
        %d = dir('MI_128Signals_(1000Hz)_1Ch_115Seconds/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('08215m.mat');
       case(11)
        %d = dir('Long term AF_84Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('16265m.mat');
       case(12)
        %d = dir('Long term AF_84Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('16273m.mat');
       case(13)
        %d = dir('Normal_12Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('cu02m.mat');
       case(14)
        %d = dir('Normal_12Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('cu03m.mat');
      case(15)
        %d = dir('Normal_12Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('s0014lrem.mat');
     case(16)
        %d = dir('Normal_12Signals_(128Hz)_2Ch_1Hr/*.mat');
        %[file_name path_name] = uigetfile({'*.mat'},'');
        dete = importdata('s0015lrem.mat');
end
% d=dir('datafolder/*.mat');
% for i=1:size(d,1)
%     if(p==i)
%         dete = importdata(['datafolder/' d(i).name]);
%     end
% end
pp=get(handles.popupmenu2,'value');
switch(pp)
    case(1)
        Fs=128; 
    case(2)
       Fs=250; 
    case(3)
       Fs=360; 
    case(4)
        Fs=1000;
end
        
        
% d = dir('db/*.mat');
% [file_name path_name] = uigetfile({'*.mat'},'');
%dete = importdata([path_name file_name]);
%Fs=input('Enter the sampling frequency = ');
ecg=dete(1,:);
[MF,su,wm,wsd,skew,kurt,VF,M,A,mav,TCSC] = Final_features(ecg,Fs);
%[VF,M,A,mav,TCSC]=Final_features2(ecg,Fs);


% plot(handles.axes1,t,ecg);
% set(handles.axes1,'Color','k','Tag','axes1');
axes(handles.axes1)
plot(ecg(1:10*Fs),'r','LineWidth',2)
drawnow
xlabel('Samples')
ylabel('Amplitude [mV]')
grid on
title('Input Signal')

%% LEVEL 1 CLASSIFICATION

    %%%% ANN %%%%

    Features_First_Level=[MF,su,wm,wsd,skew,kurt,VF,M,A,mav,TCSC];
    net_level_1=importdata('SIMPLE_NET.mat');
    outputs_first_level=net_level_1(Features_First_Level');              
    display(outputs_first_level) 
    [maximum,loc]=max(outputs_first_level);
%     display(loc)
%     display(maximum)

    %%%% FUZZY LOGIC %%%%

    fout_first_level=readfis('new_classifier_simple9.fis');
    w1=evalfis(outputs_first_level,fout_first_level);
    w=w1';
    display(w)
    [maximum1,loc1]=max(w);
    display(maximum1)
    
    % CONDITION
    
%         if (outputs_first_level(1,1)==maximum)
%          msgbox('NORMAL SINUS RHYTHM')
%         elseif (outputs_first_level(2,1)==maximum)
%           msgbox('ATRIAL ARRHYTHMIAS')

           if (w(1,1)==maximum1)
         %msgbox('NORMAL SINUS RHYTHM')
         a='NORMAL SINUS RHYTHM';
         string = sprintf('%s',a);
        elseif (w(2,1)==maximum1)
         % msgbox('ATRIAL ARRHYTHMIAS')
          
         % LEVEL 2 CLASSIFICATION
             %% ATRIAL ARRHYTHMIAS
    
                %%%% ANN %%%%
                Features_Second_Level_Atrial_Arrhythmias=[MF,su,wm,wsd,skew,kurt,VF,M,A,mav,TCSC];
                net_level_2_atrial_arrhythmias=importdata('net_ATRIAL2.mat');
                outputs_second_level_atrial_arrhythmias=net_level_2_atrial_arrhythmias(Features_Second_Level_Atrial_Arrhythmias');              
                display(outputs_second_level_atrial_arrhythmias) 
                [maximum2,loc2]=max(outputs_second_level_atrial_arrhythmias);
                display(loc2)
                display(maximum2)

                %%% FUZZY LOGIC %%%%

                fout_second_level_atrial_arrhythmias=readfis('new_classifier_atrial4.fis');
                w2=evalfis(outputs_second_level_atrial_arrhythmias,fout_second_level_atrial_arrhythmias);
                ww=w2';
                [maximum3,loc3]=max(ww);
                %display(maximum3)

                % CONDITION
% % 
% %                 if (outputs_second_level_atrial_arrhythmias(1,1)==maximum2)
% %                      msgbox('SUPRAVENTRICULAR ARRHYTHMIAS')                                        
% %                 elseif (outputs_second_level_atrial_arrhythmias(2,1)==maximum2)
% %                      msgbox('ATRIAL FIBRILLATION')
% %                 end
% 
                if (ww(1,1)==maximum3)
                     %msgbox('SUPRAVENTRICULAR ARRHYTHMIAS') 
                     a='SUPRAVENTRICULAR ARRHYTHMIAS';
                     string = sprintf('%s',a);
                elseif (ww(2,1)==maximum3)
                     %msgbox('ATRIAL FIBRILLATION')
                     a='ATRIAL FIBRILLATION';
                     string = sprintf('%s',a);
                end
%      elseif (outputs_first_level(3,1)==maximum)
%          msgbox('VENTRICULAR ARRHYTHMIAS') 
         
         elseif (w(3,1)==maximum1)
         %msgbox('VENTRICULAR ARRHYTHMIAS') 
         
         %% LEVEL 2 CLASSIFICATION
         
%             VENTRICULAR ARRHYTHMIAS
    
                %%%% ANN %%%%
                Features_Second_Level_Ventricular_Arrhythmias=[MF,su,VF,M,A,mav,TCSC];
                net_level_2_venricular_arrhythmias=importdata('net_vet2.mat');
                outputs_second_level_ventricular_arrhythmias=net_level_2_venricular_arrhythmias(Features_Second_Level_Ventricular_Arrhythmias');              
                %outputs_second_level_ventricular_arrhythmias1=[outputs_second_level_ventricular_arrhythmias(2,1);outputs_second_level_ventricular_arrhythmias(3,1)];
                display(outputs_second_level_ventricular_arrhythmias) 
                [maximum4,loc4]=max(outputs_second_level_ventricular_arrhythmias);
%                 display(loc4)
%                 display(maximum4)

                %%% FUZZY LOGIC %%%%

                fout_second_level_ventricular_arrhythmias=readfis('new_classifier_ventricular18.fis');
                w3=evalfis(outputs_second_level_ventricular_arrhythmias,fout_second_level_ventricular_arrhythmias);
                www=w3';
                [maximum5,loc5]=max(www);
                display(www)
                
                % CONDITION

%                 if (outputs_second_level_ventricular_arrhythmias(1,1)==maximum4)
%                      msgbox('PREMATURE VENTRICULAR CONTRACTION')
%                 elseif (outputs_second_level_ventricular_arrhythmias(2,1)==maximum4)
%                      msgbox('VENTRICULAR TACHYCARDIA')
%                 elseif (outputs_second_level_ventricular_arrhythmias(3,1)==maximum4)
%                      msgbox('MALIGANT VENTRICULAR ECTOPY')
%                 end

                if (www(1,1)==maximum5)
                     %msgbox('PREMATURE VENTRICULAR CONTRACTION')
                     a='PREMATURE VENTRICULAR CONTRACTION';
                     string = sprintf('%s',a);
                elseif(www(2,1)==maximum5)
                      %msgbox('VENTRICULAR TACHYCARDIA')
                      a='VENTRICULAR TACHYCARDIA';
                      string = sprintf('%s',a);
                elseif(www(3,1)==maximum5)
                     %msgbox('MALIGANT VENTRICULAR ECTOPY')
                     a='MALIGANT VENTRICULAR ECTOPY';
                     string = sprintf('%s',a);
                end
               
%      elseif (outputs_first_level(4,1)==maximum)
%          msgbox('MYOCARDIAL INFRACTION')
%            end
     elseif (w(4,1)==maximum1)
        % msgbox('MYOCARDIAL INFRACTION')
         a='MYOCARDIAL INFRACTION';
         string = sprintf('%s',a);
           end
           
%set(handles.edit1,'string',' ')
                  
%a='Cardiac Arrhythmias'
set(handles.edit1,'String',a)
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String','');
cla(handles.axes1,'reset');
clear


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
