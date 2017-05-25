function datas = simdat(ar,ac,arch,gar,gc,nob)
% ar=0.5;ac=0.15;arch=0.35;gar=0.63;gc=0.02; nob=1e2;
% simulate nob data points from AR(1)-GARCH(1,1)
% ar,ac- AR coefficient,AR constant
% ar,gar,gc-coefficient ARCH,GARCH,constant in GARCH
garchmdl=garch('Constant',gc,'GARCH',gar,'ARCH',arch,'Offset',0);
mdl=arima('Constant',ac,'AR',ar,'Variance',garchmdl);
datas=simulate(mdl,nob);
% estimating using built-in function
% Mdl = arima('ARLags',1,'Variance',garch(1,1));
% est = estimate(Mdl,datas);

end