function [aupr, pre, rec] = AUPR(score, label)

%[score index]= sort(score,'descend');
%label = label(index);
s = unique(score);
%s = score;
n = length(s);
pre = zeros(n+1,1);
rec = zeros(n+1,1);
s = sort(s,'descend');
aupr = 0;
for i=1:n
    a = label(score>=s(i));
    pre(i+1) = sum( a ) / length( a );
    rec(i+1) = sum( a ) / sum( label );
end
pre(1) = 1;
rec(1) = 0;

for i = 1:n
    aupr = aupr + ( rec(i+1) - rec(i) ) * ( pre(i+1) + pre(i) ) /2;
end