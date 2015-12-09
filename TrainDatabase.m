function T = TrainDatabase(TrainDatabasePath,i)
 
%no_images=size(dir([TrainDatabasePath,'\*']),1)-size(dir([TrainDatabasePath,'\*m']),1)-2;
T = [];
disp('Loading Faces');
 
    for j=1:7
    c=int2str(i);
    sj=int2str(2*j-1);
     str = strcat(TrainDatabasePath,'\');
   % stk = int2str(2*i-1);
    str=strcat(str,c,'-');
    if((2*j-1)<10)
       str = strcat(str,'0',sj);
       str = strcat(str,'.jpg');
    end
    if((2*j-1)>=10)
        str = strcat(str,sj);
       str = strcat(str,'.jpg');
    end
       
    %folder_content = dir ([TrainDatabasePath,stk]);
    %nface = size (folder_content,1);
    img = imread(str);
    img = rgb2gray(img);
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn                    
end

  %{ 
    disp(nface);
   for j = 1 :  nface
     I have chosen the name of each image in databases as a corresponding
     number. However, it is not mandatory!
    str = int2str(j);
    str = strcat('\',str,'.jpg');
    str = strcat('\s',int2str(i),str);
    str = strcat(TrainDatabasePath,str);
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);    Reshaping 2D images into 1D image vectors
    T = [T temp];  'T' grows after each turn                    
   end
%}
end

