function ptl= spa(ar,ac,arch,gar,gc,nob,rpt,x0,alph)
% size/power analysis
% rpt=1e2;
theta0=[ac,ar,gc,gar,arch];
ptl=[0 0 0 0 0];
for i=1:rpt
    datas = simdat(ar,ac,arch,gar,gc,nob);
    try    
        [theta1,lt,sig,con,p] = mainmle(datas,x0,alph,theta0);
        ptl=ptl+p>alph;
    end    
end
ptl=ptl./rpt;
end