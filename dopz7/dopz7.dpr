program dopz7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  s1, s2, sdel: string;
  i: integer;
  fl: boolean;

begin
  writeln('������ ������'); readln(s1);
  writeln('������ ������'); readln(s2);
  i:=1;
  fl:=true;
  sdel:='';
  while (i<=length(s2)) and (fl) do begin
    if pos(s2[i],s1)<>0 then begin
      sdel:=sdel+copy(s1,1,pos(s2[i],s1)-1);
      delete(s1,1,pos(s2[i],s1));
    end
    else fl:=false;
    inc(i);
  end;
  sdel:=sdel+s1;
  if fl then begin
    writeln('��, �����');
    writeln('������� �������: ',sdel)
  end
  else writeln('���, ������');
  readln;
end.
