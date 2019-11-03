function error_mat = cv_5fold(randii_values, nf, D_trn, ranks)
%% Search for the optimum values of nf and nr

error_mat = zeros(length(nf), length(randii_values));

for i = 1:length(nf)
    
    train_data = D_trn(:,ranks(1:nf(i)));  
%     centers = find_centers(train_data(:,1:end-1),randii_values);
%     randii = match_randii_vals(centers, nr, randii_values);
%     
    for j = 1:length(randii_values)
        
        cv = cvpartition(size(D_trn,1),'kfold',5);
        
        fismat = genfis2(train_data, D_trn(:,end), randii_values(j));
        
        for u = 1:size(fismat.output(1).mf,2)
            fismat.output(1).mf(u).type = 'constant' ;
            fismat.output(1).mf(u).params= 2.5;
        end
        opt = anfisOptions('InitialFIS', fismat);
        opt.DisplayANFISInformation = 0;
        opt.DisplayErrorValues = 0;
        opt.DisplayStepSize = 0;
        opt.DisplayFinalResults = 0;

        error = 0;
        parfor k = 1:5
            Dtrn = [train_data(training(cv,k),:) D_trn(training(cv,k),end)];
            Dval = [train_data(test(cv,k),:) D_trn(test(cv,k),end)];
            [~,~,~,~,chkerror] = anfis(Dtrn,fismat,100,[0 0 0 0],Dval);
            error = error + min(chkerror) / 5 ;
        end
        error_mat(i,j) = error;
    end
end


end