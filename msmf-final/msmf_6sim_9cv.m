function [ aupr,auc ] = msmf_6sim_9cv( Y, a, Sd, Sp, Satc, Sgomf, Sgobp, Sppi, ...
    drugOrTarget, s, e, s_9cv, e_9cv, dim, iter, learn_rate, lambda, sizet, sized)
tic

b=a(s:e)+1;
b_9cv = a(s_9cv:e_9cv)+1;

R=Y;
T=Y;
if drugOrTarget == 'd'
    R(:,b)=0;
    T(:,b)=-1;
    R(:,b_9cv)=0;
    T(:,b_9cv)=-1;
elseif drugOrTarget == 't'
    R(b,:)=0;
    T(b,:)=-1;
    R(b_9cv,:)=0;
    T(b_9cv,:)=-1;
else
    R(b)=0;
    T(b)=-1;
    R(b_9cv)=0;
    T(b_9cv)=-1;
end
T(T==0)=1;
T(T==-1)=0;

Tatc = Satc;
Tatc(Tatc>=0)=1;
Tatc(Tatc<0)=0;

Tgomf = Sgomf;
Tgomf(Tgomf>=0)=1;
Tgomf(Tgomf<0)=0;

Tgobp = Sgobp;
Tgobp(Tgobp>=0)=1;
Tgobp(Tgobp<0)=0;

Tppi = Sppi;
Tppi(Tppi>=0)=1;
Tppi(Tppi<0)=0;

P = normrnd(0,0.01,sizet,dim);
Q = normrnd(0,0.01,sized,dim);

Wt = normrnd(0,0.01,sizet,dim);
Wgomf = normrnd(0,0.01,sizet,dim);
Wgobp = normrnd(0,0.01,sizet,dim);
Wppi = normrnd(0,0.01,sizet,dim);

Wd = normrnd(0,0.01,sized,dim);
Watc = normrnd(0,0.01,sized,dim);

for it=1:iter;
    if mod(it, 1000) == 0
        fprintf(1, '...%5d\n', it);
    end
    %
    
    if drugOrTarget == 'd'
         SUM1 = (-1)*(T.*(R-P*Q'))*Q+lambda*P;
         P = P - learn_rate*(SUM1);
    else
        SUM1 = (-1)*(T.*(R-P*Q'))*Q+lambda*P;
        SUM2 = (-1)*(Sp-P*Wt')*Wt;
        SUM3 = (-1)*Tgomf.*(Sgomf-P*Wgomf')*Wgomf;
        SUM4 = (-1)*Tgobp.*(Sgobp-P*Wgobp')*Wgobp;
        SUM5 = (-1)*Tppi.*(Sppi-P*Wppi')*Wppi;
        Wt = Wt - learn_rate*((-1)*(Sp-P*Wt')'*P+lambda*Wt);
        Wgomf = Wgomf - learn_rate*((-1)*(Tgomf.*(Sgomf-P*Wgomf'))'*P+lambda*Wgomf);
        Wgobp = Wgobp - learn_rate*((-1)*(Tgobp.*(Sgobp-P*Wgobp'))'*P+lambda*Wgobp);
        Wppi = Wppi - learn_rate*((-1)*(Tppi.*(Sppi-P*Wppi'))'*P+lambda*Wppi);
        P = P - learn_rate*(SUM1+SUM2+SUM3+SUM4+SUM5);
    end
    
    if drugOrTarget == 't'
        SUM1 = (-1)*(T.*(R-P*Q'))'*P+lambda*Q;
        Q = Q - learn_rate*(SUM1);
    else
        SUM1 = (-1)*(T.*(R-P*Q'))'*P+lambda*Q;
        SUM2 = (-1)*(Sd-Q*Wd')*Wd;
        SUM3 = (-1)*Tatc.*(Satc-Q*Watc')*Watc; %
        Wd = Wd - learn_rate*((-1)*(Sd-Q*Wd')'*Q+lambda*Wd);
        Watc = Watc - learn_rate*((-1)*(Tatc.*(Satc-Q*Watc'))'*Q+lambda*Watc);
        Q = Q - learn_rate*(SUM1+SUM2+SUM3);
    end
    
end

%
F=P*Q';
if drugOrTarget == 'd'
    label=Y(:,b_9cv);
    score=F(:,b_9cv);
elseif drugOrTarget == 't'
    label=Y(b_9cv,:);
    score=F(b_9cv,:);
else 
    label=Y(b_9cv);
    score=F(b_9cv);
end

label=label(:);
score=score(:);

[~,~,~,auc] = perfcurve(label,score,1);
aupr = AUPR(score,label);
%[~,~,~,aupr] = perfcurve(label,score,1,'xCrit','TPR','yCrit','PPV');
toc

end

