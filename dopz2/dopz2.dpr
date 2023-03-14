program dopz2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  y, x, a: real;
  i: integer;

begin
  //№3.3 2)ж
  x:=0.5;
  write('x':4); writeln('y':10);
  while x<=0.8+0.0001 do //Цикл A
  begin
    y:=0;
    a:=11+21*x;
    for i := 10 downto 1 do a:=i+(2*i-1)*x-i*i*x*(1+x)/a; //Цикл B
    y:=x/a;
    write(x:6:3); writeln(y:11:5);
    x:=x+0.05;
  end;
  readln;
end.
