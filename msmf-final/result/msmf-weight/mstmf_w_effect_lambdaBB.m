xLambda = [1,2,4,8,16,32,64,128,256,512,1024];

yGPCR = [0.7596,0.7595,0.7586,0.7612,0.7584,0.7560,0.7541,0.7502,0.7481,0.7452,0.7449];
plot(log2(xLambda),yGPCR,'bv-');
hold on;

yEnzyme = [0.9131,0.9142,0.9159,0.9157,0.9163,0.9146,0.9133,0.9148,0.9118,0.9119,0.9129];
plot(log2(xLambda),yEnzyme,'r>-');
hold on;

yIC = [0.9456,0.9452,0.9463,0.9462,0.9465,0.9475,0.9479,0.9489,0.9486,0.9488,0.9491];
plot(log2(xLambda),yIC,'g<-');
hold on;

yNR = [0.5827,0.5812,0.5962,0.5813,0.5864,0.5640,0.5329,0.5344,0.5448,0.5418,0.5333];
plot(log2(xLambda),yNR,'y^-');
grid on;

set(gca,'fontsize',12);

mylegend = legend('GPCR','Enzyme','Ion channel','Nuclear receptor',0); 
set(mylegend,'fontsize',16);

handle_xlabel = xlabel('base-2 logarithm of \lambda_{\it^\beta}'); 
set(handle_xlabel,'fontsize',16);

handle_ylabel = ylabel('AUPR'); 
set(handle_ylabel,'fontsize',16);

%title('The effect of parameter lambda');