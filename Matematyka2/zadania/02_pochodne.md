# Różniczkowanie numeryczne i analiza zbieżności

Przygotuj skrypt `*.m` wykonujący poniższe polecenie. Po zakończeniu wklej zawartość skryptu (kod jako tekst) w polu tekstowym odpowiedzi do zadania.

## Cel zadania

Celem zadania jest numeryczne wyznaczenie pochodnej funkcji dyskretnej z odpowiednią dokładnością. Zbadana zostanie zbieżność rozwiązania wraz ze zmianą liczby elementów dziedziny dyskretnej.

## Polecenie

Wymyśl funkcję $y(x)$ stanowiącą sumę funkcji: wykładniczej, kwadratowej oraz sinus lub cosinus, gdzie współczynniki stanowią wybrane cyfry z Twojego numeru indeksu, na przykład:

$$
y(x) = a\sin(b \cdot x) + c\cos(d \cdot x) + ex^2 + f^x
$$

Zerowe współczynniki zamień na inne cyfry. Naszkicuj osobno każdy element powyższej sumy na wspólnym wykresie w dziedzinie od -2 do 2, tak aby porównać proporcje między funkcjami. Jeśli jedna z funkcji będzie znacząco dominować nad pozostałymi na wykresie, zmodyfikuj jej współczynniki. **Uwaga!** W Matlabie niektóre operacje na elementach wektorów (np. mnożenie i potęgowanie) trzeba definiwać z użyciem kropki (`.^` zamiast `^`). Sprawdź [element-wise operations](https://www.mathworks.com/help/matlab/ref/period.html).

Następnie stwórz w Matlabie funkcję, która będzie wykonywać poniższą instrukcję. "Wyznacz wartości funkcji w pięciu równo oddalnych punktach dziedziny $x$ w zakresie od -2 do 2. Następnie wyznacz pochodną funkcji, stosując metodę różnic centralnych (wygooglaj algorytm *finite difference method*). Numerycznie scałkuj funkcję w granicach dziedziny (od -2 do 2), wykorzystując metodę trapezową (wyszukaj *trapezoidal numerical integration*). Wynikiem będzie liczba; zapamiętaj tę liczbę. W ten sam sposób oblicz całkę oznaczoną pochodnej funkcji i tę liczbę również zapamiętaj. W teorii liczba ta powinna odpowiadać zmianie wartości funkcji w zadanym przedziale, czyli różnicy między wartością ostatniego i pierwszego punktu."

Realizuj powyższą funkcję w pętli dla kolejnych zagęszczeń dziedziny, zwiększając liczbę elementów o jeden, co najmniej aż do liczby 20 (lub więcej, jeśli zajdzie potrzeba). Następnie wykonaj analizę zbieżności (*convergence analysis*); naszkicuj wykres przedstawiający zależność całki funkcji (na osi pionowej) od liczby elementów dziedziny. Oceń, czy została uzyskana zbieżność, czyli czy wartość całki stablizuje się. Jeżeli tak, wskaż liczbę elementów dziedziny, od której proces można uznać za stabilny. Jeżeli nie, zagęszczaj dalej dziedzinę.

Na koniec stwórz **jeden rysunek** (w Matlabie `figure`), zawierający cztery wykresy (`subplot`) umieszczone jeden pod drugim. Na pierwszym wykresie ma się znaleźć analiza zbieżności całki funkcji a na drugim: analiza zbieżności całki pochodnej funkcji. Trzeci ma przedstawiać wyjściową funkcję oraz jej pochodną dla dziedziny pięcioelementowej, a czwarty: dla dziedziny, w której uzyskano zbieżność. Zapisz końcowy rysunek do formatu `.png`. Oceń, czy obie całki zbiegają się w jednakowy sposób; zastanów się, z czego wynika różnica.

## Przydatne funkcje

Dowiedz się więcej, wpisując w konsolę `help nazwa_funkcji`

- `linspace` generuje dziedzinę o zadanych granicach i liczbie elementów
- `plot` pozwala szkicować prosty wykres funkcji
- `hold on` umożliwia dodawanie kolejnych krzywych na jednym wykresie
- `for` tworzy klasyczną pętlę for
- `function` definiuje własną funkcję
- `trapz` realizuje całkowanie numeryczne
- `v(end+1) = k` dodaje element `k` na końcu wektora `v`
- `subplot` tworzy kolejne wykresy na jednym rysunku