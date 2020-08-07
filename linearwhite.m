X=W1B.E(1:8);
Y=W1B.V(1:8);
X1=[ones(size(X)) X];
plot(X,Y,'k*','MarkerSize',12);
k=1;
for i=1:8
str=W1B.N(i);
if i==1
    text(X(i)-0.4,Y(i)-0.2*k,str);
else
    text(X(i)-0.2,Y(i)-0.3*k,str);
end 
    k=-k;
end
hold on
[p,S]=polyfit(X,Y,1);
[b,bint,r,rint,stats] = regress(Y,X1);
x1=linspace(17174,max(X));  
y1=polyval(p,x1);  
y2=b(2,1)*x1+b(1,1)*ones([1,100]);
plot(x1,y2,'r');
xlabel('Energy(eV)')
ylabel('Oxidation state(v.u.)')
t=1;
for i=1:8
    xbr=W1.E(10+i);
    ybr=b(2,1)*xbr+b(1,1);
    Xbr(i)=xbr;
    Ybr(i)=ybr;
    str={num2str(i+16)};
    hold on
    plot(xbr,ybr,'bd');
    text(xbr,ybr-0.1*t,str,'FontSize',8);
%     if (i==1)||(i==12)
%       text(xbr-0.2,ybr-0.15*t,str,'FontSize',8);
%     else
%     text(xbr-0.1,ybr+0.1*t,str,'FontSize',8);
%     end
    t=-t;
end