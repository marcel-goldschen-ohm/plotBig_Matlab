function rw002_validation_of_standard_cases()
%
%   big_plot_tests.reduce_width.rw002_validation_of_standard_cases
%
%   Tests
%   -----
%   - full array parsing only (not subsets)
%   - all data types
%   - reasonable lengths to encounter edge cases in the code
%   - still need to cover:
%       - the non-mex code
%       - subsets

data_types = {'double','single','uint32','uint16','uint8','int32','int16','int8'};

data_lengths = [0:100 200 400 800 1200];


for i = 1:length(data_types)
    
    cur_data_type = data_types{i};
    fprintf('Processing %s\n',cur_data_type);
    fh = str2func(cur_data_type);
    for j = 1:length(data_lengths)
        cur_length = data_lengths(j);
        for c = 1:cur_length+1
            for k = 1:2
                if k == 1
                    y = 1:cur_length;
                else
                    y = cur_length:-1:1;
                end
                y = fh(y');
                [min_max_data,type] = big_plot.reduceToWidth_mex(y,c);
                h__manualVerification(y,min_max_data,c)
            end
        end
    end
end

end

function h__manualVerification(y1,y2,c)
%
%   y1 - input
%   y2 - output

if isempty(y1)
    if isempty(y2)
        %good
    else
        error('Output empty for empty input')
    end
    return
end

n_chunks = floor(length(y1)/c);
extra_samples = length(y1) - n_chunks*c;
n_samples_out = 2*n_chunks;
if extra_samples
    n_samples_out = n_samples_out + 2;
end

y3 = zeros(n_samples_out,1);

end_I = 0;

I = 0;
for i = 1:n_chunks
    start_I = end_I + 1;
    end_I = start_I + c - 1;
    min_val = y1(start_I);
    max_val = y1(start_I);
    for j = start_I+1:end_I
        if y1(j) > max_val
            max_val = y1(j);
        elseif y1(j) < min_val
            min_val = y1(j);
        end
    end
    I = I + 1;
    y3(I) = min_val;
    I = I + 1;
    y3(I) = max_val;
end

if extra_samples
    start_I = length(y1) - extra_samples + 1;
    end_I = length(y1);
    min_val = y1(start_I);
    max_val = y1(start_I);
    for j = start_I+1:end_I
        if y1(j) > max_val
            max_val = y1(j);
        elseif y1(j) < min_val
            min_val = y1(j);
        end
    end
    I = I + 1;
    y3(I) = min_val;
    I = I + 1;
    y3(I) = max_val;
end

if ~isequal(y2,y3)
    error('Mismatch in values')
end


end