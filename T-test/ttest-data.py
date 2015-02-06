#coding: utf-8

data_list = ["GPCR", "E", "IC", "NR"]
method_list = ["BLM", "PKM", "LapRLS", "NetLapRLS", "GIP", "KBMF2K", "CMF", "TMF", "MSCMF", "MSTMF", "MSTMF_WEIGHT" ]

for data in data_list:
	for method in method_list:
		# filter some unnecessary methods
		if data == "GPCR" and method == "MSTMF_WEIGHT":
			continue
		if data == "E" and method == "MSTMF":
			continue
		if data == "IC" and method == "MSTMF_WEIGHT":
			continue
		if data == "NR" and method == "MSTMF":
			continue

		# choose the best file
		if data == "GPCR":
			fbest = open("best/MSTMF_WEIGHT_GPCR.csv","r")
		if data == "E":
			fbest = open("best/MSTMF_E.csv","r")
		if data == "IC":
			fbest = open("best/MSTMF_WEIGHT_IC.csv","r")
		if data == "NR":
			fbest = open("best/MSTMF_NR.csv","r")

		# choose other file
		fother = open("other/"+method+"_"+data+".csv","r")

		lBest = []
		lOther = []

		sBest = ""
		sOther = ""

		# read from best file
		for i in fbest:
			i = i.strip("\n")
			i = i.split(",")
			if(len(lBest)==50):
					break
			if i[0] != "aupr":
				lBest.append(i[0])
		sBest = ','.join(lBest) + '\n'

		# read from other file
		if method == "MSTMF" or method == "MSTMF_WEIGHT" or method == "CMF" or method == "TMF" or method == "MSCMF" :
			for i in fother:
				i = i.strip("\n")
				i = i.split(",")
				if(len(lOther)==50):
					break
				if(i[0] != "aupr"):
					lOther.append(i[0])
			sOther = ','.join(lOther) + '\n'
		else:
			tmpList = fother.readlines()
			for i in range(len(tmpList)):
				tmpList[i].strip('\n')
			sOther = ','.join(tmpList)
			tmpList = sOther.split(",")
			for x in tmpList:
				x = x[:6]
				lOther.append(x)
			sOther = ','.join(lOther) + '\n'


		# best method in the first line 
		fw = open(data+"_"+method+".txt","w")
		fw.writelines(sBest)
		fw.writelines(sOther)

		fbest.close()
		fother.close()
		fw.close()