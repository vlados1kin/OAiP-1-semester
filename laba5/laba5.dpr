program laba5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const n=2000;

type tmas=array[1..n] of integer;
     th=array[1..100] of integer; // th - ������ �����
var
  mas, mas1, mas2: tmas;
  h: th;
  i, p, k, comp, exch: integer;

procedure sort1(length: integer; var mas1: tmas); // ��������� ����������
var i, L, R, temp: integer;
begin
  L:=2;
  R:=length;
  comp:=0;
  exch:=0;
  repeat // ���� A
    for i:= R downto L do begin // ���� A1
      if mas1[i-1]>mas1[i] then begin
        temp:=mas1[i];
        mas1[i]:=mas1[i-1];
        mas1[i-1]:=temp;
        inc(exch,3);
      end;
      inc(comp);
    end;
    inc(L);
    for i:=L to R do begin // ���� A2
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

procedure sort2(length: integer; var mas2: tmas; h: th); // ���������� �����
var i, j, temp, m: integer;
begin
  comp:=0;
  exch:=0;
  for i:= 1 to k do begin // ���� B
    for j:= h[i]+1 to length do begin // ���� B1
      temp:=mas2[j];
      m:=j-h[i];
      while (m>=1) and (mas2[m]>temp) do begin // ���� B2
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

procedure inv(length: integer; var mas: tmas); //���������� ��������� � �������� �������
var i, temp: integer;
begin
  for i:= 1 to (length div 2) do begin //���� C
    temp:=mas[i];
    mas[i]:=mas[length-i+1];
    mas[length-i+1]:=temp;
  end;
end;

begin
  // comp - ����� ���������
  // exch - ����� ����������
  // sort1 - ��������� ����������
  // sort2 - ���������� �����

  writeln('+------------------+-------------------------------+-------------------------------+');
  writeln('| ���              | ��������� ����������          | ���������� �����              |');
  writeln('| �������          +---------------+---------------+---------------+---------------+');
  writeln('|                  | �����         | �����         | �����         | �����         |');
  writeln('|                  | ���������     | �������       | ���������     | �������       |');
  writeln('+------------------+---------------+---------------+---------------+---------------+');

  randomize;
  for i:=1 to n do mas[i]:=random(n); // ���������� ���������� �������
                                      // ���� D1

  k:=trunc(ln(n)/ln(3))-1;                  // ���������� ����� ��� ���������� �����
  h[k]:=1; //h[k]=1 k-�� �������            // k - ����� ����� � ������������������ ����� � �. �����
  for i:= k-1 downto 1 do h[i]:=3*h[i+1]+1; // ���� D2

  p:=10;

  for i:=1 to 3 do begin // ���� D3

    mas1:=mas;
    mas2:=mas;

    write('| ',p:4,' ��.�����.   |');
    sort1(p,mas1);
    write(comp:14,' |',exch:14,' |');
    sort2(p,mas2,h);
    writeln(comp:14,' |',exch:14,' |');
    writeln('+------------------+---------------+---------------+---------------+---------------+');

    write('| ',p:4,' ��.���.     |');
    sort1(p,mas1);
    write(comp:14,' |',exch:14,' |');
    sort2(p,mas2,h);
    writeln(comp:14,' |',exch:14,' |');
    writeln('+------------------+---------------+---------------+---------------+---------------+');

    write('| ',p:4,' ��.���.���. |');
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
