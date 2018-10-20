r1 = 2.19e3; r2 = 145e3; r3 = 50; %valores medidos!
G = 1+r2/r1; %ganancia ideal (Ao infinito)


s = tf('s');
Ao = 10^(110/20); % de la hoja de datos: Ao=110dB
BWP = 16e6;
fp = BWP/Ao; 
wp = 2*pi*fp;
fpp = BWP/G; %fp prima
wpp = 2*pi*fpp;

%%% con un polo
Avol = Ao/(1+s/wp);
G = Avol*G/(G+Avol);
% opt = bodeoptions();
% opt.FreqUnits = 'Hz';
% bode(G, opt)
% 
%%%con dos polos
% syms w2;
% wo = sqrt((G+Ao)*wp*w2/G);
% w2 = eval(solve(wo == 120e3*2*pi,w2));
% Avol = Ao/(1+s/wp)/(1+s/w2);
% wo = eval(wo);
% xi = wo/2 * G/Ao/wp;
% G2P = Avol*G/(G+Avol);

%%% con capacitor
Avol = Ao/(1+s/wp);
copam = 12e-12;
k = copam * (r1*r2 + r1*r3 + r2*r3);
Hc = G / (k/wp/(Ao*r1) * s^2 + (r1+r2)/wp/(Ao*r1) * s + 1);
Zin = r3+ 1/s/copam + r1;


wo = sqrt(wp*Ao*r1/k);
xi = wo/2 * k/Ao/r1;

w = 2*pi*logspace(1, 7, 100);
%superponedor('', 'tc_tp2_ej2 bode.csv', 'tc_tp2_ej2_spice.csv', Hc, w);
% figure;
% opt = bodeoptions(); opt.FreqUnits = 'Hz';
% bode(Avol, w, opt); grid on;


cpunta = 10e-12; rpunta = 10e6;
Zpunta =  1/(s*cpunta+1/rpunta);
Zopam = 1/(s*copam);
Zinp = r3 + 1/(1/Zpunta+1/(Zopam+r1));
w = 2*pi*logspace(3, 6, 1000);

%superponedor('', 'tc_tp2_ej2 bode.csv', 'tc_tp2_ej2_spice sin c.csv', G, w, 'tc_tp2_ej2_bode sin c');
superponedor('', 'tc_tp2_ej2 bode.csv', 'tc_tp2_ej2_spice.csv', Hc, w);
%superponedor('', 'tc_tp2_ej2 Zin.csv', 'tc_tp2_ej2_Zin_sin_puntas.csv', Zin, w, 'tc_tp2_ej2 Zin sin punta');
%superponedor('', 'tc_tp2_ej2 Zin.csv', 'tc_tp2_ej2_Zin.csv', Zinp, w, 'tc_tp2_ej2 Zin');
