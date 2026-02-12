clear all; close all; clc;

%%Carga de datos
run("../../params_data.m")

pkg load symbolic
syms s real

%%Estudio de error
%%Funcion de transferencia a lazo abierto (con H incluido)
G = 3.183/(s^2+1.708*s)

kp = G
kv = simplify(G*s)
ka = simplify(G*s^2)

s = 0

kp = eval(kp)
kv = eval(kv)
ka = eval(ka)

%Error para entrada escalon, rampa y cuadratica
err1 = 1/(1+kp)
err2 = 1/kv
err3 = 1/ka
