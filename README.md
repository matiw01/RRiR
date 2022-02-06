# Rozwiązanie równania różniczkowego

Program rozwiązuje równanie różniczkowe potencjału grawitacyjnego metodą elementów skończonych oraz rysuje wykres wynikowej funkcji.

Całość napisana została w języku programowania Julia.
Wykorzystane biblioteki to:
* QuadGk
* Plots
* CalculusWithJulia

## Przygotowanie 
Do uruchomienia programu niezbędne będzie pobranie [Julii](https://julialang.org/downloads/), wymienionych wyżej bibliotek, aby to zrobić należy wpisać w konsoli poniższe komendy.
```
using Pkg
Pkg.add("QuadGk")
Pkg.add("Plots")
Pkg.add("CalculusWithJulia")
```
## Postawiony problem
Równanie które rozwiązuje program to równanie potencjału grawitacyjnego.

![](https://latex.codecogs.com/png.image?\dpi{110}%20\frac{d^{2}\phi}{dx^{2}}%20=%204\pi%20G\rho(x))
