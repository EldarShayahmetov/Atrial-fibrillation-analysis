%% Create and save input results data into txt file in choosen direction
% data = data to save
% disc = discription of data


function SaveResults(data, disc)

for i =1:length(data)
    res{i} = strcat(disc{i},' = ',num2str(data(i)));
end

for i = 1:length(res)
        str{i}=char(res{i});
end

[FileName, PathName, FilterIndex] = uiputfile('*.txt', 'Save as:');
if ~ischar(FileName)
  disp('User aborted the dialog');
  return;
end
File = fullfile(PathName, FileName);

    CellArray = strcat(str); 
    fid = fopen(File,'w');
    for r=1:size(CellArray,1)
        fprintf(fid,'%s\n',CellArray{r,:});
    end
    fclose(fid);
end