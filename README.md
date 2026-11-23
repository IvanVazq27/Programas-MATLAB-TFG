# Interpolación racional en MATLAB

Programas en MATLAB desarrollados para mi Trabajo de Fin de Grado en Matemáticas (Universidad de Santiago de Compostela, 2025-2026) sobre **interpolación racional**. Sirvieron para calcular los ejemplos numéricos de la memoria.

Dados unos puntos `x_i` y sus valores `f_i`, el objetivo es construir una función que pase por ellos: una fracción continua (que equivale a una función racional) o una fracción de polinomios.

> Los comentarios del código están en gallego, el idioma en que se escribió la memoria.

## Contenido

| Archivo | Qué hace |
|---|---|
| `difinversas.m` | Calcula la tabla de **diferencias inversas** y construye la fracción continua que interpola los datos. Muestra la tabla, la fracción y su forma simplificada. |
| `difreciprocas.m` | Calcula la tabla de **diferencias recíprocas** y construye la **fracción continua de Thiele**. Muestra la tabla, la fracción y su forma simplificada. |
| `NevillePolinomico.m` | Algoritmo de **Neville polinómico**: evalúa en un punto `x` el polinomio interpolante. |
| `NevilleRacional.m` | Algoritmo de **Neville racional**: evalúa en un punto `x` la función racional interpolante. Avisa si encuentra una singularidad (denominador casi cero). |

## Requisitos

- MATLAB
- *Symbolic Math Toolbox*, solo para `difinversas.m` y `difreciprocas.m` (usan cálculo simbólico para simplificar la fracción).

## Uso

```matlab
x_i = [0 1 2 3 4];
f   = 1 ./ (1 + x_i.^2);

% Fracción continua por diferencias inversas
Phi = difinversas(x_i, f);

% Fracción continua de Thiele
Phi = difreciprocas(x_i, f);

% Evaluar la interpolante en x = 1.5
valorPol = NevillePolinomico(x_i, f, 1.5);
valorRac = NevilleRacional(x_i, f, 1.5);
```

## Detalles numéricos

- Se usa una tolerancia de `1e-14` para detectar denominadores nulos. En las tablas de diferencias, esos casos se marcan como `Inf`.
- En `NevilleRacional.m`, si el denominador es casi cero se muestra un aviso con la posición `(i, k)` donde aparece.

## Autor

Iván Vázquez Cruces · [LinkedIn](https://www.linkedin.com/in/iv%C3%A1n-v%C3%A1zquez-cruces-1255aa440)
