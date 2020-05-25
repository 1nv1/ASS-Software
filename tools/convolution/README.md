# Convolución

## En tiempo continuo

### Parámetros

Para la animación de la convolución en tiempo continuo se utiliza la función
**convAniCont()**. A continuación los parámetros que requiere:

Obligatorios

1. Vector con la señal A
2. Indicador de la posición del índice cero de la señal
3. Vector con la señal B
4. Indicador de la posición del índice cero de la señal
5. Delta de tiempo

Opcionales

6. Duración de la animación en segundos, por defecto será de 5 segundos (aprox.)
7. Retardo de inicio en segundos, por defecto será 0

### Ejemplo

La utilización se ejemplifica como sigue:

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.01; % ~~10[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:(2*pi);
A = sin(t);
B = cos(t);
% Asumimos que las señales comienzan en el instante 0 (cero)
convAniCont(A, 0, B, 0, dt);
```

Para una comprobación rápida, se puede usar la versión _one line_:

```octave
dt=0.01; t=0:dt:(2*pi); A=sin(t); B=cos(t); convAniCont(A, 0, B, 0, dt);
```

La comprobación se puede hacer como sigue:

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.01; % ~~10[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:(2*pi);
A = sin(t);
B = cos(t);
plot(dt .* conv(A, B));
```
