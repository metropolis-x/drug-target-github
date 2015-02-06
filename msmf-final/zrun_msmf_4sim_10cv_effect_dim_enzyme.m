dataset = 'enzyme';
drugOrTargetArray = ['dtp'];

for drugOrTarget = drugOrTargetArray,
    
    [Y,Sp,Sd,Sgomf,Satc,data_split] = load_data_4sim(dataset,drugOrTarget);

    [sizet,sized] = size(Y);
    numY = numel(Y);

    if drugOrTarget == 'd',
        block = floor(sized/10);
        finalEnd = sized;
    elseif drugOrTarget == 't',
        block = floor(sizet/10);
        finalEnd = sizet;
    else
        block = floor(numY/10);
        finalEnd = numY;
    end
    
    % get parameters
    dim_list = [8,16,32,64,128,256,512,1024];
    iter_list = [600];
    learn_rate_list = [0.005];
    lambda_list = [0.0625];
    
    file = ['result/result_1times10fold_msmf_4sim_effect_dim_', dataset, '.txt'];
    fid = fopen(file,'a');
    fprintf(fid,'aupr, auc, dim, iter, learn_rate, lambda, drugTargetPair, Elapsed time(s)\n');
    fclose(fid);
    
    aupr = zeros(5,10);
    auc = zeros(5,10);
    for dim = dim_list,
        for iter = iter_list,
            for learn_rate = learn_rate_list,
                for lambda = lambda_list,
                    %------------------------------
                    % x-time-10-fold-cv
                    for time=1:1,
                        for fold=1:10,
                            if fold~=10,
                                s = (fold-1)*block+1;
                                e = fold*block;
                            else
                                s = (fold-1)*block+1;
                                e = finalEnd;
                            end
                            t0 = clock;
                            [aupr(time,fold),auc(time,fold)] = msmf_4sim( Y, data_split{time}, Sd, Sp, Satc, Sgomf, ...
                                drugOrTarget, s, e, dim, iter, learn_rate, lambda, sizet, sized);
                            elapsedTime = etime(clock,t0);
                            %fprintf(fid,'%-0.4f,%-0.4f,%d,%d,%-0.4f,%-0.4f,%s,%-0.4fs\n',aupr(time,fold),auc(time,fold),dim,iter,learn_rate,lambda,drugOrTarget,elapsedTime);
                        end
                    end
                    avg_aupr = sum(aupr(:))/10;
                    avg_auc = sum(auc(:))/10;
                    fid = fopen(file,'a');
                    fprintf(fid,'%-0.4f,%-0.4f,%d,%d,%-0.4f,%-0.4f,%s,%-0.4fs\n',avg_aupr,avg_auc,dim,iter,learn_rate,lambda,drugOrTarget,elapsedTime);
                    %fprintf(fid,'%-0.4f,%-0.4f\n',avg_aupr,avg_auc);
                    fclose(fid);
                    %------------------------------
                end 
            end
        end
    end 
end
