# Escalón unitario o Heaviside

## Introducción

Es una de las funciones triviales que se utilizan.
Por definición en el tiempo continuo:

```
         _
        /  1 sí t >= 0
u(t) = < 
        \_ 0 sí t <  0

```

Por definición en el tiempo discreto:

```
         _
        /  1 sí n >= 0
u[n] = < 
        \_ 0 sí n <  0

```

## Programáticamente

Se puede contruir la función en Octave de la siguiente manera:

```octave
function ret = u(t)
  ret = (t >= 0);
end
```


