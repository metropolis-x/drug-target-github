function [ aupr,auc ] = msmf_2sim( Y, a, Sd, Sp, ...
    drugOrTarget, s, e, dim, iter, learn_rate, lambda, sizet, sized)
tic

b=a(s:e)+1;

R=Y;
T=Y;
if drugOrTarget == 'd'
    R(:,b)=0;
    T(:,b)=-1;
elseif drugOrTarget == 't'
    R(b,:)=0;
    T(b,:)=-1;
else
    R(b)=0;
    T(b)=-1;
end
T(T==0)=1;
T(T==-1)=0;

P = normrnd(0,0.01,sizet,dim);
Q = normrnd(0,0.01,sized,dim);

Wt = normrnd(0,0.01,sizet,dim);
Wd = normrnd(0,0.01,sized,dim);

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
        Wt = Wt - learn_rate*((-1)*(Sp-P*Wt')'*P+lambda*Wt);
        P = P - learn_rate*(SUM1+SUM2);
    end
    
    if drugOrTarget == 't'
        SUM1 = (-1)*(T.*(R-P*Q'))'*P+lambda*Q;
        Q = Q - learn_rate*(SUM1);
    else
        SUM1 = (-1)*(T.*(R-P*Q'))'*P+lambda*Q;
        SUM2 = (-1)*(Sd-Q*Wd')*Wd;
        Wd = Wd - learn_rate*((-1)*(Sd-Q*Wd')'*Q+lambda*Wd);
        Q = Q - learn_rate*(SUM1+SUM2);
    end
    
end

%
F=P*Q';
if drugOrTarget == 'd'
    label=Y(:,b);
    score=F(:,b);
elseif drugOrTarget == 't'
    label=Y(b,:);
    score=F(b,:);
else 
    label=Y(b);
    score=F(b);
end

label=label(:);
score=score(:);

[~,~,~,auc] = perfcurve(label,score,1);
aupr = AUPR(score,label);
%[~,~,~,aupr] = perfcurve(label,score,1,'xCrit','TPR','yCrit','PPV');
toc

end

