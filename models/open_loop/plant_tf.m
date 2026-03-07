close all; clear all; clc

run('../../params_data.m');
motor_model;

%%funcion de transferencia a lazo abierto
H_CL = K_pot_out
G_CL = K_pwr * G_motor

G_OL = G_CL*H_CL

%%Se divide por el coeficiente de mayor orden para que las raices queden expuestas en la formula
G_OL_simp = (0.7639/0.24)/(s^2+(0.41/0.24)*s)

%% Grafico
step(G_OL, 4);

