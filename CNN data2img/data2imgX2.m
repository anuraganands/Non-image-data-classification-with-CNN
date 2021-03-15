%% Non-image to image transformation - Algorithm 2/3
% 
% Copyright (c) 2019, Anuraganand Sharma - All rights reserved.
% 
% This Matlab code is the implementation of Normalized Distance Matrix proposed by Anuraganand Sharma in the preprints:
% version 1: A. Sharma and D. Kumar, Non-image Data Classification with Convolutional Neural Networks. 
% version 2: A. Sharma and D. Kumar, Classification with 2-D Convolutional Neural Networks for breast cancer diagnosis.
%
% The algoirhtm reads data given in 2D form and converts them into 2D images. Currently, it works for non-time series data only.
%%
function data2imgV2
% This function converts input text data to 2D matrix. 

clear all;
clc;    
close all;

dirExp = '/Users/scchess/Sources/Non-image-data-classification-with-CNN/Data' %uigetdir(pwd, 'Select the folder containing data files');
filesExp = dir(fullfile(dirExp, '*.data'));
totalExpFiles = size(filesExp,1);

for ff = 1:totalExpFiles
     
    keepMainVars = {'dirExp', 'filesExp','totalExpFiles','ff','useGPU'};
    clearvars('-except', keepMainVars{:});
 
    file_path = [];
    data = [];       

    [NC, ~, file_path, x, y, N, d, inputVal, givenOut] = readData(data, file_path,filesExp(ff).name,filesExp(ff).folder,1.0);
    [~,file_used,~] = fileparts(file_path); %get only file name. Remove extension.

    file_used
    dataFolder = [dirExp '\Alg2_' file_used];   
  %  if exist(dataFolder, 'dir')
   %    warning (['Output folder [' dataFolder '] already exists']);
    %    return
    %else
     %   mkdir(dataFolder);
    %end   
    labels = unique(y);

    for l = labels
       mkdir([dataFolder '\' int2str(l)]); 
    end

    outFile = [dataFolder '\'];
    expand = [1 1]; %by 3x3 or keep it 1x1
    expand = ones(expand);
    eImg = cell(d,d);

    f = waitbar(0,'...','Name',['Processing images for ' file_used]); 

    for i = 1:N
        in = x(:,i);
        M = zeros(d,d);

        for r = 1:d
            for c = 1:d
                M(r,c)= in(r)-in(c);                
            end
        end

        imgI=norm_scale01(M);
        for r = 1:d
            for c = 1:d
                eImg{r,c} = expand.*imgI(r,c);
            end
        end

        imgI = cell2mat(eImg);
        imgFile = [outFile int2str(y(i)) '/img' int2str(i)];
%            dlmwrite(imgFile,imgI); %saves text data
%             imshow(imgI);
        imwrite(imgI,[imgFile '.png']); %saves image
        waitbar(i/N,f,sprintf('Processing (%s): %g/%g',file_used,i,N)); 
    end
    delete(f); 
end

end