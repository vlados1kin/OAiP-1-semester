program laba3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  f1, f2, x, prev, curr, delta, eps, n: real;
  fl1, fl2: boolean;
  i: integer;

begin
  writeln('+-------+-----------------+----------------------+----------------------+----------------------+');
  writeln('|       |                 |     e=0.01           |     e=0.001          |     e=0.0001         |');
  writeln('|   x   |      f1(x)      +------------------+---+------------------+---+------------------+---+');
  writeln('|       |                 |     f2(x)        | N |     f2(x)        | N |     f2(x)        | N |');
  writeln('+-------+-----------------+------------------+---+------------------+---+------------------+---+');
  x:=0;
  repeat
    f1:=ln(1+sqrt(1+x*x));
    write('|',x:6:3,' |',f1:16:13,' |');
    curr:=-x*x/4;
    prev:=-x*x/4;
    delta:=abs(curr);
    f2:=ln(2)-curr;
    n:=1;
    i:=1;
    eps:=0.01;
    fl1:=true;
    fl2:=true;
    repeat
      if (delta<eps) and fl1 then
        begin
          write(' ',f2:16:13,' |',n:3:0,'|');
          fl1:=false;
          eps:=eps/10;
        end;
      if (delta<eps) and fl2 then
        begin
          write(' ',f2:16:13,' |',n:3:0,'|');
          fl2:=false;
          eps:=eps/10;
        end;
      if delta>eps then
        begin
          curr:=-prev*(2*i)*(2*i+1)*x*x/(2*2*(i+1)*(i+1));
          prev:=curr;
          delta:=abs(curr);
          f2:=f2-curr;
          n:=n+1;
        end;
      i:=i+1;
    until (delta<eps) and (not fl2); //Цикл B
    writeln(' ',f2:16:13,' |',n:3:0,'|');
    x:=x+0.04;
    writeln('+-------+-----------------+------------------+---+------------------+---+------------------+---+');
  until x>0.8+0.001; //Цикл А
  readln;
end.
