% c1=sym('c1');
% c3=sym('c3');
% r1=sym('r1');
% r2=sym('r2');
% r3=sym('r3');
% r4=sym('r4');
% dr=sym('dr');
% f=sym('f');
% z1=(1/(1j * c1* 2 * pi * f))+ r1;
% z2=r2;
% z3=1/((1j * c3* 2 * pi * f)+(1/r3));
% z4=r4;
% vd=((z3*z2) - (z1*z4))/((z1+z3)*(z2+z4));
% 
% r2=20e3;
% r4=10e3;
% c1=820e-12;
% c3=820e-12;
% r1=r3;
% vde=abs(subs(vd));
r3=[1941:100:19409];
f=[10e3:100:100e3];
 [r3,f]=meshgrid(r3,f);
F=abs(- 10000.*r3 + 20000./((pi.*f*7930553376671967i)./4835703278458516698824704 + 1./r3) + 48357032784585166988247040000i./(7930553376671967.*f*pi))./(30000.*abs(r3 + 1./((pi.*f*7930553376671967i)./4835703278458516698824704 + 1./r3) - 4835703278458516698824704i./(7930553376671967.*f*pi)));
surf(r3,f,F);
shading interp;