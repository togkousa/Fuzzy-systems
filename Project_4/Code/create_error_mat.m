function error_mat = create_error_mat(D_chk, predout)
%% Creating error matrix for every model
error_mat = zeros(max(D_chk(:,end)));
[m,~] = size(error_mat);

for i =1:m
    for j =1:m
        error_mat(i,j) = sum((predout == i) .* (D_chk(:,end) == j));
    end
end

end