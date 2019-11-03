function randii = match_randii_vals(num_centers, nr,randii_values)


randii = [];
for i = 1:length(nr)
    index = [];
    k = 0;
    
    while(isempty(index))
        index = find(num_centers == (nr(i)-k));
        k = k + 1;
    end
    
    randii = [randii randii_values(index(1))];
    
end
end