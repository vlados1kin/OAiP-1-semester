program dopz3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  x, a, b, h: real;
  k: integer;

const eps=0.001;

function y(n: real): real;
var
  delta, curr, prev, f, z: real;
  i: integer;
const eps=0.001;
begin
  f:=0;
  x:=n/(n+2);
  z:=x;
  curr:=x;
  i:=3;
  repeat
    f:=f+curr;
    z:=z*x*x;
    curr:=z/i;
    delta:=abs(curr);
    i:=i+1;
  until delta<eps;
  y:=2*f;
end;

begin
  write('¬ведите начальное x = '); readln(a);
  write('¬ведите конечное x = '); readln(b);
  write('¬ведите шаг = '); readln(h);
  x:=a;
  writeln('  «начение x   «начение y');
  if ((a<b) and (h<=0)) or ((a>b) and (h>=0)) or (abs(a-b)<0.0001) then //проверка ввода данных
    begin
      if (abs(a-b)>0.0001) and (a>-1) and (b>-1) then
        begin
          writeln(a:9:3, y(a):14:4);
          writeln(b:9:3, y(b):14:4);
          k:=1;
        end
      else if a>-1 then
        begin
          writeln(a:9:3, y(a):14:4);
          k:=1;
        end;
    end
  else
    begin
      while abs(b-x)>=abs(h) do //÷икл B
        begin
          if x>-1 then writeln(x:9:3, y(x):14:4);
          x:=x+h;
          k:=1
        end;
      if (abs(b-x)<abs(h)) and (abs(b-x)>0.0001) and (x>-1) and (b>-1) then
        begin
          writeln(x:9:3, y(x):14:4);
          writeln(b:9:3, y(b):14:4);
          k:=1;
        end
      else if b>-1 then
        begin
          writeln(b:9:3, y(b):14:4);
          k:=1;
        end;
    end;
  if k<>1 then writeln('¬ведЄнные числа не вход€т в область определени€');
  readln;
end.
