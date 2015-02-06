function [Y,Sp,Sd,Sgomf,Sgobp,Sppi,Satc,data] = load_data_6sim(dataset,drugOrTarget)

if strcmp(dataset,'gpcr')
    Y = importdata('dataset-new/gpcr_inter_BIN.csv');
    Sp = importdata('dataset-new/gpcr_t_sim_GS.csv');
    Sd = importdata('dataset-new/gpcr_d_sim_CS.csv');
    Sgomf = importdata('dataset-new/gpcr_t_sim_GO-MF-Resnik.csv');
    Sgobp = importdata('dataset-new/gpcr_t_sim_GO-BP-Resnik.csv');
    Sppi = importdata('dataset-new/gpcr_t_sim_PPI.csv');
    Satc = importdata('dataset-new/gpcr_d_sim_ATC.csv');
    if drugOrTarget == 'd',
        data{1} = importdata('split/2_1_0.txt');
        data{2} = importdata('split/2_1_1.txt');
        data{3} = importdata('split/2_1_2.txt');
        data{4} = importdata('split/2_1_3.txt');
        data{5} = importdata('split/2_1_4.txt');
    elseif drugOrTarget == 't',
        data{1} = importdata('split/2_0_0.txt');
        data{2} = importdata('split/2_0_1.txt');
        data{3} = importdata('split/2_0_2.txt');
        data{4} = importdata('split/2_0_3.txt');
        data{5} = importdata('split/2_0_4.txt');
    else 
        data{1} = importdata('split/2_2_0.txt');
        data{2} = importdata('split/2_2_1.txt');
        data{3} = importdata('split/2_2_2.txt');
        data{4} = importdata('split/2_2_3.txt');
        data{5} = importdata('split/2_2_4.txt');
    end
elseif strcmp(dataset,'enzyme')
    Y = importdata('dataset-new/e_inter_BIN.csv');
    Sp = importdata('dataset-new/e_t_sim_GS.csv');
    Sd = importdata('dataset-new/e_d_sim_CS.csv');
    Sgomf = importdata('dataset-new/e_t_sim_GO-MF-Resnik.csv');
    Sgobp = importdata('dataset-new/e_t_sim_GO-BP-Resnik.csv');
    Sppi = importdata('dataset-new/e_t_sim_PPI.csv');
    Satc = importdata('dataset-new/e_d_sim_ATC.csv');
    if drugOrTarget == 'd',
        data{1} = importdata('split/0_1_0.txt');
        data{2} = importdata('split/0_1_1.txt');
        data{3} = importdata('split/0_1_2.txt');
        data{4} = importdata('split/0_1_3.txt');
        data{5} = importdata('split/0_1_4.txt');
    elseif drugOrTarget == 't',
        data{1} = importdata('split/0_0_0.txt');
        data{2} = importdata('split/0_0_1.txt');
        data{3} = importdata('split/0_0_2.txt');
        data{4} = importdata('split/0_0_3.txt');
        data{5} = importdata('split/0_0_4.txt');
    else 
        data{1} = importdata('split/0_2_0.txt');
        data{2} = importdata('split/0_2_1.txt');
        data{3} = importdata('split/0_2_2.txt');
        data{4} = importdata('split/0_2_3.txt');
        data{5} = importdata('split/0_2_4.txt');
    end
elseif strcmp(dataset,'ic')
    Y = importdata('dataset-new/ic_inter_BIN.csv');
    Sp = importdata('dataset-new/ic_t_sim_GS.csv');
    Sd = importdata('dataset-new/ic_d_sim_CS.csv');
    Sgomf = importdata('dataset-new/ic_t_sim_GO-MF-Resnik.csv');
    Sgobp = importdata('dataset-new/ic_t_sim_GO-BP-Resnik.csv');
    Sppi = importdata('dataset-new/ic_t_sim_PPI.csv');
    Satc = importdata('dataset-new/ic_d_sim_ATC.csv');
    if drugOrTarget == 'd',
        data{1} = importdata('split/1_1_0.txt');
        data{2} = importdata('split/1_1_1.txt');
        data{3} = importdata('split/1_1_2.txt');
        data{4} = importdata('split/1_1_3.txt');
        data{5} = importdata('split/1_1_4.txt');
    elseif drugOrTarget == 't',
        data{1} = importdata('split/1_0_0.txt');
        data{2} = importdata('split/1_0_1.txt');
        data{3} = importdata('split/1_0_2.txt');
        data{4} = importdata('split/1_0_3.txt');
        data{5} = importdata('split/1_0_4.txt');
    else 
        data{1} = importdata('split/1_2_0.txt');
        data{2} = importdata('split/1_2_1.txt');
        data{3} = importdata('split/1_2_2.txt');
        data{4} = importdata('split/1_2_3.txt');
        data{5} = importdata('split/1_2_4.txt');
    end
elseif strcmp(dataset,'nr')
    Y = importdata('dataset-new/nr_inter_BIN.csv');
    Sp = importdata('dataset-new/nr_t_sim_GS.csv');
    Sd = importdata('dataset-new/nr_d_sim_CS.csv');
    Sgomf = importdata('dataset-new/nr_t_sim_GO-MF-Resnik.csv');
    Sgobp = importdata('dataset-new/nr_t_sim_GO-BP-Resnik.csv');
    Sppi = importdata('dataset-new/nr_t_sim_PPI.csv');
    Satc = importdata('dataset-new/nr_d_sim_ATC.csv');
    if drugOrTarget == 'd',
        data{1} = importdata('split/3_1_0.txt');
        data{2} = importdata('split/3_1_1.txt');
        data{3} = importdata('split/3_1_2.txt');
        data{4} = importdata('split/3_1_3.txt');
        data{5} = importdata('split/3_1_4.txt');
    elseif drugOrTarget == 't',
        data{1} = importdata('split/3_0_0.txt');
        data{2} = importdata('split/3_0_1.txt');
        data{3} = importdata('split/3_0_2.txt');
        data{4} = importdata('split/3_0_3.txt');
        data{5} = importdata('split/3_0_4.txt');
    else 
        data{1} = importdata('split/3_2_0.txt');
        data{2} = importdata('split/3_2_1.txt');
        data{3} = importdata('split/3_2_2.txt');
        data{4} = importdata('split/3_2_3.txt');
        data{5} = importdata('split/3_2_4.txt');
    end
elseif strcmp(dataset,'db')
    Y = importdata('dataset-new/db_inter_BIN.csv');
    Sp = importdata('dataset-new/db_t_sim_GS.csv');
    Sd = importdata('dataset-new/db_d_sim_CS.csv');
    Sgomf = importdata('dataset-new/db_t_sim_GO-MF-Resnik.csv');
    Sgobp = importdata('dataset-new/db_t_sim_GO-BP-Resnik.csv');
    Sppi = importdata('dataset-new/db_t_sim_PPI.csv');
    Satc = importdata('dataset-new/db_d_sim_ATC.csv');
    if drugOrTarget == 'd',
        data = cell(10,1);
        for i=1:10
            num = int2str(i-1);
            file = ['split/db_d_',num,'.csv'];
            data{i} = importdata(file);
        end
    elseif drugOrTarget == 't',
        data = cell(10,1);
        for i=1:10
            num = int2str(i-1);
            file = ['split/db_t_',num,'.csv'];
            data{i} = importdata(file);
        end
    else 
        data = cell(10,1);
        for i=1:10
            num = int2str(i-1);
            file = ['split/db_p_',num,'.csv'];
            data{i} = importdata(file);
        end
    end
end

end