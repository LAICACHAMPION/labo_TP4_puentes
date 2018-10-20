function [  ] = superponedor( titulo,medicion, simulacion,H,w,guardar)
%SUPERPONEDOR DE BODES: teorico matlab, simulacion spice, medido
% medicion: csv con las columnas:
%  - frecuencia en kHz
%  - tension de entrada 
%  - tension de salida (mismas unidades que entrada)
%  - fase en grados
% simulacion: archivo que te tira spice
% H: funcion transferencia
% w: vector de frecuencias
% guardar: si es 'save' guarda el jpg

sim = 1;
if size(simulacion) == 0
    sim = 0;
end

c_m=csvread(medicion);

[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
phase=squeeze(phase);
wout=squeeze(wout);
wout=wout./(2*pi);
mag=20*log10(mag);
magMedida=20*log10(c_m(:,3)./c_m(:,2));


maginitud=figure('Name','Bode magnitud','NumberTitle','off');

semilogx(c_m(:,1).*1000,magMedida,'o-', 'LineWidth', 3);
hold on;
semilogx(wout,mag,'LineWidth', 3);

if sim == 1
    c_s=csvread(simulacion);
    magMedida2=c_s(:,2);
    semilogx(c_s(:,1),magMedida2, 'LineWidth', 3);
    formataxes(titulo, 'Frecuencia (Hz)', 'Mangnitud (dB)', ... % titulo y ejes
                    'Medici\''on','C\''alculo', 'Simulaci\''on')% legends
else
    formataxes(titulo, 'Frecuencia (Hz)', 'Mangnitud (dB)', ... % titulo y ejes
                    'Medici\''on','C\''alculo')% legends
end

% title(titulo);
% xlabel('Frecuencia (Hz)');
% ylabel('Magnitud (dB)');
% legend('Medición','Calculo','Simulación');

if nargin==6
saveas(maginitud,strcat(guardar,'_mag','.png'));
end
%grid on;
hold off;

fase=figure('Name','Bode fase','NumberTitle','off');

semilogx(c_m(:,1).*1000,c_m(:,4), 'o-', 'LineWidth', 3);
hold on;
semilogx(wout,phase, 'LineWidth', 3);

if sim == 1
semilogx(c_s(:,1),c_s(:,3), 'LineWidth', 3);
% title(titulo);
% grid on;
% ylabel('Fase (°)');
% xlabel('Frecuencia (Hz)');
% legend('Medición','Calculo','Simulación');
    formataxes(titulo, 'Frecuencia (Hz)', 'Fase ($^o$)', ... % titulo y ejes
                    'Medici\''on','C\''alculo', 'Simulaci\''on')% legends
else
    formataxes(titulo, 'Frecuencia (Hz)', 'Fase ($^o$)', ... % titulo y ejes
                    'Medici\''on','C\''alculo')% legends
end
if nargin==6
saveas(fase,strcat(guardar,'_fase','.png'));
end
hold off;
end

