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
  delta, curr, f, z: real;
  i: integer;
const eps=0.001;
begin
  f:=0;
  z:=x;
  curr:=x;
  i:=2;
  repeat
    f:=f+curr;
    z:=-z*x;
    curr:=z/i;
    delta:=abs(curr);
    i:=i+1;
  until delta<eps; //���� �
  y:=f;
end;

begin
  write('������� ��������� x = '); readln(a);
  write('������� �������� x = '); readln(b);
  write('������� ��� = '); readln(h);
  if (abs(a)<1) and (abs(b)<1) then
  begin
  x:=a;
  writeln('  �������� x   �������� y');
  if ((a<b) and (h<=0)) or ((a>b) and (h>=0)) or (abs(a-b)<0.0001) then //�������� ����� ������
    begin
      if abs(a-b)>0.0001 then
        begin
         writeln(a:9:3, y(a):14:4);
         writeln(b:9:3, y(b):14:4);
        end
      else writeln(a:9:3, y(a):14:4)
    end
  else
    begin
      while abs(b-x)>=abs(h) do //���� B
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
  end
  else writeln('�������� �������� �� ������ � ������� ����������');
  readln;
end.
