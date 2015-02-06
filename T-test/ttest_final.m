data_list = {'GPCR', 'E', 'IC', 'NR'};
method_list = {'BLM', 'PKM', 'LapRLS', 'NetLapRLS', 'GIP', 'KBMF2K', 'CMF','MSCMF', 'TMF', 'MSTMF', 'MSTMF_WEIGHT'};
for data = data_list,
    for method = method_list,
        if (strcmp(data,'GPCR')==1 && strcmp(method,'MSTMF_WEIGHT')==1)
			continue;
        end
        if (strcmp(data,'E')==1 && strcmp(method,'MSTMF')==1)
			continue;
        end
        if (strcmp(data,'IC')==1 && strcmp(method,'MSTMF_WEIGHT')==1)
			continue;
        end
        if (strcmp(data,'NR')==1 && strcmp(method,'MSTMF')==1)
			continue;
        end
        
        AUPR = load([data{1}, '_', method{1}, '.txt']);
        Best = AUPR(1,:);
        Other = AUPR(2,:);
        [Other_H, Other_P] = ttest(Best, Other, 0.05, 'right');
        
        file = ['pvalue/', data{1}, '_PValue.txt'];
        fid = fopen(file,'a');
        fprintf(fid,[method{1}, '_PValue:%s\n'], Other_P);
        fclose(fid);
    end  
end
