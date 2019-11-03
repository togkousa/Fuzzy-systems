function error_mat = cv_5fold(nr, nf, D_trn, ranks)
%% Search for the optimum values of nf and nr

error_mat = zeros(length(nf), length(nr));
opt = NaN(4,1); opt(4) = 0;

for i = 1:length(nf)
    train_data = D_trn(:,ranks(1:nf(i)));   
    for j = 1:length(nr)
        
        cv = cvpartition(size(D_trn,1),'kfold',5);
        fis = genfis3(train_data, D_trn(:,end), 'sugeno', nr(j), opt );
    
        error = 0;
        parfor k = 1:5
            Dtrn = [train_data(training(cv,k),:) D_trn(training(cv,k),end)];
            Dval = [train_data(test(cv,k),:) D_trn(test(cv,k),end)];
            [~,~,~,~,chkerror] = anfis(Dtrn,fis,100,[0 0 0 0],Dval);
            error = error + min(chkerror) / 5 ;
        end
        error_mat(i,j) = error;
    end
end


end