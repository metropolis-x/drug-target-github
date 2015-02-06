xLambda = [0.0625,0.1250,0.2500,0.5000,1.0000,2.0000,4.0000,8.0000];

yGPCR = [0.7871,0.7879,0.7934,0.7896,0.7875,0.7702,0.6904,0.4273];
plot(log2(xLambda),yGPCR,'bv-');
hold on;

yEnzyme = [0.9200,0.9206,0.9224,0.9260,0.9261,0.9170,0.8767,0.7832];
plot(log2(xLambda),yEnzyme,'r>-');
hold on;

yIC = [0.9456,0.9475,0.9468,0.9480,0.9477,0.9376,0.8856,0.7561];
plot(log2(xLambda),yIC,'g<-');
hold on;

yNR = [0.6057,0.6185,0.6166,0.6170,0.6154,0.5628,0.4140,0.2527];
plot(log2(xLambda),yNR,'y^-');
grid on;

set(gca,'fontsize',12);

mylegend = legend('GPCR','Enzyme','Ion channel', 'Nuclear receptor',0); 
set(mylegend,'fontsize',16);

handle_xlabel = xlabel('base-2 logarithm of \lambda'); 
set(handle_xlabel,'fontsize',16);

handle_ylabel = ylabel('AUPR'); 
set(handle_ylabel,'fontsize',16);

%title('The effect of parameter lambda');