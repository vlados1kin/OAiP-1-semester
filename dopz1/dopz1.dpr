program dopz1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  i1, i2, i3, i4, i5, i6, i7, i8, i, j, m, n: integer;
  s, a, zn: string;

function conv(i: integer): string;
  begin
    if i=1 then conv:='+'
      else if i=2 then conv:='-' else conv:='';
  end;

  begin
  //3.2 ������� �33
  write('������� m = ');
  readln(m);
  for i1 := 1 to 3 do               //���� �1 (����� �1..�8 ���������� ��� ��������� �����������
    for i2 := 1 to 3 do             //���� �2  '+', '-' � ' ' ����� ������� � ����� 123456789)
      for i3 := 1 to 3 do           //���� �3
        for i4 := 1 to 3 do         //���� �4
          for i5 := 1 to 3 do       //���� �5
            for i6 := 1 to 3 do     //���� �6
              for i7 := 1 to 3 do   //���� �7
                for i8 := 1 to 3 do //���� �8
                  begin
                    zn:='+';
                    n:=0;
                    a:='';
                    s:='1'+conv(i1)+'2'+conv(i2)+'3'+conv(i3)+'4'+conv(i4)+'5'+conv(i5)+'6'+conv(i6)+'7'+conv(i7)+'8'+conv(i8)+'9';
                    //���������� s ������������� ���������� �����������
                    for i:= 1 to length(s) do //���� B (�������������� �������� ��� ������� � ������ s)
                      begin
                        if (s[i]<>'+') and (s[i]<>'-') then
                        begin
                        a:=a+s[i];
                        if s[i]='9' then if zn='+' then n:=n+StrToInt(a) else n:=n-StrToInt(a);
                        end
                        else
                        begin
                          if zn='+' then n:=n+StrToInt(a) else n:=n-StrToInt(a); //����� n ������������� ��������� ����������
                          zn:=s[i];
                          a:='';
                        end;
                      end;
                    if n=m then //���������� ����� n ������������ c �������������� ������ m
                    begin
                      writeln(s+'='+IntToStr(m));
                      j:=1; //j-�������, ���� ������� ���� �� ���� �����������, �� j:=1
                    end;
                  end;
  if j<>1 then writeln('����������� ������ ����������');
  readln;
end.
