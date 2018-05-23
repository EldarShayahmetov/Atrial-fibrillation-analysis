%% Return massive of char results like discription = data
% disc = discription of data (string)
% data = result data (numeric massive)


function out=GetResults(data, disc)

for i =1:length(data)
    res{i} = strcat(disc{i},' = ',num2str(data(i)));
end

for i = 1:length(res)
        str{i}=char(res{i});
end
out = str;
end