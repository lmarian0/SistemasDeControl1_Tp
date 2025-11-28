# 📡 Sistema de Control de Posición Azimutal para Antena Parabólica

**Trabajo Práctico – Sistemas de Control**

Este repositorio contiene el desarrollo, análisis y simulación de un sistema de control **SISO (Single Input Single Output)** diseñado para regular el movimiento rotacional de una antena parabólica. El proyecto abarca desde el modelado matemático de la planta electromecánica hasta el diseño y validación de compensadores para el seguimiento preciso de satélites.

---

## 📋 Tabla de Contenidos
1. [Definición del Problema](#-definición-del-problema)
2. [Análisis de la Planta](#-análisis-de-la-planta)
3. [Especificaciones de Diseño](#-especificaciones-de-diseño)
4. [Estrategia de Control](#-estrategia-de-control)
5. [Simulación y Resultados](#-simulación-y-resultados)
6. [Estructura del Repositorio](#-estructura-del-repositorio)
7. [Bibliografía](#-bibliografía)

---

## 🎯 Definición del Problema

### Principio de Funcionamiento
El sistema consiste en una estructura mecánica (antena) que debe rotar sobre su eje azimutal. Un **Motor de Corriente Continua (DC)** actúa como impulsor, transmitiendo el movimiento a través de un sistema de engranajes (caja reductora) para vencer la inercia de la antena.

### Identificación de Variables
* **Objetivo de Control:** Regular la **posición angular ($\theta$)** del plato (Salida).
* **Medición:** Se utiliza un **potenciómetro rotativo** o **encoder** junto con un acondicionador de señal para obtener un voltaje proporcional al ángulo ($V_{out} \propto \theta$).
* **Actuador:** Motor DC controlado por armadura mediante un amplificador de potencia (Driver/Puente H).

### Variables del Sistema y Unidades
| Variable | Símbolo | Unidad de Medida |
| :--- | :---: | :--- |
| **Señal de Referencia** | $r(t)$ | Voltios $[V]$ (proporcional a grados) |
| **Señal de Control** | $u(t)$ | Voltios $[V]$ |
| **Torque del Motor** | $\tau$ | Newton-metro $[N\cdot m]$ |
| **Velocidad Angular** | $\omega$ | Radianes/segundo $[rad/s]$ |
| **Posición de Salida** | $y(t)$ | Radianes $[rad]$ o Grados $[^\circ]$ |

### Consideraciones Adicionales
* **Perturbaciones:** Torque por viento sobre el plato, vibraciones mecánicas.
* **No Linealidades:** Zona muerta (fricción estática en engranajes) y Saturación (voltaje máx. de la fuente).
* **Niveles de Señal:** Lógica de control ($\pm 10V$) y Potencia de motor ($12V/24V$).

---

## ⚙️ Análisis de la Planta

En esta etapa se caracteriza el comportamiento físico del sistema en **Lazo Abierto**.

1.  **Diagrama de Bloques:** Interconexión de las funciones de transferencia: `Controlador` $\to$ `Driver` $\to$ `Motor+Carga` $\to$ `Sensor`.
2.  **Modelo Matemático:**
    * **Ecuaciones Eléctricas:** Ley de Kirchhoff en la malla de armadura.
    * **Ecuaciones Mecánicas:** 2ª Ley de Newton para rotación ($J, B, K_t, K_e$).
3.  **Función de Transferencia (FT):** Obtención de $\frac{\Theta(s)}{V(s)}$ mediante álgebra de bloques.
4.  **Análisis de Estabilidad:** Aplicación del criterio de Routh-Hurwitz y ubicación de polos/ceros.
5.  **Respuesta Temporal:** Verificación de la constante de tiempo mecánica y eléctrica.

---

## 📊 Especificaciones de Diseño

El controlador debe garantizar que la antena apunte correctamente y reaccione rápido sin oscilaciones peligrosas.

### Dominio del Tiempo
* **Error en estado estable ($e_{ss}$):** $0$ ante entrada escalón (posición fija perfecta).
* **Sobrepasamiento máximo ($M_p$):** $< 15\%$ (para proteger la estructura mecánica).
* **Tiempo de establecimiento ($t_s$):** $< 2$ segundos (Criterio del 2%).

### Dominio de la Frecuencia (Opcional)
* **Margen de Fase (MF):** $> 45^\circ$.
* **Margen de Ganancia (MG):** $> 6$ dB.

---

## 🧠 Estrategia de Control

Se implementan y comparan las siguientes técnicas de compensación:

1.  **Método del Lugar de las Raíces (Root Locus):**
    * Diseño de compensadores de **Adelanto/Atraso** usando el método de la bisectriz para reubicar los polos dominantes.
2.  **Controlador PID:**
    * Sintonización para anular error estacionario (Integral) y amortiguar oscilaciones (Derivativo).

---

## 💻 Simulación y Resultados

Las validaciones se realizan en **MATLAB/Simulink**.

* **Respuesta al Escalón:** Verificación de cumplimiento de $M_p$ y $t_s$.
* **Análisis de Esfuerzo de Control:** Monitoreo de la señal $u(t)$ para evitar saturación prolongada.
* **Robustez:** Pruebas agregando bloques de *Dead Zone* y *Saturation* para simular condiciones reales no lineales.

---

## 📂 Estructura del Repositorio

```bash
├── 📁 docs/              # Documentación e informe final (PDF/LaTeX)
├── 📁 models/            # Scripts de modelado matemático (.m)
│   ├── motor_params.m    # Parámetros físicos (J, B, R, L)
│   └── plant_tf.m        # Obtención de Funciones de Transferencia
├── 📁 simulations/       # Archivos de Simulink (.slx)
│   ├── open_loop.slx     # Análisis de planta sola
│   ├── pid_control.slx   # Implementación del PID
│   └── root_locus.slx    # Compensador por Lugar de las Raíces
├── 📁 figures/           # Gráficos de respuesta temporal y lugar de las raíces
└── README.md             # Este archivo