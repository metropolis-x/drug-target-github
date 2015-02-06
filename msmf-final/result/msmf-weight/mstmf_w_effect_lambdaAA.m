xLambda = [1,2,4,8,16,32,64,128,256,512,1024];

yGPCR = [0.7553,0.7558,0.7540,0.7542,0.7548,0.7549,0.7582,0.7572,0.7537,0.7543,0.7473];
plot(log2(xLambda),yGPCR,'bv-');
hold on;

yEnzyme = [0.9150,0.9137,0.9125,0.9145,0.9139,0.9132,0.9150,0.9143,0.9124,0.9124,0.9141];
plot(log2(xLambda),yEnzyme,'r>-');
hold on;

yIC = [0.9468,0.9465,0.9462,0.9459,0.9457,0.9465,0.9465,0.9473,0.9474,0.9482,0.9471];
plot(log2(xLambda),yIC,'g<-');
hold on;

yNR = [0.5953,0.5840,0.5863,0.5944,0.5843,0.5864,0.5684,0.5019,0.4953,0.5725,0.5739];
plot(log2(xLambda),yNR,'y^-');
grid on;

set(gca,'fontsize',12);

mylegend = legend('GPCR','Enzyme','Ion channel','Nuclear receptor',0); 
set(mylegend,'fontsize',16);

handle_xlabel = xlabel('base-2 logarithm of \lambda_{\it^\alpha}'); 
set(handle_xlabel,'fontsize',16);

handle_ylabel = ylabel('AUPR'); 
set(handle_ylabel,'fontsize',16);

%title('The effect of parameter lambda');