dataset = 'gpcr';
drugOrTargetArray = ['p'];

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
    dim_list = [256];
    iter_list = [600];
    learn_rate_list = [0.005];
    learn_rateA = 0.00005;
    learn_rateB = 0.00005;
    lambda_list = [0.0625,0.125,0.25,0.5,1,2,4,8];
    lambdaA = 32;
    lambdaB = 256;
    
    file = ['result/result_1times10fold_msmf_weight_4sim_effect_lambda_', dataset, '.txt'];
    fid = fopen(file,'a');
    fprintf(fid,'aupr,auc,dim,iter,learn_rate,learn_rateA,learn_rateB,lambda,lambdaA,lambdaB,A(1),A(2),B(1),B(2),drugOrTarget,elapsedTime\n');
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
                        t0 = clock;
                        for fold=1:10,
                            if fold~=10,
                                s = (fold-1)*block+1;
                                e = fold*block;
                            else
                                s = (fold-1)*block+1;
                                e = finalEnd;
                            end
                            
                            [aupr(time,fold),auc(time,fold),A,B] = msmf_weight_4sim(Y, data_split{time}, Sd, Sp, Satc, Sgomf, ...
                                    drugOrTarget, s, e, dim, iter, learn_rate, learn_rateA, learn_rateB, ...
                                    lambda, lambdaA, lambdaB, sizet, sized);
                        end
                        elapsedTime = etime(clock,t0);
                    end
                    avg_aupr = sum(aupr(:))/10;
                    avg_auc = sum(auc(:))/10;
                    fid = fopen(file,'a');
                    fprintf(fid,'%-0.4f,%-0.4f,%d,%d,%-0.4f,%-0.4f,%-0.4f,%-0.4f,%-0.4f,%-0.4f,',...
                            aupr(time,fold),auc(time,fold),dim,iter,learn_rate,learn_rateA,learn_rateB,lambda,lambdaA,lambdaB);
                    fprintf(fid,'A1:%-0.4f,A2:%-0.4f,B1:%-0.4f,B2:%-0.4f,%s,elapsedTime:%-0.4fs\n',...
                            A(1),A(2),B(1),B(2),drugOrTarget,elapsedTime);
                    fclose(fid);
                    %------------------------------
                end 
            end
        end
    end 
end
