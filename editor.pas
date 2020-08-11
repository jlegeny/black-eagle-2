Program Editor;

Uses Crt,Graph,Mysina,Palette;


Var Gd,Gm:Integer;

    Obr  : Array[1..32,1..32] of byte;
    Quick: Array[1..32,1..32] of byte;
    Posuv: Array[1..32,1..32] of byte;
    Back : Array[1..32,1..32] of byte;
    Decr : Array[1..32,1..32] of byte;


    bb:byte;
    A,B,C,x,y,z,i:Integer;
    C1,C2:byte;
    s,s1:String;
    z1,z2:Integer;
    f:text;
    sb:File of byte;
    d:byte;
    Curent,Subor:String;
    Ch,Chs:Char;
    l,o:Integer;
    PalR,PalG,PalB:Byte;
    r:reaL;
    pr,pg,pb,rd,gr,bl:byte;
    wmode:Integer;

    c1r,c1g,c1b,c2r,c2g,c2b:Byte;



Const
           Path  = 'C:\!smugg~1\Blacke~1\';
           Palet = 'pal1.pal';
           Ver   = 'v3.2.16';

           BackSp  = #8;       PgUp  = #201;      CtrlPgUp = #138;
           Tab     = #9;       PgDn  = #209;      CtrlPgDn = #246;
           Enter   = #13;      Endkey= #207;      CtrlEnd  = #245;
           Esc     = #27;      Home  = #199;      CtrlHome = #247;
           STab    = #143;     Ins   = #210;      Del      = #211;

           LArr    = #75;      CtrlLArr    = #243;    CtrlPrtsc = #242;
           RArr    = #77;      CtrlRArr    = #244;
           UArr    = #72;
           DArr    = #80;


           CtrlA  = #1;          AltA  = #286;        Alt1 = #376;
           CtrlB  = #2;          AltB  = #304;        Alt2 = #377;
           CtrlC  = #3;          AltC  = #302;        Alt3 = #378;
           CtrlD  = #4;          AltD  = #288;        Alt4 = #379;
           CtrlE  = #5;          AltE  = #274;        Alt5 = #380;
           CtrlF  = #6;          AltF  = #289;        Alt6 = #381;
           CtrlG  = #7;          AltG  = #290;        Alt7 = #382;
           CtrlH  = #8;          AltH  = #291;        Alt8 = #383;
           CtrlI  = #9;          AltI  = #279;        Alt9 = #384;
           CtrlJ  = #10;         AltJ  = #292;        Alt0 = #385;
           CtrlK  = #11;         AltK  = #293;        Altminus  = #136;
           CtrlL  = #12;         AltL  = #294;        Altequals = #137;
           CtrlM  = #13;         AltM  = #306;
           CtrlN  = #14;         AltN  = #305;
           CtrlO  = #15;         AltO  = #280;
           CtrlP  = #16;         AltP  = #281;
           CtrlQ  = #17;         AltQ  = #272;
           CtrlR  = #18;         AltR  = #275;
           CtrlS  = #19;         AltS  = #287;
           CtrlT  = #20;         AltT  = #276;
           CtrlU  = #21;         AltU  = #278;
           CtrlV  = #22;         AltV  = #303;
           CtrlW  = #23;         AltW  = #273;
           CtrlX  = #24;         AltX  = #301;
           CtrlY  = #25;         AltY  = #277;
           CtrlZ  = #26;         AltZ  = #300;

           F1  = #315;              sF1  = #212;
           F2  = #316;              sF2  = #213;
           F3  = #317;              sF3  = #214;
           F4  = #318;              sF4  = #215;
           F5  = #319;              sF5  = #216;
           F6  = #320;              sF6  = #217;
           F7  = #321;              sF7  = #218;
           F8  = #322;              sF8  = #219;
           F9  = #323;              sF9  = #220;
           F10 = #324;              sF10 = #221;
           F11 = #325;              sF11 = #141;
           F12 = #326;              sF12 = #142;
{}


Function FileEx(FileName: String): Boolean;
var
 F: file;
begin
 {$I-}
 Assign(F, FileName);
 FileMode := 0;
 Reset(F);
 Close(F);
 {$I+}
 FileEx := (IOResult = 0) and (FileName <> '');
end;  { FileExists }

(************************************************************************)
(************************************************************************)


Procedure EnterName;
Begin

  SetColor(15);
  OutTextXY(55,190,'Subor:');

  Repeat
   Ch:=Readkey;


    If (Ch<>#13) and (Ch<>#27)and (Ch<>#8) and (Ch<>' ') then
     begin
      SetColor(0);
      OutTextXY(54,190,'      ллллллллллллллллллллллл');
      Subor:=Subor+Ch;
      SetColor(7);
      OutTextXY(108,190,subor);
     end;

    If Ch=#8 then
     begin
      delete(subor,length(subor),1);
      SetColor(0);
      OutTextXY(54,190,'      ллллллллллллллллллллллл');
      SetColor(7);
      OutTextXY(108,190,subor);
     end;

    If Ch=#27 then
     Begin
      SetColor(0);
      OutTextXY(54,190,' лллллллллллллллллллллллллллл');
      subor:='nepis';
      Zapnutie;
     end;

Until (Ch=#13) or (ch=#27) or (ch=' ');
If ch=' ' then subor:=subor+'.zzz';
Ch:=' ';


SetColor(0);
OutTextXY(54,190,'ллллллллллллллллллллллллллллл');



end;


(************************************************************************)
(************************************************************************)


Function Click(x,y,x2,y2:integer):boolean;
begin
if (mx div 2>=x) and (my>=y) and (mx div 2<=x2) and (my<=y2) then click:=true
else
click:=false;
end;

(************************************************************************)
(************************************************************************)

Procedure Obrazok;
Begin
Vypnutie;
SetColor(8);
Rectangle(1,1,34,34);

For b:=1 to 32 do
 For a:=1 to 32 do
    Begin
     C:=Obr[a,b];
     Putpixel(a+1,b+1,c)
    end;

Zapnutie;
end;

Procedure Obraz;
Begin
Vypnutie;

 For y:=1 to 32 do
  For x:=1 to 32 do
    begin
     SetColor(Obr[x,y]);
     Rectangle((x*5)+51,(y*5)+11,(x*5)+54,(y*5)+14);
     Rectangle((x*5)+52,(y*5)+12,(x*5)+53,(y*5)+13);
     if obr[x,y]=0 then
      begin
       SetColor(0);
       Rectangle((x*5)+51,(y*5)+11,(x*5)+54,(y*5)+14);
       Rectangle((x*5)+52,(y*5)+12,(x*5)+53,(y*5)+13);
       PutPixel((x*5)+52,(y*5)+12,8)
      end;


    end;
Zapnutie;

end;

(****************************ROTACIA************************)
Procedure Rotacia;
Begin


  For y:=1 to 32 do
   For x:=1 to 32 do
    Posuv[x,y]:=Obr[33-y,x];

      For y:=1 to 32 do
       For x:=1 to 32 do
        Obr[x,y]:=Posuv[x,y];

  Obrazok;
  Obraz;
  Delay(100);
end;

Procedure Rotacia2;
Var pos:Integer;
Begin


  For y:=1 to 32 do
   For x:=1 to 32 do
      Posuv[x,y]:=Obr[x,y];

      For y:=1 to 32 do
         For x:=1 to 32 do
            Obr[x,y]:=Posuv[33-x,y];

  Obrazok;
  Obraz;
  Delay(100);
end;



Procedure Posun(Ch:Char);
Var pos:Integer;
Begin


  For y:=1 to 32 do
   For x:=1 to 32 do
     Begin


       If Ch='L' then begin
        Pos:=x-1;
        If x=1 then pos:=32;
        Posuv[pos,y]:=Obr[x,y];
       end;

       If Ch='P' then begin
        Pos:=x+1;
        If x=32 then pos:=1;
        Posuv[pos,y]:=Obr[x,y];
       end;

       If Ch='H' then begin
        Pos:=y-1;
        If y=1 then pos:=32;
        Posuv[x,pos]:=Obr[x,y];
       end;

       If Ch='D' then begin
        Pos:=y+1;
        If y=32 then pos:=1;
        Posuv[x,pos]:=Obr[x,y];
       end;

     End;


      For y:=1 to 32 do
         For x:=1 to 32 do
            Obr[x,y]:=Posuv[x,y];

  Obrazok;
  Obraz;

end;


Procedure Draw(col:byte);
Begin
Vypnutie;
obr[(mx div 10)-10,(my div 5)-2]:=col;


If col<>0 then Begin
SetColor(col);
Rectangle(((mx div 10)*5)+1,((my div 5)*5)+1,((mx div 10)*5)+4 ,((my div 5)*5)+4);
Rectangle(((mx div 10)*5)+2,((my div 5)*5)+2,((mx div 10)*5)+3 ,((my div 5)*5)+3);
end;

If col=0 then Begin
SetColor(0);
Rectangle(((mx div 10)*5)+1,((my div 5)*5)+1,((mx div 10)*5)+4 ,((my div 5)*5)+4);
Rectangle(((mx div 10)*5)+2,((my div 5)*5)+2,((mx div 10)*5)+3 ,((my div 5)*5)+3);
PutPixel(((mx div 10)*5)+2,((my div 5)*5)+2,8);
end;



Obrazok;

Zapnutie;
end;

Procedure rand;
Begin
  Vypnutie;
  SetColor(10);
  OutTextXY(7,102,'Rand');
  Zapnutie;

 Repeat
  poloha;
  C:=Random(5)+100;

   If (Click(55,15,214,174)) and (Tlac=1) then Draw(C);
   If (Click(55,15,214,174)) and (Tlac=2) then Draw(C2);


 Until (Click(4,100,40,110)) and (Tlac=2);

  Vypnutie;
  SetColor(14);
  OutTextXY(7,102,'Rand');
  Zapnutie;


end;


(************************************************************************)
Procedure GetPal(Col : Byte; Var R,G,B : Byte);
  { This gets the Red, Green and Blue values of a certain color }
Var rr,gg,bb : Byte;
Begin
    asm
        mov    dx,3c7h
        mov    al,col
        out    dx,al
        add    dx,2
        in     al,dx
        mov    [rr],al
        in     al,dx
        mov    [gg],al
        in     al,dx
        mov    [bb],al
    end;
    r := rr;
    g := gg;
    b := bb;
end;

Procedure doCB;
Var rr,gg,bb:byte;
Begin
SetColor(8);
Rectangle(1,1,34,34);

For b:=1 to 32 do
 For a:=1 to 32 do
    Begin
     C:=Obr[a,b];
     If (c<>0) and (c<>255) then Begin
      GetPal(c,rr,gg,bb);
      c:=Trunc( (rr+gg+bb) / 6 );
      Obr[a,b]:=c+16;
     end;
    end;

Obrazok;
Obraz;

end;

Procedure Cols;
Begin

  SetColor(8);
  OuttextXY(55,178,'лллллллллллл');
  GetPal(C1,pr,pg,pb);

  SetColor(12);
  Str(pr,s);
  OuttextXY(55,178,s);

  SetColor(10);
  Str(pg,s);
  OuttextXY(85,178,s);

  SetColor(11);
  Str(pb,s);
  OuttextXY(115,178,s);

  SetColor(8);
  Rectangle(225,5,305,10);
  SetColor(c2);
  Rectangle(226,6,249, 9);
  Rectangle(227,7,248, 8);
  SetColor(c1);
  Rectangle(250,6,279, 9);
  Rectangle(251,7,278, 8);
  SetColor(c2);
  Rectangle(280,6,304, 9);
  Rectangle(281,7,303, 8);

  SetColor(8);
  OutTextXY(65,1,'лллллллллллллллллл');

  SetColor(8);
  OuttextXY(26,160,'ллл');
  OuttextXY( 1,160,'ллл');


  Str(C1,s1);
  Str(C2,s);

  SetColor(10);
  OuttextXY(26,160,s);
  OuttextXY( 1,160,s1);

end;

Procedure Fog;
Var x,y,v1,v2,v3,v4,c:Integer;
Pol:array[1..32,1..32] of byte;
Begin

  For y:=1 to 32 do
   For x:=1 to 32 do
    Pol[x,y]:=0;

        For y:=2 to 31 do
         For x:=2 to 31 do
          Begin

             v1:=Obr[x+1,y];  {}
             v2:=Obr[x-1,y];  {}
             v3:=Obr[x,y+1];  {}
             v4:=Obr[x,y-1];  {}

             If v1<64 then v1:=64;
             If v2<64 then v2:=64;
             If v3<64 then v3:=64;
             If v4<64 then v4:=64;
             c:=((v1+v2+v3+v4) div 4);{}
             If (c<64) or (c>95) then c:=0;
             Pol[x,y]:=c;

          end;

  For y:=1 to 32 do
   For x:=1 to 32 do
    Obr[x,y]:=Pol[x,y];


   Obrazok;
   Obraz;

end;

(*(*******************************************************************)
Begin

ClrScr;


If (ParamStr(1) = '?') then
 Begin
  Writeln('Alt + S -- ulozi momentalny obrazok do pamate');
  Writeln('Alt + L -- nacita obrazok z pamate');
  Writeln('Alt + I -- vlozi obrazok z pamate (neprepise cierne body) ');
  Writeln('Alt + M -- zmensi obrazok 2x');
  Writeln('Alt + N -- zvacsi obrazok 2x');
  Writeln('Alt + G -- urobi cez obrazok siet 1. farby');
  Writeln('Alt + R -- zmeni 1. farbu na 2. farbu ');
  Writeln('Alt + C -- zmeni paletu 1. farby na R:63 G:0 B:63');
  Writeln('\       -- inverzia');
  Writeln('O       -- ohranici obrazok 255. farbou');
  Writeln('Q,W     -- zmena cervenej palety 1. farby ');
  Writeln('A,S     -- zmena zelenej palety 1. farby ');
  Writeln('D,F     -- zmena modrej palety 1. farby ');
  Writeln('F2      -- ulozi obrazok ');
  Writeln('F3      -- nacita obrazok ');
  Writeln('F5      -- ciernobiely obrazok');

  Readkey;

 end;

Gd:=InstallUserDriver('Bgi256', nil);
Gm:=0;
InitGraph(gd,gm,Path);
mys;




Vypnutie;
C1:=15;
C2:=0;


CrtPal;{}
Lodfil(palet);{}
{Crtfil('pal1.pal');{}
Pal(255,63,0,63);

SetColor(7);
Rectangle(54,14,216,176);


SetColor(8);
For a:=1 to 33 do Line(50+(a*5),15,50+(a*5),175);
For a:=1 to 33 do Line(55,10+(a*5),215,10+(a*5));


SetColor(2);
Line(135,16,135,174);
Line(56,95,214,95);

SetColor(8);
Rectangle(1,1,34,34);

C:=0;

For A := 1 to 16 do
 begin
  For B := 1 to 16 do
   begin
     SetColor(C);
     Rectangle(220+(b*5)  ,5+(a*10)  ,224+(b*5)  ,15+(a*10));
     Rectangle(220+(b*5)+1,5+(a*10)+1,224+(b*5)-1,15+(a*10)-1);
     Rectangle(220+(b*5)+2,5+(a*10)+2,224+(b*5)-2,15+(a*10)-2);
     C:=C+1;
   end;
 end;

  SetColor(8);
  Rectangle(225,5,305,10);
  SetColor(c2);
  Rectangle(226,6,249, 9);
  Rectangle(227,7,248, 8);
  SetColor(c1);
  Rectangle(250,6,279, 9);
  Rectangle(251,7,278, 8);
  SetColor(c2);
  Rectangle(280,6,304, 9);
  Rectangle(281,7,303, 8);



  SetTextStyle(2,0,4);
  SetColor(125);
  OutTextXY(1,190,ver);
  SetTextStyle(1,0,1);


  SetColor(8);
  Rectangle(4,40,40,50);
  SetColor(14);
  OutTextXY(7,42,'Save');

  SetColor(8);
  Rectangle(4,55,40,65);
  SetColor(14);
  OutTextXY(7,57,'Load');

  SetColor(8);
  Rectangle(4,70,40,80);
  SetColor(14);
  OutTextXY(7,72,'Clr ');

  SetColor(8);
  Rectangle(4,85,40,95);
  SetColor(14);
  OutTextXY(7,87,'Smal');

  SetColor(8);
  Rectangle(4,100,40,110);
  SetColor(14);
  OutTextXY(7,102,'Rand');

  SetColor(8);
  Rectangle(4,115,40,125);
  SetColor(14);
  OutTextXY(7,117,'Pick');

  SetColor(8);
  Rectangle(4,130,40,140);
  SetColor(14);
  OutTextXY(7,132,'Mode');


  SetColor(8);
  Rectangle(36,12,52,22);
  Rectangle(36,24,52,34);
  SetColor(14);
  OutTextXY(40,14,'+');
  OutTextXY(40,26,'-');


  SetColor(8);
  Rectangle( 4,175,14,185);
  Rectangle(28,175,38,185);
  Rectangle(16,170,26,180);
  Rectangle(16,182,26,192);

  SetColor(14);

  OutTextXY( 6,177,chr(17));
  OutTextXY(30,177,chr(16));
  OutTextXY(18,172,chr(30));
  OutTextXY(18,184,chr(31));


  SetColor(8);
  Rectangle( 4,170,14,173);
  Rectangle(28,170,38,173);


  SetColor(8);
  OutTextXY(65,1,'лллллллллллллллллл');

  SetColor(8);
  OuttextXY(26,160,'ллл');
  OuttextXY( 1,160,'ллл');


  Str(C1,s1);
  Str(C2,s);

  SetColor(10);
  OuttextXY(26,160,s);
  OuttextXY( 1,160,s1);

  {{{{}
  SetColor(8);
  OuttextXY(55,178,'лллллллллллл');
  GetPal(C1,pr,pg,pb);

  SetColor(12);
  Str(pr,s);
  OuttextXY(55,178,s);

  SetColor(10);
  Str(pg,s);
  OuttextXY(85,178,s);

  SetColor(11);
  Str(pb,s);
  OuttextXY(115,178,s);

  Obraz;


If (ParamStr(1) <> '') and (ParamStr(1) <> '?') then
 Begin
  Subor:=ParamStr(1);

  If Fileex(Subor) then
  begin

  Assign(sb,subor);
  Reset(sb);

   R:= filesize(sb);
   If r<>512 then BEGIN
   r:=sqrt(r);
   z:=trunc(r);

    For y:=1 to z do
     For x:=1 to z do
      Begin
       Read(sb,bb);
       if bb<>0 then obr[x,y]:=bb;
      end;
   END ELSE BEGIN
    For y:=1 to 16 do
     For x:=1 to 32 do
      Begin
       Read(sb,bb);
       if bb<>0 then obr[x,y]:=bb;
      end;
   END;

  Close(sb);

  Obrazok;
  Obraz;

  Curent:=Subor;
  end;

  Zapnutie;
  Subor:='';
 end;

(******************************BEGIN**************************************)
Zapnutie;

Repeat

If Keypressed then
 Begin
  Chs:=Readkey;
  Vypnutie;

  Case Chs of
   f5 : doCB;

{----------------------------------UKONCENIE---------------------------}
   #27,^x,^q,f10:
     Begin
      CloseGraph;

       Assign(f,'error.zal');
        Rewrite(f);
         For y:=1 to 32 do
          For x:=1 to 32 do
           Write(f,Chr(Obr[x,y]));
           Close(f);
      Halt;
     end;

{------------------------------ZMENA PALETY----------------------------}

   alt1:
    Begin
     LodFil('pal1.pal');
     Pal(255,63,0,63);
    end;

   alt2:If fileex(Path+'pal2.pal') then LodFil(Path+'pal2.pal');
   alt3:If fileex(Path+'pal3.pal') then LodFil(Path+'pal3.pal');
   alt4:If fileex(Path+'pal4.pal') then LodFil(Path+'pal4.pal');
   alt5:If fileex(Path+'pal5.pal') then LodFil(Path+'pal5.pal');

{----------------------------- plus farba -----------------------------}
   'i':Begin Inc(C1);Cols; end;
   'u':Begin Dec(C1);Cols; end;


{-----------------------------ROLOVANIE PALETY-------------------------}

   'q': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd-1,gr,bl); end;
   'w': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd+1,gr,bl); end;
   'a': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd,gr-1,bl); end;
   's': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd,gr+1,bl); end;
   'd': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd,gr,bl-1); end;
   'f': Begin GetPal(C1,rd,gr,bl);PalX(C1,rd,gr,bl+1); end;

{------------------------------PALETA----------------------------------}
   'p': Begin
         For y:=1 to 16 do
          For x:=1 to 16 do
             Obr[x,y]:=(x-1)+((y-1)*16);

             Obrazok;
             Obraz;
         end;



{------------------------------SIET------------------------------------}
   altg:Begin
         For y:=1 to 32 do
          For x:=1 to 16 do
             Obr[x*2-(y mod 2),y]:=C1;

             Obrazok;
             Obraz;
        end;

   altp:Begin
         For y:=1 to 32 do
          For x:=1 to 32 do
             Obr[x,y]:=63+x;

             Obrazok;
             Obraz;
        end;


{------------------------------VYMAZANIE POLOVICE---------------------}
   'l':Begin
         For y:=1 to 32 do
          For x:=1 to 16 do
            Obr[x,y]:=0;

             Obrazok;
             Obraz;
        end;

{----------------------------VYMENENIE FARIEB--------------------------}


   altr:Begin
         For y:=1 to 32 do
          For x:=1 to 32 do
            If Obr[x,y]=C1 then Obr[x,y]:=C2;

             Obrazok;
             Obraz;
        end;

{----------------------------1/2 CIERNEJ-BIELEJ------------------------}


   altu:Begin
         For y:=1 to 32 do
          For x:=1 to 32 do
            If (Obr[x,y]>=16) and (Obr[x,y]<=47) then Obr[x,y]:=(Obr[x,y]-16) div 2+16;

             Obrazok;
             Obraz;
        end;

{---------------------------ZRUSENIE FARBY-----------------------------}
   altc:Pal(C1,63,0,63);

   ^c:For i:=16 to 46 do
    Begin
     Pal(i,(i-16)* 2,(i-16)* 2,(i-16)* 2);
    end;
{-----------------------------ZMENSENIE--------------------------------}
   'r':Begin

      For b:=1 to 32 do
       For a:=1 to 32 do
        Begin
          Decr[a,b]:=Obr[a,b];
          If (Obr[a,b]>=96) and (Obr[a,b]<=111) then
            Begin
             For i:=0 to 15 do If Obr[a,b]=96+i then Decr[a,b]:=Obr[a,b]-32+i;
            end;
        end;

      For b:=1 to 32 do
       For a:=1 to 32 do
        Begin
         Obr[a,b]:=Decr[a,b];
        end;

        Obrazok;
        Obraz;

      end;

{-----------------------------ZMENSENIE--------------------------------}
   altm:Begin

      For b:=1 to 32 do
       For a:=1 to 32 do
         Decr[a,b]:=0;

      For b:=1 to 16 do
       For a:=1 to 16 do
        Begin
         Decr[a,b]:=Obr[a*2,b*2];
        end;

      For b:=1 to 32 do
       For a:=1 to 32 do
        Begin
         Obr[a,b]:=Decr[a,b];
        end;

        Obrazok;
        Obraz;

      end;
{--------------------------------ZVACSENIE-----------------------------}

   altn:Begin

         For b:=1 to 32 do
          For a:=1 to 32 do
           Decr[a,b]:=0;

         For b:=0 to 31 do
          For a:=0 to 31 do
           Decr[a+1,b+1]:=Obr[(a div 2)+1,(b div 2)+1];

         For b:=1 to 32 do
          For a:=1 to 32 do
           Obr[a,b]:=Decr[a,b];

          Obrazok;
          Obraz;

        end;

{---------------------------------INVERZIA-----------------------------}
'\' : Begin
       Vypnutie;

       For y:=1 to 32 do
        For x:=1 to 32 do
         If (Obr[x,y]<>0) and (Obr[x,y]<>255) then Obr[x,y]:=255-Obr[x,y];

       Obrazok;
       Obraz;

      Zapnutie;
     end;

{-------------------------------HMLA----------------------------}
   '/':Fog;

{----------------------------SAVE PALLETE-----------------------}
   F7:Begin
    Assign(ff,'pal1.pal');
    Rewrite(ff);
     For a:=0 to 255 do
      Begin
       Getpal(a,rr,gg,bb);
       Write(ff,rr);
       Write(ff,gg);
       Write(ff,bb);


      end;

    Close(ff);

   end;


{-------------------------------OHRANICENIE----------------------------}
   'o':Begin

         For b:=1 to 32 do
          For a:=1 to 32 do
           Decr[a,b]:=0;

      For b:=1 to 32 do
       For a:=1 to 32 do
         Begin
          If ((Obr[a-1,b]>0) and (Obr[a-1,b]<>255) and{} (a> 1)) or
             ((Obr[a+1,b]>0) and (Obr[a+1,b]<>255) and{} (a<32)) or
             ((Obr[a,b-1]>0) and (Obr[a,b-1]<>255) and{} (b> 1)) or
             ((Obr[a,b+1]>0) and (Obr[a,b+1]<>255) and{} (b<32)) then
             Decr[a,b]:=255;



         end;

          For b:=1 to 32 do
           For a:=1 to 32 do
            If Obr[a,b]=0 then{} Obr[a,b]:=Decr[a,b];

          Obrazok;
          Obraz;

        end;

  end;

   SetColor(8);
   OuttextXY(55,178,'лллллллллллл');
   GetPal(C1,pr,pg,pb);

   SetColor(12);
   Str(pr,s);
   OuttextXY(55,178,s);

   SetColor(10);
   Str(pg,s);
   OuttextXY(85,178,s);

   SetColor(11);
   Str(pb,s);
   OuttextXY(115,178,s);

  Zapnutie;

 end;





If (Click(225,15,305,175)) and (tlac<>0) then
 Begin
  c:=0;
  For A := 1 to 16 do
    For B := 1 to 16 do
     begin
     If click(220+(b*5),5+(a*10),224+(b*5),15+(a*10)) then
      Begin
       If tlac=1 then c1:=c;
       If tlac=2 then c2:=c;
       If tlac=4 then Begin
        Vypnutie;
         GetPal(c1,c1r,c1g,c1b);
         GetPal(c,c2r,c2g,c2b);
         Pal(c1,c2r,c2g,c2b);
         Pal(c,c1r,c1g,c1b);
        Zapnutie;
       end;

      end;
     Inc(c);

    SetColor(8);
    OuttextXY(26,160,'ллл');
    OuttextXY( 1,160,'ллл');

    Str(C1,s1);
    Str(C2,s);

    SetColor(10);
    OuttextXY(26,160,s);
    OuttextXY( 1,160,s1);

    SetColor(8);
    OuttextXY(55,178,'лллллллллллл');
    GetPal(C1,pr,pg,pb);

    SetColor(12);
    Str(pr,s);
    OuttextXY(55,178,s);

    SetColor(10);
    Str(pg,s);
    OuttextXY(85,178,s);

    SetColor(11);
    Str(pb,s);
    OuttextXY(115,178,s);

   end;

  SetColor(8);
  Rectangle(225,5,305,10);
  SetColor(c2);
  Rectangle(226,6,249, 9);
  Rectangle(227,7,248, 8);
  SetColor(c1);
  Rectangle(250,6,279, 9);
  Rectangle(251,7,278, 8);
  SetColor(c2);
  Rectangle(280,6,304, 9);
  Rectangle(281,7,303, 8);
 end;

(****************************PUT****************************************)

If (click(55,15,214,174)) and (Tlac<>0) then
 Begin
  Vypnutie;
   If tlac=1 then Draw(c1);
   If tlac=2 then Draw(c2);
  Zapnutie;
 end;

(****************************SAVE***************************************)


If ((Click(4,40,40,50)) and (Tlac=1)) or (chs=f2) then
 Begin
  Vypnutie;

  Subor:=Curent;

  SetColor(7);
  OutTextXY(55,190,'Subor:');
  OutTextXY(108,190,subor);


  If chs<>f2 then EnterName;
  If (chs=f2) and (Subor='') then entername;

  SetColor(10);
  OutTextXY(55,190,'Subor: '+subor);

  If subor<>'nepis' then Begin

  Assign(f,subor);
  Rewrite(f);
    For y:=1 to 32 do
     For x:=1 to 32 do
       begin
        Write(f,Chr(Obr[x,y]));
       end;
  Close(f);

  SetColor(8);OutTextXY(110,1,'лллллллллллл');
  Curent:=Subor;

  end;

  SetColor(0);
  OutTextXY(54,190,'ллллллллллллллллллллллллллллл');

  Zapnutie;
   Subor:='';
 end;

(****************************SMALL SAVE***************************)

If (Click(4,85,40,95)) and (Tlac=1) then
 Begin
  Vypnutie;

  Subor:=Curent;

  SetColor(7);
  OutTextXY(55,190,'Subor:');
  OutTextXY(108,190,subor);


  EnterName;


  SetColor(10);
  OutTextXY(55,190,'Subor: '+subor);

  If subor<>'nepis' then Begin

  Assign(f,subor);
  Rewrite(f);
    For y:=1 to 16 do
     For x:=1 to 16 do
       begin
        Write(f,Chr(Obr[x,y]));
       end;
  Close(f);

  SetColor(8);OutTextXY(110,1,'лллллллллллл');
  Curent:=Subor;

  end;

  SetColor(0);
  OutTextXY(54,190,'ллллллллллллллллллллллллллллл');

  Zapnutie;
   Subor:='';
 end;


(****************************MEDIUM SAVE***************************)
If (Click(4,85,40,95)) and (Tlac=2) then
 Begin
  Vypnutie;

  Subor:=Curent;

  SetColor(7);
  OutTextXY(55,190,'Subor:');
  OutTextXY(108,190,subor);


  EnterName;


  SetColor(10);
  OutTextXY(55,190,'Subor: '+subor);

  If subor<>'nepis' then Begin

  Assign(f,subor);
  Rewrite(f);
    For y:=1 to 18 do
     For x:=1 to 18 do
       begin
        Write(f,Chr(Obr[x,y]));
       end;
  Close(f);

  SetColor(8);OutTextXY(110,1,'лллллллллллл');
  Curent:=Subor;

  end;

  SetColor(0);
  OutTextXY(54,190,'ллллллллллллллллллллллллллллл');

  Zapnutie;
   Subor:='';
 end;

(****************************MIKRO SAVE***************************)
If ((Click(4,85,40,95)) and (Tlac=3)) or (Chs=F6) then
 Begin
  Vypnutie;

  Subor:=Curent;

  SetColor(7);
  OutTextXY(55,190,'Subor:');
  OutTextXY(108,190,subor);


  EnterName;


  SetColor(10);
  OutTextXY(55,190,'Subor: '+subor);

  If subor<>'nepis' then Begin

  Assign(f,subor);
  Rewrite(f);
    For y:=1 to 10 do
     For x:=1 to 10 do
       begin
        Write(f,Chr(Obr[x,y]));
       end;
  Close(f);

  SetColor(8);OutTextXY(110,1,'лллллллллллл');
  Curent:=Subor;

  end;

  SetColor(0);
  OutTextXY(54,190,'ллллллллллллллллллллллллллллл');

  Zapnutie;
   Subor:='';
 end;

(*****************************LOAD********************************)
If ((Click(4,55,40,65)) and (Tlac=1)) or (chs=f3) or (chs=f4) then
 Begin
  Vypnutie;

  EnterName;

  SetColor(10);
  OutTextXY(55,190,'Subor: '+subor);


  If Fileex(Subor) then
  begin


  If chs<>f4 then
    For y:=1 to 32 do
     For x:=1 to 32 do
      Obr[x,y]:=0;

  Assign(sb,subor);
  Reset(sb);

   R:= filesize(sb);

   If r<>512 then BEGIN
   r:=sqrt(r);
   z:=trunc(r);

    For y:=1 to z do
     For x:=1 to z do
      Begin
       Read(sb,bb);
       if bb<>0 then obr[x,y]:=bb;
      end;
   END ELSE BEGIN
    For y:=1 to 16 do
     For x:=1 to 32 do
      Begin
       Read(sb,bb);
       if bb<>0 then obr[x,y]:=bb;
      end;
   END;


  Close(sb);

  Obrazok;
  Obraz;

  Curent:=Subor;
  end;

  SetColor(0);
  OutTextXY(54,190,'ллллллллллллллллллллллллллллл');

  SetColor(8);OutTextXY(110,1,'лллллллллллл');

  Zapnutie;
  Subor:='';
 end;

(***********************************CLEAR*******************************)

If (Click(4,70,40,80)) and (Tlac=1) then
 Begin
  Vypnutie;

    For y:=1 to 32 do
     For x:=1 to 32 do
      Obr[x,y]:=c2;

  Obrazok;
  Obraz;

  Zapnutie;
 end;

(**************************INCREASE/DECREASE PALETTE******************************)

If (Click(36,12,52,22)) and (Tlac=1) then
 Begin
 Vypnutie;

  For y:=1 to 32 do
   For x:=1 to 32 do
     Begin
       If (Obr[x,y]<>0) then begin
        Obr[x,y]:=Obr[x,y]+1;
        If Obr[x,y]=255 then Obr[x,y]:=0;
       end;
     End;

  Obraz;
  Obrazok;
 Zapnutie;
 end;

If (Click(36,24,52,34)) and (Tlac=1) then
 Begin
 Vypnutie;

  For y:=1 to 32 do
   For x:=1 to 32 do
     Begin
       If (Obr[x,y]<>0) then
        Obr[x,y]:=Obr[x,y]-1;
     End;

  Obraz;
  Obrazok;
 Zapnutie;
 end;


(**********************************END***********************************)

If (Click(  4,175, 14,185)) and (Tlac=1) then Posun('L');
If (Click( 28,175, 38,185)) and (Tlac=1) then Posun('P');
If (Click( 16,170, 26,180)) and (Tlac=1) then Posun('H');
If (Click( 16,182, 26,192)) and (Tlac=1) then Posun('D');

If (Click(  4,170, 14,173)) and (Tlac=1) then Rotacia;
If (Click( 28,170, 38,173)) and (Tlac=1) then Rotacia2;

If (Click(  4,100, 40,110)) and (Tlac=1) then Rand;

Poloha;


(***********************************PICK***************************)
If (Click(4,115,40,125)) and (Tlac=1) then
 Begin

 o:=0;
  Vypnutie;
  SetColor(10);
  OutTextXY(7,117,'Pick');
  Zapnutie;

 Tlac:=0;

 Repeat
  Poloha;
  If (Click(55,15,214,174)) and (Tlac=1) then
   Begin
    C1:=Obr[(mx div 10)-10,(my div 5)-2];
    o:=1;
   end;

  If (Click(55,15,214,174)) and (Tlac=2) then
   Begin
    C2:=Obr[(mx div 10)-10,(my div 5)-2];
    o:=1;
   end;

 until o=1;



  Vypnutie;
  SetColor(14);
  OutTextXY(7,117,'Pick');

  SetColor(8);
  Rectangle(225,5,305,10);
  SetColor(c2);
  Rectangle(226,6,249, 9);
  Rectangle(227,7,248, 8);
  SetColor(c1);
  Rectangle(250,6,279, 9);
  Rectangle(251,7,278, 8);
  SetColor(c2);
  Rectangle(280,6,304, 9);
  Rectangle(281,7,303, 8);

    SetColor(8);
    OuttextXY(55,178,'лллллллллллл');
    GetPal(C1,pr,pg,pb);

    SetColor(12);Str(pr,s);
    OuttextXY(55,178,s);

    SetColor(10);Str(pg,s);
    OuttextXY(85,178,s);

    SetColor(11);Str(pb,s);
    OuttextXY(115,178,s);

    SetColor(8);
    OuttextXY(26,160,'ллл');
    OuttextXY( 1,160,'ллл');

    Str(C1,s1);
    Str(C2,s);

    SetColor(10);
    OuttextXY(26,160,s);
    OuttextXY( 1,160,s1);
    Zapnutie;

    Delay(100);
 end;

SetColor(3);
s:=Copy(curent,Length(curent)-11,12);
If length(curent)>12 then
OutTextXY(110,1,s)
else OutTextXY(110,1,curent);

(********************QUICK LOAD/SAVE*********************************)
If chs=alts then
 Begin
   For y:=1 to 32 do
    For x:=1 to 32 do
     Quick[x,y]:=Obr[x,y];
 end;
{-----------------------------------------------}
If chs=altl then
 Begin
   For y:=1 to 32 do
    For x:=1 to 32 do
    Obr[x,y]:=Quick[x,y];

  Obrazok;
  Obraz;
 end;

{-----------------------------------------------}
If chs=alti then
 Begin
   For y:=1 to 32 do
    For x:=1 to 32 do
     If Quick[x,y]<>0 then Obr[x,y]:=Quick[x,y];

  Obrazok;
  Obraz;
 end;


(********************************************************************)
If Click(4,130,40,140) and (tlac=1) then Begin
 Vypnutie;
  SetColor(10);
  OutTextXY(7,132,'Mode');
  WMode:=2;
 Zapnutie;
end;

If Click(4,130,40,140) and (tlac=2) then Begin
 Vypnutie;
  SetColor(14);
  OutTextXY(7,132,'Mode');
  WMode:=1;
 Zapnutie;
end;

(********************************************************************)

   If Click(55,15,214,174) then Begin
    SetColor(8);
    OuttextXY( 1,150,'ллл');
    OuttextXY(26,150,'ллл');

    Str((mx div 10)-10,s);
    Str((my div  5)- 2,s1);

    SetColor(10);
    OuttextXY( 1,150,s);
    OuttextXY(26,150,s1);
   end else
    Begin
     SetColor(20);
     OuttextXY( 1,150,'ллл');
     OuttextXY(26,150,'ллл');

    end;

chs:=' ';

Until False;

{}

{}(**)
vypnutie;
CloseGraph;

 Assign(f,'error.zal');
 Rewrite(f);
  For y:=1 to 32 do
   For x:=1 to 32 do
     Write(f,Chr(Obr[x,y]));

 Close(f);

end.