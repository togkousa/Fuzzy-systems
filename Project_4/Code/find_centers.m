function num_centers = find_centers(data,randii_values)
%% Finding the suitable randii values

num_centers = zeros(length(randii_values),1);

for i=1:length(randii_values)
    centers = subclust(data, randii_values(i));
    [m,~] = size(centers);
    num_centers(i) = m;
end



end