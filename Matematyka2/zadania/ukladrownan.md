# Rozwiązywanie układów równań liniowych i nieliniowych

Przygotuj skrypt `*.m` wykonujący poniższe polecenie. Po zakończeniu wklej zawartość skryptu (kod jako tekst) w polu tekstowym odpowiedzi do zadania.

## Cel zadania

Zadanie polega na definicji i rozwiązaniu:
- [układu równań liniowych](https://www.mathworks.com/help/symbolic/solve-a-system-of-linear-equations.html),
- [układu równań nieliniowych](https://www.mathworks.com/help/optim/systems-of-nonlinear-equations.html).

Układ równań liniowych należy zdefiniować w trzech wariantach jako oznaczony, nieoznaczony (tożsamościowy) i sprzeczny.

## Polecenie

Zdefiniuj układ równań liniowych $3\times3$ jako operację macierzową $\bm{A}\bm{x} = \bm{b}$, gdzie $\bm{x}$ stanowi wektor niewiadomych, $\bm{A}$ macierz współczynników, a $\bm{b}$ wektor wyrazów wolnych.

$$
\bm{A} =
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{bmatrix}
$$

W rezultacie operacja $\bm{A}\bm{x} = \bm{b}$ powinna skutkować powstaniem układu trzech równań jak poniżej.

$$
a_{11}x_1 + a_{12}x_2 + a_{13}x_3 = b_1 \\
a_{21}x_1 + a_{22}x_2 + a_{23}x_3 = b_2 \\
a_{31}x_1 + a_{32}x_2 + a_{33}x_3 = b_3
$$

Dobierz dane wejściowe tak, aby każdy współczynnik $a$ oraz wyraz wolny $b$ stanowił sumę lub różnicę pewnych dwóch cyfr z Twojego indeksu. Zadbaj przy tym o to, aby macierz współczynników nie była symetryczna ani osobliwa. Sprawdź, czy wyznacznik macierzy nie jest równy zero.

Rozwiąż układ jedną z dostępnych metod. Następnie zmień układ w nieoznaczony, modyfikując jeden z wierszy macierzy współczynników tak, aby dwa równania były tożsamościowe. Sprawdź, jaki jest wynik rozwiązania takiego układu różnymi metodami. Ponownie weź początkowy układ i dodaj do niego jeszcze jedno równanie, tak aby uzyskać układ sprzeczny. Spróbuj rozwiązać i skomentuj. Wyniki tych prób z komentarzami wyświetl w konsoli.

Kolejnym krokiem jest zmodyfikowanie powyższego układu tak, aby równania liniowe zastąpić nieliniowymi. Stwórz [funkcję](https://www.mathworks.com/help/optim/ug/fsolve.html#buta__s-fun) zawierającą zmodyfikowane równania, korzystając z wyrażeń wielomianowych, wykładniczych i trygonometrycznych w miejsce prostych wyrażeń liniowych.

Następnie rozwiąż układ, wykorzystając funkcję [`fsolve`](https://www.mathworks.com/help/optim/ug/fsolve). Przetestuj co najmniej trzy różne zestawy algorytmów i parametrów operacji. Eksperymentuj do uzyskania zadowalającej powtarzalności. Wyniki i różnice wyświetl i skomentuj w konsoli.

## Przydatne funkcje

Dowiedz się więcej, wpisując w konsolę `help nazwa_funkcji`

- [`inv`](https://www.mathworks.com/help/matlab/ref/inv) odwraca macierz
- [`det`](https://www.mathworks.com/help/matlab/ref/det) oblicza wyznacznik macierzy
- [`linsolve`](https://www.mathworks.com/help/matlab/ref/linsolve) rozwiązuje układ równań liniowych
- [`mldivide`](https://www.mathworks.com/help/matlab/ref/mldivide) alternatywne rozwiązanie
- [`fsolve`](https://www.mathworks.com/help/matlab/ref/fsolve) rozwiązuje układ równań nieliniowych