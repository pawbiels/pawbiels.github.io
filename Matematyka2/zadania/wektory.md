# Operacje w przestrzeni wektorowej

Przygotuj skrypt .m wykonujący poniższe polecenie. Po zakończeniu wklej zawartość skryptu (kod jako tekst) w polu tekstowym odpowiedzi do zadania.

## Polecenie

Zdefiniuj dwa wektory $\vec{a}$ oraz $\vec{b}$ w przestrzeni trójwymiarowej, wykorzystując cyfry z Twojego numeru indeksu. Wyznacz wektor $\vec{c}$ stanowiący iloczyn wektorowy $\vec{a}\times\vec{b}$. Następnie narysuj układ wszystkich trzech wektorów: wektory $\vec{a}$ i $\vec{b}$ zaczepione w punkcie wskazanym przez wektor $\vec{c}$ wychodzący z punktu $(0,0,0)$. W punkcie zaczepienia wektórów $\vec{a}$ i $\vec{b}$ narysuj również układ trzech wersorów bazowych $\vec{i}, \vec{j}, \vec{k}$ układu $XYZ$ tworzących bazę:

$$
\bm{e} =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

Zdefiniuj macierz obrotu $\bm{R_x}$ względem osi $X$ o kąt $\alpha$ stanowiący (w stopniach) trzykrotność sumy wszystkich cyfr w Twoim numerze indeksu. Macierz obrotu stanowi jednocześnie bazę (wersory) nowego układu współrzędnych. Pamiętaj o zamianie kąta na radiany do celów obliczeniowych.

$$
\bm{R_x} =
\begin{bmatrix}
1 & 0 & 0 \\
0 & \cos\alpha & -\sin\alpha \\
0 & \sin\alpha & \cos\alpha
\end{bmatrix}
$$

Obróc wszystkie trzy wektory o kąt $\alpha$ względem osi $X$ poprzez przemnożenie ich **z lewej strony** przez macierz obrotu. Uwaga! Wektory muszą mieć do tego celu reprezentację **pionową**, czyli stanowić macierz $3\times1$.

$$ \vec{v}_\text{rot} = \bm{R_x} \vec{v} $$

Następnie nanieś **na istniejący rysunek** układ obróconych wektorów $\vec{a}_\text{rot}$ i $\vec{b}_\text{rot}$, zaczepionych w punkcie wskazanym przez $\vec{c}_\text{rot}$. W tym samym punkcie narysuj układ trzech wersorów bazowych obróconego układu współrzędnych, zawartych w macierzy obrotu $\bm{R_x}$.

Opisz wektory legendą; niech każdy wektor (obrócony lub nie) ma swój indywidualny kolor. Ustaw pozycję kamery tak, aby wszystkie wektory były dobrze widoczne w 3D. Następnie zapisz rysunek do pliku `.png`.

## Przydatne funkcje

### Ogólne

Wywołanie `help [komenda]` w konsoli wyświetla szczegółowy opis dowolnej komendy i jej parametrów.

Każdy skrypt zaczynamy od trzech komend:
- `clear` czyści bazę zmiennych,
- `close all` zamyka istniejące rysunki,
- `clc` usuwa zawartość konsoli.

Definicja w skrypcie zmiennej spowoduje wyświetlenie jej wartości w konsoli, natomiast średnik `var = ();` definiuje zmienną bez wyświetlania.

Klawisz `F5` uruchamia skrypt od początku i jednocześnie zapisuje go (*quicksave*).

### Działania na wektorach i macierzach

Definicja wektora: `v = [v(1) v(2) v(3)]` (macierz $1\times3$) lub `v = [v(1); v(2); v(3)]` (macierz $3\times1$)

Definicja macierzy np. $2\times3$:
```matlab
A = [A(1,1) A(1,2) A(1,3)
     A(2,1) A(2,2) A(2,3)]
```
lub
```matlab
A = [A(1,1) A(1,2) A(1,3); A(2,1) A(2,2) A(2,3)]
```

`v(2)` przywołuje drugą składową wektora `v`

`A(1,2)` przywołuje element macierzy `A` z pierwszego wiersza i drugiej kolumny

`A(:,2)` wyciąga wektor stanowiący drugą kolumnę macierzy `A`

Transpozycja macierzy lub wektora: `v_trans = v'`

Iloczyn skalarny: `dot(a,b)` lub `a*b`

Iloczyn wektorowy: `cross(a,b)`

Mnożenie macierzy: `A*B` (jedna z macierzy może być wektorem)

### Rysowanie

Otwarcie nowego rysunku: `fig1 = figure(1)`

Naniesienie na rysunek wektora w 3D:
```matlab
quiver3(x,y,z, u,v,w, skala, 'kolor', 'LineWidth',grubość)
```
gdzie $x, y, z$ to punkt zaczepienia wektora, a $u, v, w$ to jego składowe. Kolor, grubość i skalę wektora można dostosować (wpisz `help quiver3` w konsoli). Skala `1` oddaje rzeczywistą długość wektora.

Komenda umożliwiająca nanoszenie kolejnych obiektów na tym samym rysunku: `hold on`

Ustawienie jednakowej skali na wszystkich osiach: `axis equal`

Tytuł wykresu: `title('tekst')`

Opisy osi: `xlabel('tekst')`, `ylabel()`, `zlabel()`

Wyświetlanie legendy: `legend('label1', 'label2', 'label3', ...)` gdzie 'label' oznacza etykiety kolejnych obiektów. Użycie pustej etykiety `''` pomija obiekt w legendzie.

Ustawienie widoku 3D: `view(az,el)`, gdzie `az` oznacza kąt padania (w stopniach), a `el` wysokość punktu widzenia. Parametry można odczytać z wykresu po zaznaczeniu opcji `Show code`.

Wyświetlanie siatki w układzie współrzędnych: `grid on`

Zapis rysunku do formatu .fig: `saveas(fig1, 'fig1.fig')`

Zapis rysunku do formatu .png: `saveas(fig1, 'fig1.png')`