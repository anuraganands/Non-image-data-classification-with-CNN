%% Non-image to image transformation - Algorithm 3/3
% 
% Copyright (c) 2019, Anuraganand Sharma - All rights reserved.
% 
% This Matlab code is the implementation of the combination of Normalized Distance Matrix and 
% Equidistant Bar Graph algorithm  proposed by Anuraganand Sharma in the preprints:
% version 1: A. Sharma and D. Kumar, Non-image Data Classification with Convolutional Neural Networks. 
% version 2: A. Sharma and D. Kumar, Classification with 2-D Convolutional Neural Networks for breast cancer diagnosis.
%
% The algoirhtm reads data given in 2D form and converts them into 2D images. Currently, it works for non-time series data only.
%%
function data2imgX3
% This function converts input text data to 2D matrix and histogram. 

clear all;
clc;    
close all;

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
    dataFolder = [dirExp '\Alg3_' file_used];    
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

    outFile = [dataFolder '\'];

    px = 1; %pixcel or column width.
    gap = 0; %gap between two columns
    expand = [(px+gap) (px+gap)]; 
    expand = ones(expand);
    eImg = cell(d,d);

    imgSz =  [(px*d+gap*(d)) (px*d+gap*(d))]; %[Row Col]   imgSz = [2*px*(2*d+1) px*(2*d+1)]; %[Row Col]
    maxBarHeight = imgSz(1)- 2*px; %leave some space (padding) for bottom and up.

    f = waitbar(0,'...','Name',['Processing images for ' file_used]); 

    for i = 1:N
        in = x(:,i);
        M = zeros(d,d);

        %Level - 1
        for r = 1:d
            for c = 1:d
                M(r,c)= in(r)-in(c);                
            end
        end

        imgI=norm_scale01(M);
        %Expand Section
        for r = 1:d
            for c = 1:d
                eImg{r,c} = expand.*imgI(r,c);
            end
        end          
        imgI = cell2mat(eImg);            

        %Level - 2 (from Option - 1)
        M = zeros(imgSz);
        barI = floor(maxBarHeight*x(:,i)); %loss of information due to convertion to Integer :(
        k = 1;
        %upside down images will be created
        for j = gap+1:gap+px:imgSz(2)-gap 
           M(px:barI(k),j:j+px-1)=1;
           k = k+1;
           if(k>d)
                break;
           end
        end

        tmp=norm_scale01(M);
        imgI(:,:,2) = tmp;

        %Level - 3
        for r = 1:d
            for c = 1:d
                M(r,c)= in(r);                
            end
        end

        tmp=norm_scale01(M);
        for r = 1:d
            for c = 1:d
                eImg{r,c} = expand.*tmp(r,c);
            end
        end

        tmp = cell2mat(eImg);
        imgI(:,:,3) = tmp;


        imgFile = [outFile int2str(y(i)) '/img' int2str(i)];
%             imshow(imgI);
        imwrite(imgI,[imgFile '.png']); %saves image

        waitbar(i/N,f,sprintf('Processing (%s): %g/%g',file_used,i,N));
    end
    delete(f); 
end

end