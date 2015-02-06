tmf_vs_cmf_gpcr = load('tmf_vs_cmf_gpcr.txt');
tmf_gpcr = tmf_vs_cmf_gpcr(1,1:50);
cmf_gpcr = tmf_vs_cmf_gpcr(2,1:50);
[zzz_tmf_vs_cmf_gpcr_h,zzz_tmf_vs_cmf_gpcr_pvalue] = ttest(tmf_gpcr, cmf_gpcr, 0.05, 'right');

tmf_vs_cmf_enzyme = load('tmf_vs_cmf_enzyme.txt');
tmf_enzyme = tmf_vs_cmf_enzyme(1,1:50);
cmf_enzyme = tmf_vs_cmf_enzyme(2,1:50);
[zzz_tmf_vs_cmf_enzyme_h,zzz_tmf_vs_cmf_enzyme_pvalue] = ttest(tmf_enzyme, cmf_enzyme, 0.05, 'right');

tmf_vs_cmf_ic = load('tmf_vs_cmf_ic.txt');
tmf_ic = tmf_vs_cmf_ic(1,1:50);
cmf_ic = tmf_vs_cmf_ic(2,1:50);
[zzz_tmf_vs_cmf_ic_h,zzz_tmf_vs_cmf_ic_pvalue] = ttest(tmf_ic, cmf_ic, 0.05, 'right');

tmf_vs_cmf_nr = load('tmf_vs_cmf_nr.txt');
tmf_nr = tmf_vs_cmf_nr(1,1:50);
cmf_nr = tmf_vs_cmf_nr(2,1:50);
[zzz_tmf_vs_cmf_nr_h,zzz_tmf_vs_cmf_nr_pvalue] = ttest(tmf_nr, cmf_nr, 0.05, 'right');

% -------------------------

mstmf_vs_mscmf_gpcr = load('mstmf_vs_mscmf_gpcr.txt');
mstmf_gpcr = mstmf_vs_mscmf_gpcr(1,1:50);
mscmf_gpcr = mstmf_vs_mscmf_gpcr(2,1:50);
[zzz_mstmf_vs_mscmf_gpcr_h,zzz_mstmf_vs_mscmf_gpcr_pvalue] = ttest(mstmf_gpcr, mscmf_gpcr, 0.05, 'right');

mstmf_vs_mscmf_enzyme = load('mstmf_vs_mscmf_enzyme.txt');
mstmf_enzyme = mstmf_vs_mscmf_enzyme(1,1:50);
mscmf_enzyme = mstmf_vs_mscmf_enzyme(2,1:50);
[zzz_mstmf_vs_mscmf_enzyme_h,zzz_mstmf_vs_mscmf_enzyme_pvalue] = ttest(mstmf_enzyme, mscmf_enzyme, 0.05, 'right');

mstmf_vs_mscmf_ic = load('mstmf_vs_mscmf_ic.txt');
mstmf_ic = mstmf_vs_mscmf_ic(1,1:50);
mscmf_ic = mstmf_vs_mscmf_ic(2,1:50);
[zzz_mstmf_vs_mscmf_ic_h,zzz_mstmf_vs_mscmf_ic_pvalue] = ttest(mstmf_ic, mscmf_ic, 0.05, 'right');

mstmf_vs_mscmf_nr = load('mstmf_vs_mscmf_nr.txt');
mstmf_nr = mstmf_vs_mscmf_nr(1,1:50);
mscmf_nr = mstmf_vs_mscmf_nr(2,1:50);
[zzz_mstmf_vs_mscmf_nr_h,zzz_mstmf_vs_mscmf_nr_pvalue] = ttest(mstmf_nr, mscmf_nr, 0.05, 'right');

%------------------------

mstmfw_vs_mscmf_gpcr = load('mstmfw_vs_mscmf_gpcr.txt');
mstmfw_gpcr = mstmfw_vs_mscmf_gpcr(1,1:50);
mscmf_gpcr = mstmfw_vs_mscmf_gpcr(2,1:50);
[zzz_mstmfw_vs_mscmf_gpcr_h,zzz_mstmfw_vs_mscmf_gpcr_pvalue] = ttest(mstmfw_gpcr, mscmf_gpcr, 0.05, 'right');

mstmfw_vs_mscmf_enzyme = load('mstmfw_vs_mscmf_enzyme.txt');
mstmfw_enzyme = mstmfw_vs_mscmf_enzyme(1,1:50);
mscmf_enzyme = mstmfw_vs_mscmf_enzyme(2,1:50);
[zzz_mstmfw_vs_mscmf_enzyme_h,zzz_mstmfw_vs_mscmf_enzyme_pvalue] = ttest(mstmfw_enzyme, mscmf_enzyme, 0.05, 'right');

mstmfw_vs_mscmf_ic = load('mstmfw_vs_mscmf_ic.txt');
mstmfw_ic = mstmfw_vs_mscmf_ic(1,1:50);
mscmf_ic = mstmfw_vs_mscmf_ic(2,1:50);
[zzz_mstmfw_vs_mscmf_ic_h,zzz_mstmfw_vs_mscmf_ic_pvalue] = ttest(mstmfw_ic, mscmf_ic, 0.05, 'right');

mstmfw_vs_mscmf_nr = load('mstmfw_vs_mscmf_nr.txt');
mstmfw_nr = mstmfw_vs_mscmf_nr(1,1:50);
mscmf_nr = mstmfw_vs_mscmf_nr(2,1:50);
[zzz_mstmfw_vs_mscmf_nr_h,zzz_mstmfw_vs_mscmf_nr_pvalue] = ttest(mstmfw_nr, mscmf_nr, 0.05, 'right');