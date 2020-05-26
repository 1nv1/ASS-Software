# Convolución - Animación

## Introducción

La función **conv_ani** permite hacer la convolución tanto en tiempo continuo como
en tiempo discreto.

En rojo se dibuja la señal **X**, que en término de un sistema _LTI_ sería la señal
de excitación, mientras que en azul se dibuja la señal **H**, que en términos de un
sistema _LTI_ sería el sistema. Luego, el resultado **Y**, se grafica en violeta
(magenta).

El proceso es totalmente visible, a medida que las dos señales **X** y **H** se
superponen, generando una región oscura de color violeta (magenta). El área indica
que las dos señales interactúan, se multiplica y la integral nos da el valor
instantáneo de **Y**.

En la parte superior se verá la interacción e iteración entre las señales **X**
e **Y** y en la parte inferior se puede observar la señal **Y** generada, la
convolución.

## Parámetros

A continuación los parámetros que requiere:

Obligatorios

1. Vector con la señal A
2. Indicador de la posición del índice cero de la señal
3. Vector con la señal B
4. Indicador de la posición del índice cero de la señal
5. Delta de tiempo ¡Sí es **1** se hace la convolución discreta!

Opcionales

6. Duración de la animación en segundos, por defecto será de 5 segundos (aprox.)
7. Retardo de inicio en segundos, por defecto será 0

## Ejemplos

### Número 1

El siguiente es el ejemplo clásico de dos señales iguales, de 4 segundos de
duración y amplitud constante de 1.

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.05; % ~~5[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:4;
% La señal X
X = ones(1, length(t));
% La señal H
H = X;
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ani(X, round(length(X)/2), H, round(length(H)/2), dt);
```

Para una comprobación rápida, se puede usar la versión _one line_:

```octave
dt=0.05; t=0:dt:4; A=ones(1,length(t)); B=A; conv_ani(A, round(length(A)/2), B, round(length(B)/2), dt);
```
La comprobación se puede hacer como sigue:

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.05;
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:4;
X = ones(1, length(t));
H = X;
plot(dt .* conv(X, H));
```

Se puede ver la animación en el siguiente [video](https://youtu.be/NIH-_wS3ZSE).

### Número 2

El siguiente es un ejemplo donde **X** es una señal constante de 4 segundos con
amplitud constante igual a 1 e **Y** es una señal rampa de duración de 4
segundos.

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.05; % ~~5[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:4;
% La señal X
X = ones(1, length(t));
% La señal H
H = t;
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ani(X, round(length(X)/2), H, round(length(H)/2), dt);
```

Para una comprobación rápida, se puede usar la versión _one line_:

```octave
dt=0.05; t=0:dt:4; X=ones(1,length(t)); H=t; conv_ani(X, round(length(X)/2), H, round(length(H)/2), dt);
```

Se puede ver la animación en el siguiente [video](https://youtu.be/ky1QegQ7UG4).
