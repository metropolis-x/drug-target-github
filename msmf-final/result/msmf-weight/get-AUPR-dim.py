data_list = ['gpcr', 'enzyme', 'ic', 'nr']

for data in data_list:
	fr = open('result_1times10fold_msmf_weight_4sim_effect_dim_' + data + '.txt','r');

	line = []

	for i in fr:
		i = i.strip('\n')
		i = i.split(',')
		if(i[0] == 'aupr'):
			continue
		line.append(i[0])

	auprStr = ','.join(line) + '\n'

	fw = open('mstmf_weight_dim_' + data + '.txt','a')
	fw.writelines(auprStr)
	fw.close()

	fr.close()