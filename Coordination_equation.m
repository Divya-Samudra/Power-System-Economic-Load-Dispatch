clc; clear;
%Program to calculate optimal load sharing between generators
%without considering transmission losses and
%neglecting generator limits
%Equations: Pgi=(lambda-bi)/(2ci);
%           lambda=(pd+sigma(bi/2ci)/sigma(1/2ci)
%Inputs
% Cost matrix of the form ai + biPgi + cipgi^2
cost=[150 25 0.1;
    180 30 0.15;
    200 20 0.125]
%Power demand
pd=100

%calculation of lambda
num=0;
den=0;
gen=size(cost,1);
for i=1:gen
    b(i)=cost(i,2);
    c(i)=cost(i,3);
    num=num+b(i)/(2*c(i)); %follow BODMAS
    den=den+1/(2*c(i));
end
lambda=(pd+num)/den;

%Power generation
pg=[];
for i=1:gen
   pg(i)=(lambda-b(i))/(2*c(i));
   %sprintf('Power generated by generator %.2f = %.2f',i,pg(i))
end
pg