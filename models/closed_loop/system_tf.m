clear all; close all; clc;
%Carga de datos
run('../../params_data.m');
run('../open_loop/motor_model')
controller_design
control_G =  G_Controller * K_pwr * G_motor
control_H = K_pot_out

%Estudio del sistema a lazo abierto para buscar kp
%rlocusx(control_G*control_H)
%sgrid
G_CL = minreal(feedback(control_G, control_H))

error = (Vi*pi)/10 - (Vi)*control_G/(1+control_G*control_H)

step(error)
grid on;

%Poner la grilla en NEGRO y subirle la opacidad
set(gca, 'GridColor', 'k');  % 'k' es negro
set(gca, 'GridAlpha', 0.4);  % 1 es solido, 0 es invisible. 0.4 es un buen gris.
title('Error de Posicion');
xlabel('Tiempo [s]');
ylabel('Amplitud [rad]');
set(gca, 'FontSize', 12); % Hace los nè´‚meros de los ejes mè´°s grandes y legibles

