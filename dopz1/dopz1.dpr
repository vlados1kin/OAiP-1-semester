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
  //3.2 задание №33
  write('Введите m = ');
  readln(m);
  for i1 := 1 to 3 do               //цикл А1 (циклы А1..А8 перебирают все возможные расстановки
    for i2 := 1 to 3 do             //цикл А2  '+', '-' и ' ' между цифрами в числе 123456789)
      for i3 := 1 to 3 do           //цикл А3
        for i4 := 1 to 3 do         //цикл А4
          for i5 := 1 to 3 do       //цикл А5
            for i6 := 1 to 3 do     //цикл А6
              for i7 := 1 to 3 do   //цикл А7
                for i8 := 1 to 3 do //цикл А8
                  begin
                    zn:='+';
                    n:=0;
                    a:='';
                    s:='1'+conv(i1)+'2'+conv(i2)+'3'+conv(i3)+'4'+conv(i4)+'5'+conv(i5)+'6'+conv(i6)+'7'+conv(i7)+'8'+conv(i8)+'9';
                    //переменной s присваивается конкретная расстановка
                    for i:= 1 to length(s) do //цикл B (арифметические операции над числами в строке s)
                      begin
                        if (s[i]<>'+') and (s[i]<>'-') then
                        begin
                        a:=a+s[i];
                        if s[i]='9' then if zn='+' then n:=n+StrToInt(a) else n:=n-StrToInt(a);
                        end
                        else
                        begin
                          if zn='+' then n:=n+StrToInt(a) else n:=n-StrToInt(a); //числу n присваивается результат вычислений
                          zn:=s[i];
                          a:='';
                        end;
                      end;
                    if n=m then //полученное число n сравнивается c первоначальным числом m
                    begin
                      writeln(s+'='+IntToStr(m));
                      j:=1; //j-счетчик, если нашлась хотя бы одна расстановка, то j:=1
                    end;
                  end;
  if j<>1 then writeln('Расстановка знаков невозможна');
  readln;
end.
