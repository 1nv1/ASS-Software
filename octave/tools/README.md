# Funciones útiles

## Animación

### Convolución en tiempo discreto

#### Parámetros

Para la animación de la convolución en tiempo discreto se utiliza la función
**conv_dis_ani()**. A continuación los parámetros que requiere:

Obligatorios

1. Vector con la señal A
2. Indicador de la posición del índice cero de la señal
3. Vector con la señal B
4. Indicador de la posición del índice cero de la señal

Opcionales

5. Duración de la animación en segundos, por defecto será de 5 segundos (aprox.)
6. Retardo de inicio en segundos, por defecto será 0

#### Ejemplo

La utilización se ejemplifica como sigue:

```octave
A = [1 2 3 2 1]; 
%      ^ Elemento n = 0 (posición 1)
B = [1 1 1 1 1];
%        ^ Elemento n = 0 (posición 2)
conv_dis_ani(A, 1, B, 2);
```

La comprobación se puede hacer como sigue:

```octave
A = [1 2 3 2 1]; 
B = [1 1 1 1 1];
plot(conv(A, B));
```

### Convolución en tiempo continuo

#### Parámetros

Para la animación de la convolución en tiempo continuo se utiliza la función
**conv_ana_ani()**. A continuación los parámetros que requiere:

Obligatorios

1. Vector con la señal A
2. Indicador de la posición del índice cero de la señal
3. Vector con la señal B
4. Indicador de la posición del índice cero de la señal
5. Delta de tiempo

Opcionales

6. Duración de la animación en segundos, por defecto será de 5 segundos (aprox.)
7. Retardo de inicio en segundos, por defecto será 0

#### Ejemplo

La utilización se ejemplifica como sigue:

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.1; % 100[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:(2*pi);
A = sin(t);
B = cos(t);
% Asumimos que las señales comienzan en el instante 0 (cero)
conv_ana_ani(A, 0, B, 0);
```

La comprobación se puede hacer como sigue:

```octave
% Definimos el vector del tiempo 'continuo'
dt = 0.1; % 100[ms]
% El vector del tiempo coincide con un ciclo completo
t = 0:dt:(2*pi);
A = sin(t);
B = cos(t);
plot(conv(A, B));
```
