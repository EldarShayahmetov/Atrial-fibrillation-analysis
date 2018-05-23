%% Return ECG data with assigned duration
% to = duration of the ECG signal to cutt off ( to = 6000 by default)
% from = start point to load (from = 0 by default)
% signal = number of signal in data( signal = 1 by default)
% This function uses global var FN to save name of loaded file to use it...
% ... in future
% Example ECG = ImportData(0, 60000, 1)

function outputData = ImportData(from ,to, signal)
            global FN;
            
            switch nargin
                case 0
                    to = 6000;
                    from = 0;
                    signal = 1;
                case 1 
                    from = 0;
                    signal = 1;
                case 2
                    signal = 1;
            end
                    
                
                
                
            [FileName, PathName] = uigetfile('*.mat','Select the ECG record');
            File = fullfile(PathName, FileName);
            FN=FileName;
            if(~isempty(File))
                try
            outputData = load(File);
            outputData = outputData.val(signal,:);
            outputData = outputData(from:to);  
                catch
                   outputData = [];  
                 warning('ECG data not found!');
                end
            end
end