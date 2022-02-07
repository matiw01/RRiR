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
Równanie które rozwiązuje program to równanie potencjału grawitacyjnego. Wyprowadzenie postaci słabej znajduje się w pliku pdf RRiR(1).pdf

