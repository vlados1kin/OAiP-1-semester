program dopz3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  x, a, b, h: real;

const eps=0.001;

function y(x: real): real;
var
  delta, curr, prev, f: real;
  i: integer;
const eps=0.001;
begin
  f:=x*x-2*x;
  while abs(x)>pi() do if x>0 then x:=x-2*pi() else x:=x+2*pi(); //÷икл C
  curr:=x;
  prev:=x;
  delta:=abs(curr);
  i:=2;
  while delta>eps do //÷икл A
  begin
    f:=f-curr;
    curr:=-prev*x*x/(i*(i+1));
    prev:=curr;
    delta:=abs(curr);
    i:=i+2;
  end;
  y:=f;
end;

begin
  write('¬ведите a = '); readln(a);
  write('¬ведите b = '); readln(b);
  write('¬ведите h = '); readln(h);
  x:=a;
  writeln('  «начение x   «начение y');
  if ((a<b) and (h<=0)) or ((a>b) and (h>=0)) or (abs(a-b)<0.0001) then //проверка ввода данных
    begin
      if abs(a-b)>0.0001 then
        begin
         writeln(a:9:3, y(a):14:4);
         writeln(b:9:3, y(b):14:4);
        end
      else writeln(a:9:3, y(a):13:3)
    end
  else
    begin
      while abs(b-x)>=abs(h) do //÷икл B
        begin
          writeln(x:9:3, y(x):14:4);
          x:=x+h;
        end;
      if (abs(b-x)<abs(h)) and (abs(b-x)>0.0001) then
        begin
          writeln(x:9:3, y(x):14:4);
          writeln(b:9:3, y(b):14:4);
        end
      else writeln(b:9:3, y(b):14:4);
    end;
  readln;
end.
