xLambda = [0.0625,0.1250,0.2500,0.5000,1.0000,2.0000,4.0000,8.0000];

yGPCR = [0.7759,0.7808,0.7797,0.7743,0.7561,0.7094,0.6167,0.4694];
plot(log2(xLambda),yGPCR,'bv-');
hold on;

yEnzyme = [0.9138,0.8989,0.9160,0.9145,0.9137,0.9025,0.8352,0.6890];
plot(log2(xLambda),yEnzyme,'r>-');
hold on;

yIC = [0.9556,0.9546,0.9550,0.9536,0.9475,0.9333,0.8720,0.7636];
plot(log2(xLambda),yIC,'g<-');
hold on;

yNR = [0.5250,0.5971,0.5862,0.5483,0.5859,0.6224,0.3566,0.2662];
plot(log2(xLambda),yNR,'y^-');
grid on;

set(gca,'fontsize',12);

mylegend = legend('GPCR','Enzyme','Ion channel','Nuclear receptor',0); 
set(mylegend,'fontsize',16);

handle_xlabel = xlabel('base-2 logarithm of \lambda'); 
set(handle_xlabel,'fontsize',16);

handle_ylabel = ylabel('AUPR'); 
set(handle_ylabel,'fontsize',16);

%title('The effect of parameter lambda');