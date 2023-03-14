program laba4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const n = 10;
type tmas = array[1..n] of integer;
var
  a: tmas;
  mask, sum, m, p, i: integer;
begin
  {randomize;
  for i:= 1 to n do begin //��������� ����
    a[i]:=random(n);      //���� A1
    writeln('a[',i,']=',a[i]);
  end;
  write(#13#10);
  m:=random(n);
  writeln('m=',m);
  write(#13#10);}

  for i:= 1 to n do begin //���� � ����������
    write('a[',i,']=');    //���� A2
    readln(a[i]);
  end;
  write(#13#10);
  write('m=');
  readln(m);
  write(#13#10);

  for mask:= 1 to (1 shl n)-1 do begin //������� ���� ����������� ��������� �������
    sum:=0;                            //���� B
    p:=1;
    for i:= 1 to n do begin //����� ��������� � ������������, ���� C
      if (mask and p)=p then sum:=sum+a[i];
      p:= p shl 1;
    end;

    if sum=m then begin //����� ������������
      p:=1;
      for i:= 1 to n do begin //���� D
        if (mask and p)=p then write('a[',i,']=',a[i],' ');
        p:= p shl 1;
      end;
      write(#13#10);
    end;
  end;
  readln;
end.
