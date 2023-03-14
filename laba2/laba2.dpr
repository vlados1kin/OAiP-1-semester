program laba2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  n, x, f: real;

begin
  x:=0.6;
  while x<=1.1+0.0001 do //цикл А
  begin
    n:=1;
    while n<=15 do //цикл B
    begin
      f:=f+exp(2/3-n)/sqrt(exp(n*ln(x))+exp((2*n-1)*ln(x)));
      if n>=10 then writeln(' n = ',n:5:3,' x = ',x:5:3,' f = ',f*exp(1/3*ln(1+sqr(cos(pi()*x/n)))):5:8);
      n:=n+1;
    end;
    f:=0;
    x:=x+0.25;
  end;
  readln;
end.
