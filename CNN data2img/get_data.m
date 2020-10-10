% version 1: [ data, filename] = get_data( data_type,  separator , msg, file_type)
% version 2: [ data, filepath] = get_data( data_type,  separator , msg, file_type)
% Filepath is used instead of filename
function [ data, filepath] = get_data( data_type,  separator , msg, file_type, givenFileName, givenFilePath)
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

if(isempty(givenFileName) || isempty(givenFilePath))
    [filename path] = uigetfile(file_type, msg);
else
    filename = givenFileName;
    path = [givenFilePath '\'];
end

if(path == 0)
    error(['file not selected' ' :-(']);
    exit
end

filepath = [path filename]

[fid,msg] = fopen(filepath,'r');

if(fid<0)
    error(['Cannot open ' filename]); 
    exit
end

fprintf('file (%s) opened successfully\n', filename);

L = fscanf(fid, '%d', [1 1]); % Total features/dimension with class number


format = '';
for(i = 1:L-1)
    format = [format data_type separator];
end
format = [format data_type];


%% Write code to get the data of your type
%<<
file_data = [];
while(true)
    tmp = fscanf(fid, format, [L 1E6]);
    tmp = tmp';
    
    if(isempty(tmp))
       break; 
    end
    
    file_data = [file_data;tmp];
end
%>>

fclose(fid);
Antigen = file_data;

data = Antigen;
