%%Perturbaciones incluidas
system_tf;

T_ref = minreal(feedback(G_Controller*K_pwr*G_motor, K_pot_out))

T_dist = minreal(G_viento / (1 +G_Controller*K_pwr*G_motor*K_pot_out))


t = 0:0.01:10; % Simulamos 10 segundos


% El usuario pide que la antena vaya a la posici«Ñn 1 (Escal«Ñn en t=0)

referencia = ones(size(t));



% El viento sopla de repente en el segundo 4

viento = zeros(size(t));

viento(t >= 4 & t<=6 ) = Tw; % Amplitud del viento

% 4. Simulamos usando lsim (Simulaci«Ñn Lineal)

[y_ref, ~] = lsim(T_ref, referencia, t);    % Respuesta solo al usuario

[y_viento, ~] = lsim(T_dist, viento, t);    % Respuesta solo al viento

% SUPERPOSICIªÑN: Sumamos ambos efectos f«¿sicos

y_total = y_ref + y_viento;

% 5. Graficamos el resultado para el informe

figure;

plot(t, y_total, 'b', 'LineWidth', 2); hold on;
plot(t, viento)
%plot(t, referencia, 'r--', 'LineWidth', 1.5);

title('Respuesta de la Antena con Controlador PD ante R«¡faga de Viento');

xlabel('Tiempo [s]');

ylabel('Posici«Ñn \theta (rad)');

legend('Posici«Ñn Real (Afectada por viento)', 'Location', 'southeast');

grid on;

error = (Vi*pi)/10 - y_total;

figure;

plot(t, error)
