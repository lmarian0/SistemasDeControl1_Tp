close all; clear all; clc;
pkg load symbolic
pkg load control

%%Variables
syms s Va ra Ia kb O kt j b real
%%Ecuaciones de motor
motor_eq1 = Va == (ra*Ia) + (kb*s*O)
motor_eq2 = (kt*Ia) == (j*s^2*O) + (b*s*O)
%%Solucion de ecuaciones
Motor = solve (motor_eq1, motor_eq2, O, Va, Ia)
%%Funcion de transfereencia
G_motor = simplify(Motor.O/Motor.Va)
clear all;

%%Carga de datos
run("../../params_data.m")

s = tf('s')

G_motor = zpk((1/10) * Kt/(s^2*Jeq*Ra + s*(Beq*Ra+Kb*Kt)))
%%Polos
pole(G_motor)


