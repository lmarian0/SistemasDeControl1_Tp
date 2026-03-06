close all; clear all; clc;
pkg load symbolic
pkg load control

%% --- 1. PARTE SIMBè™—LICA ---
syms s Va ra Ia kb O kt j b T_viento N real

%% Ecuaciones de motor
motor_eq1 = Va == (ra*Ia) + (kb*s*O);
% El viento entra restando al torque del motor
motor_eq2 = (kt*Ia) - T_viento/N == (j*s^2*O) + (b*s*O);

%% Solucion de ecuaciones
% è¢¬Correcciè´—n!: Solo despejamos O e Ia. Las entradas (Va y T_viento) quedan libres.
Solucion = solve(motor_eq1, motor_eq2, O, Ia);

%% Funciones de Transferencia (Superposiciè´—n)
% A. G_motor: Apagamos el viento (T_viento = 0)
O_motor = subs(Solucion.O, T_viento, 0);
G_motor_simbolica = simplify(O_motor / Va)

% B. G_viento: Apagamos el voltaje (Va = 0)
O_viento = subs(Solucion.O, Va, 0);
G_viento_simbolica = simplify(O_viento / T_viento)

% Limpiamos solo las variables simbè´—licas para no mezclar, PERO NO usamos 'clear all'
% porque nos borrarè´øa las herramientas de control.
clear s Va ra Ia kb O kt j b T_viento motor_eq1 motor_eq2 Solucion O_motor O_viento;


%% --- 2. PARTE NUMè™±RICA ---
%% Carga de datos
run("../../params_data.m")

s = tf('s');

%% Definiciè´—n de las Plantas
% Planta del Motor (El numerador es empujado por Kt)
G_motor = zpk((1/10) * Kt / (s^2*Jeq*Ra + s*(Beq*Ra+Kb*Kt)))

% Planta del Viento (El numerador es resistido por -Ra)
G_viento = zpk((1/100) * (-Ra) / (s^2*Jeq*Ra + s*(Beq*Ra+Kb*Kt)))

%% Polos (Verificarè´°s que el denominador no cambia, los polos son idè´±nticos)
disp('Polos del sistema:');
pole(G_motor)

