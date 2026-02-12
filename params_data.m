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
Kp = 1.2 %8.91
%Ti = 1; %1
Td = 0.584 %0.584 %0.3;

disp('Parametros cargados correctamente.');

