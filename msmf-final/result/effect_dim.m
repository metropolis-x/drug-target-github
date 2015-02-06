xDim = [8,16,32,64,128,256,512,1024];

yGPCR = [0.4917,0.6968,0.7479,0.7527,0.7740,0.7875,0.7897,0.7930];
plot(log2(xDim),yGPCR,'bv-');
hold on;

yEnzyme = [0.5050,0.7308,0.8375,0.8915,0.9141,0.9214,0.9243,0.9250];
plot(log2(xDim),yEnzyme,'r>-');
hold on;

yIC = [0.7544,0.8690,0.9251,0.9378,0.9390,0.9445,0.9457,0.9458];
plot(log2(xDim),yIC,'g<-');
hold on;

yNR = [0.5729,0.5925,0.6150,0.5929,0.6089,0.6266,0.6136,0.6020];
plot(log2(xDim),yNR,'y^-');
grid on;

set(gca,'fontsize',12);

mylegend = legend('GPCR','Enzyme','Ion channel', 'Nuclear receptor', 0); 
set(mylegend,'fontsize',16);

handle_xlabel = xlabel('base-2 logarithm of dimension'); 
set(handle_xlabel,'fontsize',16);

handle_ylabel = ylabel('AUPR'); 
set(handle_ylabel,'fontsize',16);

%title('The effect of factorized dimension');