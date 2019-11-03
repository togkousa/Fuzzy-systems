function [UA, PA, k] = other_error_metrics(ErrorMatrix, N)
%% Calculations

M = size(ErrorMatrix,1);
Xir = sum(ErrorMatrix, 2); % Sum of each row 
Xjc = sum(ErrorMatrix); % Sum of each column
PA = zeros(M,1);
UA = zeros(M,1);
for i=1:M
    PA(i) = ErrorMatrix(i,i) / Xjc(i);
    UA(i) = ErrorMatrix(i,i) / Xir(i);
end
k = (N* trace(ErrorMatrix) - sum(Xir .* Xjc)) / (N^2 - sum(Xir .* Xjc));


end