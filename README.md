# Sistema de Control SISO para Movimiento Rotacional de Antena Parabólica  
**Trabajo Práctico – Sistemas de Control**

## 📡 Introducción  
Este proyecto desarrolla un sistema de control *Single Input Single Output (SISO)* destinado a regular el movimiento rotacional de una antena parabólica. El objetivo es lograr que la antena siga con precisión una referencia angular utilizando un sensor de movimiento que mide la posición real. De este modo, el sistema puede corregir desviaciones y estabilizar la orientación.

## 🎯 Objetivo del Sistema  
El controlador debe:
- Regular la posición angular de la antena.  
- Minimizar el error entre la referencia deseada y la posición medida.  
- Garantizar estabilidad, rapidez y un comportamiento suave.  
- Ser implementable en un sistema físico realista.

## 🧩 Descripción del Sistema  

### 1. **Actuador (motor rotacional)**  
Genera el movimiento de la antena a partir de la señal de control.

### 2. **Dinámica de la antena y conjunto mecánico**  
La estructura posee un momento de inercia que condiciona la respuesta dinámica.  
Se modela mediante ecuaciones diferenciales lineales o funciones de transferencia.

### 3. **Sensor de movimiento**  
Mide el ángulo real (encoder, giroscopio, sensor Hall, etc.) y provee realimentación.

### 4. **Controlador SISO**  
Convierte el error de posición en señal de control. Entre las alternativas típicas:  
- Control P  
- Control PI  
- Control PID  
- Diseño por lugar de las raíces  
- Diseño por respuesta en frecuencia

### 5. **Realimentación**  
El valor angular medido se compara contra la consigna para ajustar continuamente la salida.

## 🧪 Metodología de Trabajo  

### **1. Modelado matemático**
- Ecuaciones del motor (parámetros eléctricos y mecánicos).  
- Momento de inercia del conjunto motor–antena.  
- Obtención de la función de transferencia.

### **2. Análisis del sistema en lazo abierto**
- Ubicación de polos y ceros.  
- Estabilidad inicial.  
- Respuesta temporal ante un escalón.

### **3. Diseño del controlador**
- Selección del tipo de controlador según objetivos.  
- Ajuste de parámetros mediante:  
  - Lugar de las raíces  
  - Diagramas de Bode  
  - Métodos de sintonización (por ejemplo, Ziegler–Nichols)

### **4. Simulación**
Usando MATLAB/Simulink, Python o Scilab:  
- Respuesta temporal.  
- Sensibilidad al ruido.  
- Comportamiento frente a perturbaciones externas.  

### **5. Resultados**
- Comparación entre el sistema sin control y controlado.  
- Cumplimiento de especificaciones dinámicas.

### **6. Conclusiones**
Síntesis del desempeño logrado y observaciones sobre posibles mejoras del diseño.

## 📊 Estructura del Repositorio
- `modelos/` – Modelos matemáticos y parámetros.  
- `simulaciones/` – Scripts, diagramas y archivos de simulación.  
- `informe/` – Desarrollo teórico y análisis detallado.  
- `graficos/` – Imágenes de respuestas temporales y diagramas.  

## 📝 Conclusión  
Este trabajo integra los conceptos fundamentales del control clásico aplicados al movimiento rotacional de una antena parabólica. El uso de realimentación permite transformar un mecanismo físico con inercia en un sistema capaz de orientarse con precisión, demostrando el valor del diseño de controladores en sistemas electromecánicos.
