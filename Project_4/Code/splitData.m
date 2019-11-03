function [D_trn, D_val, D_chk] = splitData(data)
%% The output consists of 12 classes

% Create struct
data_struct = [];
data_struct.data1 = [];
data_struct.data2 = [];
data_struct.data3 = [];
data_struct.data4 = [];
data_struct.data5 = [];
data_struct.data6 = [];
data_struct.data7 = [];
data_struct.data8 = [];
data_struct.data9 = [];
data_struct.data10 = [];
data_struct.data11 = [];
data_struct.data12 = [];

% Initialize sets
D_trn = [];
D_val = [];
D_chk = [];

% Split data into sets
fn = fieldnames(data_struct);
for i = 1:12
    data_struct.(fn{i}) = data(data(:,end) == i , :);
    data_struct.(fn{i}) = data_struct.(fn{i})(randperm(size(data_struct.(fn{i}), 1)), :);
    [m,~] = size(data_struct.(fn{i}));

    % Setting training, validation and test set
    N1 = floor(0.6*m);
    N2 = floor(0.8*m);
    D_trn = [D_trn; data_struct.(fn{i})(1:N1,:)];
    D_val = [D_val; data_struct.(fn{i})((N1+1):N2, :)];
    D_chk = [D_chk; data_struct.(fn{i})((N2+1):end, :)];
end


end