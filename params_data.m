%&Parametros del sistema
close all; clear all; clc
pkg load symbolic


% --- 1. Parametros Fisicos del Motor ---
Ra = 5.0;       % Resistencia de armadura [Ohms]
Kt = 0.5;       % Constante de torque [N.m/A]
Kb = 0.5;       % Constante contra-electromotriz [V.s/rad]
Jeq = 0.048;    % Inercia equivalente [kg.m^2]
Beq = 0.032;    % Fricción viscosa [N.m.s/rad]
N = 10;         % Relación de transmisión

% --- 2. Parametros del Sensor (Potenciometros) ---
% Rango +/- 10V para una vuelta completa (2pi rad)
K_pot = 20 / (2*pi); % aprox 3.183 [V/rad]

% --- 3. Calculos Auxiliares ---
% Fricción efectiva vista por el motor (mecánica + efecto eléctrico)
B_eff = Beq + (Kt * Kb) / Ra;

% --- 4. Variables de Diseño (Controlador) ---
K_pre = 1;      % Ganancia del preamplificador (Ajustable)
K_pwr = 1;      % Ganancia de potencia (Fija, buffer)
K_total = K_pre * K_pwr;


disp('Parametros cargados correctamente.');

