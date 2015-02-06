function [ aupr,auc,Alpha,Beta ] = msmf_weight_4sim( Y, a, Sd, Sp, Satc, Sgomf, ...
    drugOrTarget, s, e, dim, iter, learn_rate, learn_rateA, learn_rateB, lambda, lambdaA, lambdaB, sizet, sized)
tic
%
% sgd to learn weights 
%

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

Alpha = [0.5;0.5];
Beta = [0.5;0.5];

for it=1:iter;
    if mod(it, 1000) == 0
        fprintf(1, '...%5d\n', it);
    end
    %
    if drugOrTarget == 'd'
        SUM1 = (-1)*(T.*T.*R)*Q+(T.*T.*(P*Q'))*Q+lambda*P;
        P = P - learn_rate*(SUM1);
    else
        SUM1 = (-1)*(T.*T.*R)*Q+(T.*T.*(P*Q'))*Q+lambda*P;
        SUM2 = (-1)*Alpha(1)*Sp*Wt+(-1)*Alpha(2)*Sgomf*Wt+(P*Wt')*Wt;
        SumA = (Alpha(1)*(Sp-Sgomf)+Sgomf-P*Wt').*(Sp-Sgomf);
        Alpha(1) = Alpha(1) - learn_rateA*(sum(SumA(:))+lambdaA*Alpha(1));
        if mod(it, 100) == 0
            fprintf(1, 'Alpha1...%-0.4f\n',Alpha(1));
        end
        Alpha(2) = 1 - Alpha(1);  
        Wt = Wt - learn_rate*((-1)*(Alpha(1)*Sp+Alpha(2)*Sgomf)'*P+(P*Wt')'*P+lambda*Wt);
        P = P - learn_rate*(SUM1+SUM2);
    end
    
    if drugOrTarget == 't'
        SUM1 = (-1)*(T.*T.*R)'*P+(T.*T.*(P*Q'))'*P+lambda*Q;
        Q = Q - learn_rate*(SUM1);
    else
        SUM1 = (-1)*(T.*(R-P*Q'))'*P+lambda*Q;
        SUM2 = (-1)*(Beta(1)*Sd+Beta(2)*Satc-Q*Wd')*Wd;
        SumB = (Beta(1)*Sd+Beta(2)*Satc-Q*Wd').*(Sd-Satc);
        Beta(1) = Beta(1) - learn_rateB*(sum(SumB(:))+lambdaB*Beta(1));
        if mod(it, 100) == 0
            fprintf(1, 'Beta1...%-0.4f\n',Beta(1));
        end
        Beta(2) = 1 - Beta(1);
        Wd = Wd - learn_rate*((-1)*(Beta(1)*Sd+Beta(2)*Satc-Q*Wd')'*Q+lambda*Wd);
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

toc

end