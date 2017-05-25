function f = logfun( datas,theta)
% This is AR(k)-GARCH(p,q)
% datas-simulated column data
% theta is a vector of parameters to be estimated
yt=datas(2,1)-theta(2)*datas(1,1)-theta(1);% initialize yt
sig0=(lagmatrix(datas,1)-theta(2).*datas-theta(1)).^2;
sig2=mean(sig0(2:end));% initialize sigma^2
f=0; % initialize loglikelihood
for i=3:length(datas)
    sig2=theta(3)+theta(4)*sig2+theta(5)*yt^2;
    sig=sqrt(sig2);
    yt=datas(i,1)-theta(2)*datas(i-1,1)-theta(1);
    
    f=f-(yt^2/2/sig2+log(sqrt(2*pi())*sig));
end
f=f/length(datas);
end