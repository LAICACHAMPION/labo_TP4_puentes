r3=1000;
c1=3e-9;
f=20e3;

v=r3./((r1+r3+(1/(1i *2*pi *f *c1))).^2);
v2=(((r1.*r4)/r3)+(1./(2*pi*1i*f*c1*(r3./r4))))./(((((r1.*r4)/r3)+(1./(2*pi*1i*f*c1*(r3./r4))))+r4).^2);

[r1,r4]=meshgrid(79.5:5:477,30:5:300);
%surf(r1,r4,abs(v./v2));
surf(r1,r4,abs(v));
shading interp;
