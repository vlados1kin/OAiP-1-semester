program laba1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  a, b, x, h: real;

const eps=0.0001;

function fun(x: real): real; //вычисление значения функции
const eps=0.0001;
  begin
    if abs(x)<eps then fun:=(2+2/3-exp(-1.5*0))*abs(cos(0+1))
      else if x<0 then fun:=(2+2/3-exp(ln(abs(x/2.7))/3)-exp(-1.5*x))*abs(cos(x+1))
      else fun:=(2+2/3+exp(ln(abs(x/2.7))/3)-exp(-1.5*x))*abs(cos(x+1));
  end;

begin
  write('Введите a = '); readln(a);
  write('Введите b = '); readln(b);
  write('Введите h = '); readln(h);
  x:=a;
  writeln('  Значение x   Значение y');
  if ((a<b) and (h<=0)) or ((a>b) and (h>=0)) or (a=b) then //проверка ввода данных
    begin
      if a<>b then
        begin
         writeln(a:9:3, fun(a):13:3);
         writeln(b:9:3, fun(b):13:3);
        end
      else writeln(a:9:3, fun(a):13:3)
    end
  else
    begin
      while abs(b-x)>abs(h) do //цикл А
        begin
          writeln(x:9:3, fun(x):13:3);
          x:=x+h;
        end;
      if (abs(b-x)<abs(h)) and (abs(b-x)>eps) then
        begin
          writeln(x:9:3, fun(x):13:3);
          writeln(b:9:3, fun(b):13:3);
        end
      else writeln(b:9:3, fun(b):13:3);
    end;
  readln;
end.
