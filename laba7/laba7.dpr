program laba7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const glas=('aeiouyAEIOUY');
var
  s, s1, s2, st1, st2, temp: string;
  len, pr, i, j, k, j1, j2, j1_min, j2_min, count, count_glas: integer;
  w: real;

begin
  writeln('Строка s'); writeln;
  readln(s);
  s:=s+' ';
  len:=length(s); //длина массива
  while (s[1]=' ') and (len>1) do begin //удал. пробелов в начале
    delete(s,1,1);
    dec(len);
  end;
  while (s[len-1]=' ') and (len>1) do begin //удал. пробелов в конце, оставить один в конце
    delete(s,len-1,1);
    dec(len);
  end;
  j:=1;
  while j<=len-1 do //удал. пробелов между словами
    if (s[j]=' ') and (s[j+1]=' ') then begin
      delete(s,j,1);
      dec(len);
    end
    else inc(j);

  i:=1;
  while (s[len-i]<>' ') and (i<len) do inc(i); //находим предпоследний пробел в строке
  temp:=copy(s,len-i,i+1); //копируем последнее слово
  s:=' '+s;
  while (pos(temp,s)<>0) and (s<>'') do delete(s,pos(temp,s),i); //удаляем в строке слова, равные последнему
  delete(s,1,1);

  //п.1

  writeln; writeln('Строка s1'); writeln; //s1 - искомая строка
  st1:=s; //st1 - строка для задания из п.1
  k:=0; //1 - существует пара, 0 - нет
  while st1<>'' do begin
    temp:=st1;
    pr:=pos(' ',temp);
    s1:=copy(temp,1,pr); //копируем первое слово
    delete(temp,1,pr); //удаляем первое слово
    while temp<>'' do begin //находим инверсии
      if pos(' ',temp)<>pr then delete(temp,1,pos(' ',temp)) //сравниваем длину следующего слова
      else begin
        i:=1;
        while (i<pr) and (s1[i]=temp[pr-i]) do inc(i); //сравниваем посимвольно слова
        if i=pr then begin
          writeln(s1,copy(temp,1,pr));
          k:=1;
        end;
        delete(temp,1,pr);
      end;
    end;
    delete(st1,1,pr);
  end;
  if k=0 then writeln('*Пустая строка*');

  //п.2

  writeln; writeln('Строка s2'); writeln;
  st2:=s; //st2 - строка для задания из п.2
  s2:=''; //s2 - искомая строка
  while st2<>'' do begin
    temp:=''; //слово из строки
    j1:=1;
    j2:=1;
    w:=1000; //доля
    count:=0; //количество букв в слове
    count_glas:=0; //количество гласных в слове
    j1_min:=1;
    j2_min:=1;
    while j2<=length(st2) do begin //нахождение слова с минимальной долей гласных
      if st2[j2]=' ' then begin
        if (count_glas*100/count)<=w then begin
          w:=count_glas*100/count;
          temp:=copy(st2,j1,j2-j1+1);
          j1_min:=j1;
          j2_min:=j2;
        end;
        j1:=j2+1;
        inc(j2);
        count:=0;
        count_glas:=0;
      end;
      if pos(st2[j2],glas)<>0 then inc(count_glas);
      inc(count);
      inc(j2);
    end;
    s2:=s2+temp; //конкатинация строк
    delete(st2,j1_min,j2_min-j1_min+1); //удаление найденного слова из строки
  end;
  if s2='' then writeln('*Пустая строка*') else writeln(s2);

  readln;
end.
