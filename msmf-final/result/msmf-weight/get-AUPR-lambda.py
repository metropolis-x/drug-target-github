data_list = ['gpcr', 'enzyme', 'ic', 'nr']
lambda_type_list = ['lambda', 'lambdaA', 'lambdaB']

for data in data_list:
	for lambda_type in lambda_type_list:
		fr = open('result_1times10fold_msmf_weight_4sim_effect_' + lambda_type + '_' + data + '.txt','r');

		line = []

		for i in fr:
			i = i.strip('\n')
			i = i.split(',')
			if(i[0] == 'aupr'):
				continue
			line.append(i[0])

		auprStr = ','.join(line) + '\n'

		fw = open('mstmf_weight_' + lambda_type + '_' + data + '.txt','a')
		fw.writelines(auprStr)
		fw.close()

		fr.close()