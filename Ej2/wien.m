clear all
close all
c1=sym('c1');
c3=sym('c3');
r1=sym('r1');
r2=sym('r2');
r3=sym('r3');
r4=sym('r4');
dr=sym('dr');
s=sym('s');
f=sym('f');
ff=sym('ff');

z1=(1/( c1* s))+ r1;
z2=r2;
z3=1/(( c3* s)+(1/r3));
z4=r4;

vd=((z3*z2)-(z1*z4))/((z1+z3)*(z2+z4));

s=2*pi*f*1j;
f=1/(2*pi*sqrt(r1*r3) *c1);

vdr3=simplify(diff(abs(subs(vd)),r3));
r2=20e3;
r4=10e3;
c1=15e-9;
vde=subs(vdr3);
c3=15e-9;
vde=subs(vde);

deltar=500; 
r3=1/(2*pi*ff* c1);
r1=r3 + deltar;
sr3=subs(vde)*(deltar/r3);
c1=15e-9;
sr3=subs(sr3);
% f=1/(2*pi*sqrt(r3*r3) * c1);

 

%frec=[2.122e3:100:21.22e3];
frec=[500:10:5e3];
data=subs(sr3, ff, frec);
%data=simplify(data)
plot(frec,data);
%subs(subs(dvdr1), r1, [1500:250:26.5e3]);


