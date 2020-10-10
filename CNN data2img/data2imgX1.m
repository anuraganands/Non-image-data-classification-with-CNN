%% Non-image to image transformation - Algorithm 1/3
% 
% Copyright (c) 2019, Anuraganand Sharma - All rights reserved.
% 
% This Matlab code is the implementation of Equidistant Bar Graph algorithm proposed by Anuraganand Sharma in the preprints:
% version 1: A. Sharma and D. Kumar, Non-image Data Classification with Convolutional Neural Networks. 
% version 2: A. Sharma and D. Kumar, Classification with 2-D Convolutional Neural Networks for breast cancer diagnosis.
%
% The algoirhtm reads data given in 2D form and converts them into 2D images. Currently, it works for non-time series data only.
%%
function data2imgX1
% This function converts input text data to histogram. 

clear all;
clc;    
close all;

useGPU = false;
%Requires Parallel Computing Toolbox, otherwise just comment out the
%following code.
%<<
if(gpuDeviceCount>0)
    useGPU = true;
end
%>>

dirExp = uigetdir(pwd, 'Select the folder containing data files');
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
    dataFolder = [dirExp '\Alg1_' file_used];   
    if exist(dataFolder, 'dir')
        warning (['Output folder [' dataFolder '] already exists']);
        return
    else
        mkdir(dataFolder);
    end    
    labels = unique(y);

    for l = labels
       mkdir([dataFolder '\' int2str(l)]); 
    end

    px = 1; %pixcel or column width.
    gap = 0; %gap between two columns
    imgSz =  [(px*d+gap*(d+1)) (px*d+gap*(d+1))]; 
    maxBarHeight = imgSz(1)- 2*px; %leave some space (padding) for bottom and up.

    f = waitbar(0,'...','Name',['Processing images for ' file_used]);

    outFile = [dataFolder '\'];

    if(useGPU)
        imgageGPU = zeros([imgSz N],'gpuArray');
    else
        imgageGPU = zeros([imgSz N]);
    end

    for i = 1:N
        barI = floor(maxBarHeight*x(:,i)); %loss of information due to convertion to Integer :(
        k = 1;
        %upside down images will be created
        for j = gap+1:gap+px:imgSz(2)-gap 
           imgageGPU(px:barI(k),j:j+px-1,i) = 1; 

           k = k+1;
           if(k>d) 
                break;
           end
        end

        errFrom = 0;
        %if error happens for large data file then errFrom is used for 
        %the ID of the Last correctly converted image. Default is 0.

        imgFile = [outFile int2str(y(i)) '/img' int2str(i+errFrom)];           
%             imshow(imgI);

        imwrite(gather(imgageGPU(:,:,i)),[imgFile '.png'],'Mode','lossless'); %saves image        
        waitbar(i/N,f,sprintf('Processing (%s): %g/%g',file_used,i,N));
    end
    delete(f)
end

end