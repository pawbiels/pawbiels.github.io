# Interpolacja, ekstrapolacja i aproksymacja wartości funkcji

Przygotuj skrypt `*.m` wykonujący poniższe polecenie. Po zakończeniu wklej zawartość skryptu (kod jako tekst) w polu tekstowym odpowiedzi do zadania.

## Cel zadania

Dane do zadania stanowią dyskretne wartości funkcji odpowiadające numerom indeksu, odpowiadające na osi $X$ argumentom od 1 do 6. Zadanie polega na aproksymacji funkcji:
- krzywą łamaną z wykorzystaniem [interpolacji liniowej](https://www.mathworks.com/help/matlab/ref/double.interp1.html) pomiędzy podanymi punktami oraz ekstrapolacji liniowej poza zakresem argumentów,
- pojedynczą funkcją liniową z wykorzystaniem [regresji liniowej](https://www.mathworks.com/discovery/linear-regression.html),
- [wielomianem]((https://www.mathworks.com/help/matlab/data_analysis/programmatic-fitting.html)) drugiego oraz wyższego stopnia.

Następnie należy porównać ze sobą wartości uzyskane pomiędzy zadanymi punktami oraz poza zakresem przedziału.

## Polecenie

Stwórz wektor $x$ zawierający liczby naturalne od 1 do 6. Przypisz do nich wektor $y$ składający się z kolejnych cyfr Twojego numeru indeksu. Uzyskany zbiór sześciu punktów $y(x)$ to Twoje dane wejściowe.

Oszacuj wartości funkcji w punktach na osi $x$ od 0 do 7, przyrastających co 0.5 (czyli 0.0, 0.5, 1.0, 1.5 itd.). W pierwszej kolejności wykorzystaj do tego celu interpolację i ekstrapolację liniową, czyli aproksymację krzywą łamaną. W drugiej kolejności wyznacz pojedynczą funkcję liniową, najlepiej dopasowaną do zadanych punktów. W trzeciej kolejności użyj aproksymacji wielomianowej drugiego stopnia. Na końcu wykorzystaj wielomian wyższego stopnia -- eksperymentuj z dostosowaniem jego stopnia tak, aby uzyskać jak najlepszą aproskymację.

Stwórz wykres przedstawiający:
- punkty wejściowe,
- krzywą łamaną i aproksymowane punkty,
- funkcję liniową (wynik regresji) i aproksymowane punkty,
- funkcje wielomianowe i aproksymowane punkty.

Aproksymowane punkty oznacz różnymi znacznikami w zależności od stosowanej funkcji. Opisz we właściwy sposób wykres i zamieść legendę.

Przygotuj również tabelę zawierającą aproksymowane wartości na wzór jak poniżej. Tabela powinna posiadać nagłówki zawierające nazwy kolumn, a wartości aproksymowanych punktów należy przedstawić z wyświetleniem trzech miejsc po przecinku (0.000). Tabelę zapisz do pliku `txt`.

| $X$ | Wejściowe | Interpolacja | Regresja liniowa | Wielomian $x^2$ | Wielomian $x^n$ |
|--|--|--|--|--|--|
| 0.0 | ... | ... | ... | ... | ... |
| 0.5 | ... | ... | ... | ... | ... |
| ... | ... | ... | ... | ... | ... |
| 7.0 | ... | ... | ... | ... | ... |

Porównaj ze sobą wartości i zastanów się, które są jednakowe, które podobne, a które zupełnie różne i dlaczego.

## Przydatne funkcje

Dowiedz się więcej, wpisując w konsolę `help nazwa_funkcji`

- [`interp1`](https://www.mathworks.com/help/matlab/ref/double.interp1.html)
- [`polyfit`](https://www.mathworks.com/help/matlab/ref/polyfit.html)
- [`polyval`](https://www.mathworks.com/help/matlab/ref/polyval.html)