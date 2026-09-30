# Kinematyka ruchu złożonego

Przygotuj skrypt `.m` wykonujący poniższe polecenie. Po zakończeniu wklej zawartość skryptu (kod jako tekst) w polu tekstowym odpowiedzi do zadania.

## Cel zadania

Wyznacz równania ruchu punktu A znajdującego się na obwodzie koła w płaskim ruchu złożonym. Następnie:
- wykreśl tor ruchu środka koła (linią przerywaną)
- wykreśl tor ruchu punktu A (linią ciągłą)
- przedstaw animację prezentującą:
  - kolejne położenia koła,
  - kolejne położenia punktu A na torze ruchu,
  - odcinek łączący punkty A i O,
  - konfigurację całkowitych wektorów prędkości i przyspieszenia punktu A.

Wektorom prędkości i przyspieszenia przy wyświetlaniu nadaj stałą, znormalizowaną długość (np. 0.5 promienia koła), a zmieniaj jedynie ich punkt zaczepienia oraz kierunek i zwrot. W legendzie lub w tytule rysunku umieść zmienne w czasie etykiety przedstawiające aktualny czas oraz wartości prędkości, przyspieszenia stycznego i normalnego. Zapisz do pliku `.txt` tabelę zawierającą kolumny: czas, położenie ($x$ i $y$), prędkość ($x$ i $y$), przyspieszenie ($x$ i $y$), przyspieszenie (t i n) punktu A.

## Dane do zadania

Początkowe położenie środka koła znajduje się w punkcie (0,0). Prędkość środka koła dana jest poniższymi wzorami, gdzie $v_0$ oznacza początkową prędkość ciała, $\alpha$ -- początkowy kąt nachylenia toru ruchu do poziomu, a $g$ -- przyspieszenie ziemskie:

$$
\begin{cases}
v_x(t) = v_0 \cos\alpha  \\
v_y(t) = v_0 \sin\alpha - gt
\end{cases}
$$

Punkt A znajduje się w odległości R od środka obrotu i obraca się ze stałym przyspieszeniem kątowym $\varepsilon$. Początkowy kąt obrotu przyjmij jako zero, a początkową prędkość kątową jako $\omega_0$. Scałkuj poniższe równania ruchu obrotowego:

$$
\begin{cases}
\omega(t) = \int\varepsilon(t)dt \\
\phi(t) = \int\omega(t)dt
\end{cases}
$$

Przyjmij w dowolny sposób stałe: $v_0, \alpha, \varepsilon, \omega_0$ oraz $R$. Następnie wyznacz poniższe równania ruchu złożonego.

## Teoria

Równania ruchu punktu A znajdującego się na ciele o lokalnym środku obrotu w punkcie O stanowią geometryczną sumę wielkości postępowych punktu O oraz wielkości względnych (obrotowych), oznaczonych jako OA:

$$
\begin{cases}
\bm{r}_{A}(t) = \bm{r}_\text{O}(t) + \bm{r}_\text{OA}(t) \\
\bm{v}_{A}(t) = \bm{v}_\text{O}(t) + \bm{v}_\text{OA}(t) \\
\bm{a}_{A}(t) = \bm{a}_\text{O}(t) + \bm{a}_\text{OA}(t)
\end{cases}
$$

Prędkość względna stanowi iloczyn wektorowy prędkości kątowej punktu O oraz wektora położenia punktu A względem punktu O:

$$
\bm{v}_\text{OA}(t) = \bm{\omega}_\text{O}(t) \times \bm{r}_\text{OA}(t)
$$

Przyspieszenie względne (całkowite) jest sumą względnego przyspieszenia stycznego (oznaczonego górnym indeksem t) i normalnego (oznaczonego górnym indeksem n). Względne przyspieszenie styczne stanowi iloczyn wektorowy przyspieszenia kątowego punktu O oraz wektora położenia punktu A względem punktu O. Względne przyspieszenie normalne stanowi iloczyn wektorowy prędkości kątowej punktu O oraz wektora prędkości punktu A względem punktu O:

$$
\begin{cases}
\bm{a}_\text{OA}(t) = \bm{a}^\text{t}_\text{OA}(t) + \bm{a}^\text{n}_\text{OA}(t) \\
\bm{a}^\text{t}_\text{OA}(t) = \bm{\varepsilon}_\text{O}(t) \times \bm{r}_\text{OA}(t) \\
\bm{a}^\text{n}_\text{OA}(t) = \bm{\omega}_\text{O}(t) \times \bm{v}_\text{OA}(t) = \bm{\omega}_\text{O}(t) \times ( \bm{\omega}_\text{O}(t) \times \bm{r}_\text{OA}(t) )
\end{cases}
$$

Po podstawieniu powyższych zależności do równań ruchu otrzymujemy:

$$
\begin{cases}
\bm{r}_{A}(t) = \bm{r}_\text{O}(t) + \bm{r}_\text{OA}(t)  \\
\bm{v}_{A}(t) = \bm{v}_\text{O}(t) + \bm{\omega}_\text{O}(t) \times \bm{r}_\text{OA}(t) \\
\bm{a}_{A}(t) = \bm{a}_\text{O}(t) + \bm{\varepsilon}_\text{O}(t) \times \bm{r}_\text{OA}(t) + \bm{\omega}_\text{O}(t) \times ( \bm{\omega}_\text{O}(t) \times \bm{r}_\text{OA}(t) )
\end{cases}
$$

Wektor położenia punktu A względem punktu O zależy od kąta obrotu w lokalnym układzie współrzędnych (x,y) o środku w punkcie O:

$$
\bm{r}_\text{OA}(t) = [ x_\text{OA}(t), y_\text{OA}(t) ]
$$

Składowe (x,y) zależą od kąta w następujący sposób:

$$
\begin{cases}
x_\text{OA}(t) = R \cos\phi(t) \\
y_\text{OA}(t) = R \sin\phi(t)
\end{cases}
$$

## Przydatne funkcje

Dowiedz się więcej, wpisując w konsolę `help nazwa_funkcji`

- [`cross`](https://www.mathworks.com/help/matlab/ref/cross.html) oblicza iloczyn wektorowy
- [`figure`](https://www.mathworks.com/help/matlab/ref/figure.html) tworzy rysunek
- [`viscircles`](https://www.mathworks.com/help/matlab/ref/viscircles.html) szkicuje koło lub okrąg
- [`plot`](https://www.mathworks.com/help/matlab/ref/plot.html) szkicuje wykres (tor ruchu)
- [`quiver`](https://www.mathworks.com/help/matlab/ref/quiver.html) szkicuje wektor (prędkość i przyspieszenie)
- [`drawnow`](https://www.mathworks.com/help/matlab/ref/drawnow.html) odświeża wyświelanie wykresu
- [`set`](https://www.mathworks.com/help/matlab/ref/set.html) uaktualnia parametry obiektu na wykresie
- [`pause`](https://www.mathworks.com/help/matlab/ref/pause.html) zatrzymuje wykonywanie kodu na n sekund (przydatne przy animowaniu)

Przykładowy kod dla wektora prędkości $v(t)$:
```matlab
figure

% poczatkowa pozycja wektora
wektor = quiver ( x(1), y(1), vx(1), vy(1) );  

% dla kolejnych chwil czasu...
for k = 2:length(t)  

    % modyifkuj wektor
    set( wektor, 'XData', x(k),  'YData', y(k),
                 'UData', vx(k), 'VData', vy(k) )

    % zatrzymaj klatke na czas (do dostosowania)
    pause( t(k)-t(k-1) )  

    % odswiez wykres
    drawnow

end
```

Alternatywne podejścia do animacji:
- [`getframe`](https://www.mathworks.com/help/matlab/ref/getframe.html) funkcja pomocnicza do animowania
- [`movie`](https://www.mathworks.com/help/matlab/ref/movie.html) odtwarza sekwencję wykresów jako animację
- [`animate`](https://www.mathworks.com/help/phased/ref/polarpattern.animate.html) pozwala animować zawartość wykresów poprzez ich przerysowanie