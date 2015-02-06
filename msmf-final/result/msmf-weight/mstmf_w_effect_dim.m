xDim = [8,16,32,64,128,256,512,1024];

yGPCR = [0.5310,0.6802,0.7083,0.7353,0.7491,0.7595,0.7617,0.7604];
plot(log2(xDim),yGPCR,'bv-');
hold on;

yEnzyme = [0.6569,0.7695,0.8617,0.8991,0.9129,0.9116,0.9151,0.9165];
plot(log2(xDim),yEnzyme,'r>-');
hold on;

yIC = [0.8097,0.9002,0.9337,0.9402,0.9453,0.9478,0.9482,0.9491];
plot(log2(xDim),yIC,'g<-');
hold on;

yNR = [0.6502,0.5726,0.6257,0.5975,0.5457,0.5334,0.5326,0.5345];
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