program laba5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const n=2000;

type tmas=array[1..n] of integer;
     th=array[1..100] of integer; // th - массив шагов
var
  mas, mas1, mas2: tmas;
  h: th;
  i, p, k, comp, exch: integer;

procedure sort1(length: integer; var mas1: tmas); // шейкерная сортировка
var i, L, R, temp: integer;
begin
  L:=2;
  R:=length;
  comp:=0;
  exch:=0;
  repeat // цикл A
    for i:= R downto L do begin // цикл A1
      if mas1[i-1]>mas1[i] then begin
        temp:=mas1[i];
        mas1[i]:=mas1[i-1];
        mas1[i-1]:=temp;
        inc(exch,3);
      end;
      inc(comp);
    end;
    inc(L);
    for i:=L to R do begin // цикл A2
      if mas1[i-1]>mas1[i] then begin
        temp:=mas1[i];
        mas1[i]:=mas1[i-1];
        mas1[i-1]:=temp;
        inc(exch,3);
      end;
      inc(comp);
    end;
    dec(R);
  until L>R;
end;

procedure sort2(length: integer; var mas2: tmas; h: th); // сортировка Шелла
var i, j, temp, m: integer;
begin
  comp:=0;
  exch:=0;
  for i:= 1 to k do begin // цикл B
    for j:= h[i]+1 to length do begin // цикл B1
      temp:=mas2[j];
      m:=j-h[i];
      while (m>=1) and (mas2[m]>temp) do begin // цикл B2
        mas2[m+h[i]]:=mas2[m];
        m:=m-h[i];
        inc(comp);
        inc(exch);
      end;
      mas2[m+h[i]]:=temp;
      inc(comp);
      inc(exch,2);
    end;
  end;
end;

procedure inv(length: integer; var mas: tmas); //размещение элементов в обратном порядке
var i, temp: integer;
begin
  for i:= 1 to (length div 2) do begin //цикл C
    temp:=mas[i];
    mas[i]:=mas[length-i+1];
    mas[length-i+1]:=temp;
  end;
end;

begin
  // comp - число сравнений
  // exch - число присвоений
  // sort1 - шейкерная сортировка
  // sort2 - сортировка Шелла

  writeln('+------------------+-------------------------------+-------------------------------+');
  writeln('| Тип              | Шейкерная сортировка          | Сортировка Шелла              |');
  writeln('| массива          +---------------+---------------+---------------+---------------+');
  writeln('|                  | Число         | Число         | Число         | Число         |');
  writeln('|                  | сравнений     | обменов       | сравнений     | обменов       |');
  writeln('+------------------+---------------+---------------+---------------+---------------+');

  randomize;
  for i:=1 to n do mas[i]:=random(n); // заполнение эталонного массива
                                      // цикл D1

  k:=trunc(ln(n)/ln(3))-1;                  // вычисление шагов для сортировки Шелла
  h[k]:=1; //h[k]=1 k-ый элемент            // k - число шагов в последовательности шагов в с. Шелла
  for i:= k-1 downto 1 do h[i]:=3*h[i+1]+1; // цикл D2

  p:=10;

  for i:=1 to 3 do begin // цикл D3

    mas1:=mas;
    mas2:=mas;

    write('| ',p:4,' эл.неотс.   |');
    sort1(p,mas1);
    write(comp:14,' |',exch:14,' |');
    sort2(p,mas2,h);
    writeln(comp:14,' |',exch:14,' |');
    writeln('+------------------+---------------+---------------+---------------+---------------+');

    write('| ',p:4,' эл.отс.     |');
    sort1(p,mas1);
    write(comp:14,' |',exch:14,' |');
    sort2(p,mas2,h);
    writeln(comp:14,' |',exch:14,' |');
    writeln('+------------------+---------------+---------------+---------------+---------------+');

    write('| ',p:4,' эл.обр.пор. |');
    inv(p,mas1); sort1(p,mas1);
    write(comp:14,' |',exch:14,' |');
    inv(p,mas2); sort2(p,mas2,h);
    writeln(comp:14,' |',exch:14,' |');
    writeln('+------------------+---------------+---------------+---------------+---------------+');

    if i=1 then p:=100;
    if i=2 then p:=2000;

  end;
  readln;
end.
