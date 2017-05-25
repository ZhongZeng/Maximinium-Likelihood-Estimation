function [theta1,lt,sig,con,p] = ...
    mainmle(datas,x0,alph,theta0)
% Financial Econometrics II Homework III
% x0=[0.10 0.45 0.01 0.30 0.60];alph=0.95;theta0=[0.15 0.5 0.02 0.35 0.63];
% Input: xn is the xi sample vector;
% x0  is the initial guess of theta;
% alph is confidence level;
% theta0 (row vector) is null hypothesis;
% Output: theta is MLE theta, lt is L(theta);
% con is confidence level of alph of confidence level alph;
% p is p-value of hypothesis test theta=theta0.
rn=length(datas);

[theta1,lt,exitflag,output,grad,hessian] = fminunc(@(theta)-logfun(datas,theta),...
    x0,optimset('MaxFunEvals',1e4));
% syms theta;sigs(theta)=-(diff(logfun(xn,theta),theta,2)/length(xn))^(-1);

sig=sqrt(diag((hessian*rn)^(-1)));

con=[theta1'-sig.*norminv(0.5+alph/2,0,sig),...
    theta1'+sig.*norminv(0.5+alph/2,0,sig)];
p=2*(1 - normcdf(abs(theta1-theta0),0,sig') );
end