for i=1:200
    for j=1:9
        str='C:\Users\Tiruchi\Desktop\Projects\FEI\';
        si=int2str(i);
        sj=int2str(j);
        str=strcat(str,si);
        str=strcat(str,'-0');
        str=strcat(str,sj);
        str=strcat(str,'.jpg');
        im=imread(str);
        im=imresize(im,[28,28]);
        imwrite(im,str);
    end
end
        
        
