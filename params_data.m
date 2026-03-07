%&Parametros del sistema
close all; clear all; clc
pkg load symbolic

% --- 0. Entrada del sistema
Vi = 1;

% --- 1. Parametros Fisicos del Motor ---
Ra = 5.0;       % Resistencia de armadura [Ohms]
Kt = 0.5;       % Constante de torque [N.m/A]
Kb = 0.5;       % Constante contra-electromotriz [V.s/rad]
Jeq = 0.048;    % Inercia equivalente [kg.m^2]
Beq = 0.032;    % Friccipn viscosa [N.m.s/rad]
N = 10;         % Relacion de transmision

% --- 2. Parametros del Sensor (Potenciometros) ---
% Rango +/- 10V para una vuelta completa (2pi rad)
K_pot_in = 20 / (10*2*pi); % aprox 0.3183 [V/rad]
K_pot_out = K_pot_in*10;

% Driver Puente H para control del motor
K_pwr = 4.8

% --- 3. Calculos Auxiliares ---
% Fricciè´—n efectiva vista por el motor (mecanica + efecto electrico)
B_eff = Beq + (Kt * Kb) / Ra;


% --- 4. Variables de Diseè´–o (Controlador) ---
Kp = 1.2;%1.2
%Ti = 1;
Td = 0.584;

% --- 5. Perturbaciones
% Tw = 1/2 densidad*v_viento**2*Area*D*Cm = Kw * v_viento**2
% Kw con un angulo desfavorable puede ser 0.166
densidad = 1.225; %kg/m3
diametro = 1.2 %m
area = pi*(diametro/2)**2; %m2
Cm = 0.2; %Angulo oblicuo
Kw = (1/2)*densidad*area*diametro*Cm;
viento_km_h = 9;
Tw = Kw*(viento_km_h/3.6)**2;


disp('Parametros cargados correctamente.');

