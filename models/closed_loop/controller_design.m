clear all; close all;clc;

%Carga de datos
run('../../params_data.m');
run('../open_loop/motor_model')

pkg load symbolic;
tf('s')

%En nuestro caso es mejor usar un PD porque la accion integral realentiza al sistema y ya tenemos un polo en el origen
G_Controller = zpk(Kp*(1+Td*s))
