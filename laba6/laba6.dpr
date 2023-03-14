program laba6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type tmas=array[1..10,1..10] of integer;

const input0: tmas =((1,1,1,1,1,0,1,1,1,1),
                     (1,0,0,0,0,0,0,0,0,1),
                     (1,0,1,1,1,0,1,1,0,1),
                     (1,0,1,1,0,0,1,1,0,1),
                     (1,0,1,1,0,1,1,1,0,1),
                     (1,0,1,1,0,0,0,0,0,1),
                     (1,0,1,1,1,0,1,1,0,1),
                     (1,0,1,1,1,0,1,1,0,1),
                     (1,0,0,0,0,0,0,0,0,1),
                     (1,1,1,1,1,1,1,1,1,1));

var
  input: text;
  mas, mapmas: tmas;
  line, FileName, temp: string;
  i, j, n, i0, j0, wave: integer;

procedure step(var i,j: integer);
var fl: boolean;
begin
  fl:=true;
  if (i<n) and (mapmas[i,j]-mapmas[i+1,j]=1) and fl then begin
    i:=i+1;
    fl:=false;
  end;
  if (i>1) and (mapmas[i,j]-mapmas[i-1,j]=1) and fl then begin
    i:=i-1;
    fl:=false;
  end;
  if (j<n) and (mapmas[i,j]-mapmas[i,j+1]=1) and fl then begin
    j:=j+1;
    fl:=false;
  end;
  if (j>1) and (mapmas[i,j]-mapmas[i,j-1]=1) and fl then begin
    j:=j-1;
    fl:=false;
  end;
end;

procedure findmin;
var a, b, amin, bmin: integer;
begin
  a:=1;
  b:=1;
  amin:=1;
  bmin:=1;
  for a:=1 to n do if mapmas[a,b]<=mapmas[amin,bmin] then begin //B1
    amin:=a;
    bmin:=b;
  end;
  a:=n;
  b:=1;
  for b:=1 to n do if mapmas[a,b]<=mapmas[amin,bmin] then begin //B2
    amin:=a;
    bmin:=b;
  end;
  a:=n;
  b:=n;
  for a:=n downto 1 do if mapmas[a,b]<=mapmas[amin,bmin] then begin //B3
    amin:=a;
    bmin:=b;
  end;
  a:=1;
  b:=n;
  for b:=n downto 1 do if mapmas[a,b]<=mapmas[amin,bmin] then begin //B4
    amin:=a;
    bmin:=b;
  end;
  i:=amin;
  j:=bmin;
end;

begin
  //чтение из файла input_.txt
  //вместо _ : 1, 2, 3, 4, 5, 6

  FileName:='D:\BSUIR\labs\laba6\input4.txt';
  AssignFile(input,FileName);
  reset(input);

  readln(input,line);      //размер лабиринта
  n:=StrToInt(line);
  writeln('Размер лабиринта: ',n);

  i:=1;
  while (not EOF(input)) do begin //A1
    readln(input,line);
    //помещаем числа из строки в массив
    for j:=1 to n do begin //A2
      temp:=line[2*j-1];
      mas[i,j]:=StrToInt(temp);
    end;
    i:=i+1;
  end;
  CloseFile(input);

  //ввод предопределенной матрицы
  {write('Введите длину массива: ');readln(n);
  mas:=input0;}

  //вывод лабиринта
  for i:=1 to n do begin //A3
    for j:=1 to n do write(mas[i,j],' '); //A4
    writeln;
  end;

  write('Начальные координаты: '); readln(i0,j0);

  for i:=1 to n do for j:=1 to n do mapmas[i,j]:=100; //A5 //A6

  //заполнение карты
  mapmas[i0,j0]:=1;
  wave:=1;
  repeat //A7
    wave:=wave+1;
    for i:=1 to n do //A8
      for j:=1 to n do //A9
        if mapmas[i,j]=wave-1 then begin
          if (j<n) and (mapmas[i,j+1]=100) and (mas[i,j+1]=0) then mapmas[i,j+1]:=wave;
          if (j>1) and (mapmas[i,j-1]=100) and (mas[i,j-1]=0) then mapmas[i,j-1]:=wave;
          if (i<n) and (mapmas[i+1,j]=100) and (mas[i+1,j]=0) then mapmas[i+1,j]:=wave;
          if (i>1) and (mapmas[i-1,j]=100) and (mas[i-1,j]=0) then mapmas[i-1,j]:=wave;
        end;
  until wave>99;

  //карта

  {for i:=1 to n do begin
    for j:=1 to n do write(mapmas[i,j],' ');
    writeln;
  end;}

  //путь

  findmin;
  if mapmas[i,j]=100 then writeln('Выйти невозможно') else begin
    mas[i,j]:=2;
    repeat //A10
      step(i,j);
      mas[i,j]:=2;
    until (i=i0) and (j=j0);
    for i:=1 to n do begin //A11
      for j:=1 to n do write(mas[i,j],' '); //A12
      writeln;
    end;
  end;

  readln;
end.
