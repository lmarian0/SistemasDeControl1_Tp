clear all; close all; clc;
%Carga de datos
run('../../params_data.m');
run('../open_loop/motor_model')
controller_design
control_G =  G_Controller * K_pwr * G_motor
control_H = K_pot_out

%rlocusx(control_G*control_H)
%sgrid(-0.6,2.5)

error = (Vi)*control_G/(1+control_G*control_H)

step(error)
grid on;

% Truco: Poner la grilla en NEGRO y subirle la opacidad
set(gca, 'GridColor', 'k');  % 'k' es negro
set(gca, 'GridAlpha', 0.4);  % 1 es solido, 0 es invisible. 0.4 es un buen gris.
title('Error de Posicion');
xlabel('Tiempo [s]');
ylabel('Amplitud [rad]');
set(gca, 'FontSize', 12); % Hace los nè´‚meros de los ejes mè´°s grandes y legibles

