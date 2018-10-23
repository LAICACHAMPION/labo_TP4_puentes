 clear all
 close all
% c1=sym('c1');
% r1=sym('r1');
% rx=sym('rx');
% cx=sym('cx');
% r3=sym('r3');
% r4=sym('r4');
% dr=sym('dr');
% f=sym('f');
% 
% z1=1/((1j * c1* 2 * pi * f)+(1/r1));
% z2=1/((1j * cx* 2 * pi * f)+(1/rx));
% z3=r3;
% z4=r4;
% 
% vd=((z3*z2)-(z1*z4))/((z1+z3)*(z2+z4));
% dvdr1=diff(abs(vd),r1)
[cx,dx]=meshgrid(10e-9:0.1e-9:100e-9,0.015:0.0001:0.09);
r3=1000;
f=10e3;
c1=150e-9;
r1=1./(2*pi.*c1*dx);
r4=(c1.*r3)./cx;
rx=1./(2*pi.*cx.*dx);
h=- (sign(r3 + 1./(1./r1 + pi*c1*f*2i)).*abs(r4./(1./r1 + pi*c1*f*2i) - r3./(1./rx + pi.*cx*f*2i)))./(r1.^2.*abs(r3 + 1./(1./r1 + c1*f*pi*2i)).^2.*abs(r4 + 1./(1./rx + pi.*cx*f*2i)).*(1./r1 + c1*f*pi*2i).^2) + (r4.*sign(r4./(1./r1 + pi*c1*f*2i) - r3./(1./rx + pi.*cx*f*2i)))./(r1.^2.*abs(r3 + 1./(1./r1 + pi*c1*f*2i)).*abs(r4 + 1./(1./rx + pi.*cx*f*2i)).*(1./r1 + c1*f*pi*2i).^2);

surf(cx,dx,abs(h));
shading interp;

