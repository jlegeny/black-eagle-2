{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,420000,655360}
Unit Data;

Interface



Uses Crt,dos,col256_2,palette;
function FileEx(FileName: String): Boolean;


               CONST

ld1= 1; {GAME}
ld2= 0;
ld3= 1; {INTRO}
ld4= 0; {}
ld5= 0; {}
ld6= 0; {}

 f = false;
 t = true;

{if}           BackSp  = #8;       PgUp  = #201;      CtrlPgUp = #138;
{if}           Tab     = #9;       PgDn  = #209;      CtrlPgDn = #246;
{if}           Enter   = #13;      Endkey= #207;      CtrlEnd  = #245;
{if}           Esc     = #27;      Home  = #199;      CtrlHome = #247;
{if}           STab    = #143;     Ins   = #210;      Del      = #211;
{if}
{if}           LArr    = #75;      CtrlLArr    = #115;    CtrlPrtsc = #242;
{if}           RArr    = #77;      CtrlRArr    = #116;
{if}           UArr    = #72;
{if}           DArr    = #80;
{if}
{if}
{if}           CtrlA  = #1;          AltA  = #30;        Alt1 = #248;
{if}           CtrlB  = #2;          AltB  = #48;        Alt2 = #249;
{if}           CtrlC  = #3;          AltC  = #46;        Alt3 = #250;
{if}           CtrlD  = #4;          AltD  = #32;        Alt4 = #251;
{if}           CtrlE  = #5;          AltE  = #18;        Alt5 = #252;
{if}           CtrlF  = #6;          AltF  = #33;        Alt6 = #253;
{if}           CtrlG  = #7;          AltG  = #34;        Alt7 = #254;
{if}           CtrlH  = #8;          AltH  = #35;        Alt8 = #255;
{if}           CtrlI  = #9;          AltI  = #23;        Alt9 = #134;
{if}           CtrlJ  = #10;         AltJ  = #36;        Alt0 = #135;
{if}           CtrlK  = #11;         AltK  = #37;        Altminus  = #136;
{if}           CtrlL  = #12;         AltL  = #38;        Altequals = #137;
{if}           CtrlM  = #13;         AltM  = #50;
{if}           CtrlN  = #14;         AltN  = #49;
{if}           CtrlO  = #15;         AltO  = #24;
{if}           CtrlP  = #16;         AltP  = #25;
{if}           CtrlQ  = #17;         AltQ  = #16;
{if}           CtrlR  = #18;         AltR  = #19;
{if}           CtrlS  = #19;         AltS  = #31;
{if}           CtrlT  = #20;         AltT  = #20;
{if}           CtrlU  = #21;         AltU  = #22;
{if}           CtrlV  = #22;         AltV  = #47;
{if}           CtrlW  = #23;         AltW  = #17;
{if}           CtrlX  = #24;         AltX  = #45;
{if}           CtrlY  = #25;         AltY  = #21;
{if}           CtrlZ  = #26;         AltZ  = #44;
{if}
{if}           F1  = #59;              sF1  = #212;
{if}           F2  = #60;              sF2  = #213;
{if}           F3  = #61;              sF3  = #214;
{if}           F4  = #62;              sF4  = #215;
{if}           F5  = #63;              sF5  = #216;
{if}           F6  = #64;              sF6  = #217;
{if}           F7  = #65;              sF7  = #218;
{if}           F8  = #66;              sF8  = #219;
{if}           F9  = #67;              sF9  = #220;
{if}           F10 = #68;              sF10 = #221;
{if}           F11 = #139;             sF11 = #141;
{if}           F12 = #140;             sF12 = #142;
{if}
{if}           CtrlF1  = #222;          AltF1  = #232;
{if}           CtrlF2  = #223;          AltF2  = #233;
{if}           CtrlF3  = #224;          AltF3  = #234;
{if}           CtrlF4  = #225;          AltF4  = #235;
{if}           CtrlF5  = #226;          AltF5  = #236;
{if}           CtrlF6  = #227;          AltF6  = #237;
{if}           CtrlF7  = #228;          AltF7  = #238;
{if}           CtrlF8  = #229;          AltF8  = #239;
{if}           CtrlF9  = #230;          AltF9  = #240;
{if}           CtrlF10 = #231;          AltF10 = #241;
{if}           CtrlF11 = #154;          AltF11 = #156;
{if}           CtrlF12 = #155;          AltF12 = #157;


      corrupt:string= '.=..      ..=.A'+
                     '.A.=..    ..=.A.'+
                     '=.A.=..  ..=.A.='+
                     '.=.A.=....=.A.=.'+
                     '..=.A.=..=.A.=..'+
                     ' ..=.A.==.A.=.. '+
                     '  ..=.A..A.=..  '+
                     '   ..=.AA.=..   '+
                     '   ..=.AA.=..   '+
                     '  ..=.A..A.=..  '+
                     ' ..=.A.==.A.=.. '+
                     '..=.A.=..=.A.=..'+
                     '.=.A.=....=.A.=.'+
                     '=.A.=..  ..=.A.='+
                     '.A.=..    ..=.A.'+
                     'A.=..      ..=.A';

      corrup2:string= '... ... ... ... . . ... ...    '+
                     ' .   . . . . . . . . . .  .     '+
                     ' .   . . ..  ..  . . ...  .     '+
                     ' .   . . . . . . . . .    .     '+
                     ' ... ... . . . . ..  .    .     '+
                     '                                '+
                     '                                '+
                     '                                ';


  BrCol:array[0..255] of byte=(
       { 0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15}
       {  0}  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
       { 16} 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
       { 32} 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 47,
       { 48} 49, 50, 51, 52, 52, 52, 53, 54, 55, 58, 59, 60, 61, 62, 63, 63,
       { 64} 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
       { 80} 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 95,
       { 96} 97, 98, 99,100,101,102,103,104,105,106,107,108,109,110,111,111,
       {112}113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,127,
       {128}129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,143,
       {144}145,146,147,148,148,  0,  0,152,153,154,155,156,157,158,159,159,
       {160}161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,175,
       {176}176,176,177,178,179,180,181,  7,  8,  9, 10,187,187,188,189,190,
       {192}193,194,195,196,197,198,199,199,201,202,203,204,205,206,207,207,
       {208}  0,  1,211,212,213,214,215,216,217,218,219,220,221,222,223,223,
       {224}224,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,
       {240}240,241,242,243,244,245,246,  7,  8,  9, 10, 11, 12, 13, 14,  0);

         DecCol:array[0..255] of byte=(
              {      0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15}
              {  0}  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
              { 16} 16, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
              { 32} 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46,
              { 48} 48, 48, 49, 50, 53, 54, 55, 56, 56, 57, 57, 58, 59, 60, 61, 62,
              { 64} 64, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78,
              { 80} 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94,
              { 96} 96, 96, 97, 98, 99,100,101,102,103,104,105,106,107,108,109,110,
              {112}112,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,
              {128}128,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,
              {144}194,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,
              {160}160,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,
              {176}177,178,179,180,181,182,182,  7,  8,  9, 10,188,189,190,191,191,
              {192}192,192,193,194,195,196,197,198,200,200,201,202,203,204,205,206,
              {208}  0,  1,210,210,211,212,213,214,215,216,217,218,219,220,221,222,
              {224}225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,239,
              {240}240,241,242,243,244,245,246,  7,  8,  9, 10, 11, 12, 13, 14,  0);



 EnMask:array[0..15,0..15] of byte=
     {0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5}
 ({0}(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
  {1}(0,0,0,0,0,6,6,6,6,6,6,0,0,0,0,0),
  {2}(0,0,0,6,6,5,5,5,5,5,5,6,6,0,0,0),
  {3}(0,0,6,5,5,4,4,4,4,4,4,5,5,6,0,0),
  {4}(0,6,5,5,4,3,3,3,3,3,3,4,5,5,6,0),
  {5}(0,6,5,4,3,3,2,2,2,2,3,3,4,5,6,0),
  {6}(6,5,4,3,3,2,2,1,1,2,2,3,3,4,5,6),
  {7}(6,5,4,3,3,2,1,1,1,1,2,3,3,4,5,6),
  {8}(6,5,4,3,3,2,1,1,1,1,2,3,3,4,5,6),
  {9}(6,5,4,3,3,2,2,1,1,2,2,3,3,4,5,6),
  {0}(0,6,5,4,3,3,2,2,2,2,3,3,4,5,6,0),
  {1}(0,6,5,5,4,3,3,3,3,3,3,4,5,5,6,0),
  {2}(0,0,6,5,5,4,4,4,4,4,4,5,5,6,0,0),
  {3}(0,0,0,6,6,5,5,5,5,5,5,6,6,0,0,0),
  {4}(0,0,0,0,0,6,6,6,6,6,6,0,0,0,0,0),
  {5}(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));

 Rad:array[0..6,0..6] of byte=
 ((0,0,1,1,1,0,0),
  (0,1,2,2,2,1,0),
  (1,2,3,3,3,2,1),
  (1,2,3,0,3,2,1),
  (1,2,3,3,3,2,1),
  (0,1,2,2,2,1,0),
  (0,0,1,1,1,0,0));

  Smer:array[0..15] of byte=
  (2,23,3,36,6,69,9,98,8,87,7,74,4,41,1,12);



Type Shot = Record
             X,Y,T,B,S,P,Tar:Integer;
            end;

     WayPoint = Record
                 R,D,S:Integer;
                end;


     Enemy = Record
              Hp,K,T,X,Y,R,B,D,S,RP,SR,SS:Integer;
              St:Integer;
              Way:Array[1..10] of WayPoint;
              W,MW:Integer;
             end;


     FallingEnemy = record
                     T,X,Y,R,P:Integer;
                    end;

     Explosion = record
                  T,X,Y,P:integer;
                 end;

     Bonus = record
              X,Y,T,D,R,CD:Integer;
             end;

     Vrak = Record
             X,Y,T:Integer;
            end;


Var Gd,Gm:Integer;
    Cur,mysx,mysy,mystlac:integer;
    Tlac:Integer;
    mys:Integer;

    reg:registers;


    p :array[1..333] of pointer;
    sp:array[1..90] of pointer;

    Gamesa:Integer;
    StrtGame:Integer;


    fil:file;
    ff:Text;
    SuborB:file of byte;
    i,j :Integer;

    FontX :array[1..60,1..25] of byte;

    Wayp:array[1..10] of Waypoint;


    Px,Py,Px2,Py2,mx,my:Integer;
    Moved:Integer;

    Life,Lives,Credits:Integer;
    Wep1,Wep2,Wep3,Kad1,Kad2,Bombs:Integer;
    Invis:Integer;
    ChMis:Integer;


    St:Array[1..200] of Shot;
    LSt,Ved:Integer;

    Level:Integer;

    Code:Real;

    En:Array[1..30] of Enemy;

    Fall:Array[1..10] of FallingEnemy;

    Exp:Array[1..100] of Explosion;

    Terol,TSpd,TerPos:Integer;

    BT,BX,BY:Integer;

    xx,yy:Real;

    Bon:array[1..10] of Bonus;

    Vr:array[1..30] of Vrak;

    Map:array[1..11,0..100] of Byte;
    Ppr:array[1..11,0..100] of Byte;

    Score:LongInt;

    Speed:Integer;
    W:Integer;

    Die:Integer;

    {POMOCNE}
    Flash:Integer;
    Dark,Drk:Integer;
    psx,psy:Integer;
    Wait:Integer;
    KLock,MLock:Integer;
    errdl:Integer;
    aa,a,b,c,d,u,v,z,o,K,q:Integer;
    ch:char;
    s1,s2,s3,s4:string[20];
    ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8,ss9,ss0:String[30];
    s,sss:string;
    bb,farba,ifar,strt,tg,tg1,tg2:byte;
    unc:Integer;

    GO,Cont:Integer;

    x,y:Integer;

    roll:Integer;
    WFClick:Integer;


Procedure His(s:String);

Implementation

Var ss:Integer;
    ld,lo,ll:Integer;

Procedure His(s:String);
Var ff:text;
Begin
 Assign(ff,'history.doa');
 Append(ff);
 Writeln(ff,s);
 Close(ff);
end;

function FileEx(FileName: String): Boolean;
var
 F: file;
begin
 {$I-}

 Assign(F, FileName);
 FileMode := 0;  { Set file access to read only }
 Reset(F);
 Close(F);
 {$I+}
 FileEx := (IOResult = 0) and (FileName <> '');
end;  { FileExists }

{(((((((((((((((((((((((((((((((((((((((((()))))))))))))))))))))))))))))))}

Procedure Load(S:String;pp:integer);
Var j:Integer;
    SB:file of byte;
    a : Array[1..1024] of byte;
Begin

Inc(ss);If ss>6 then ss:=1;
If ss=1 then
 Begin
   Inc(ld);
   GoToXY(5+ld,12);
   TextColor(7);
   Write('ฑ');

 end;
{}
If fileex(s) then Begin

   assign(SB,s);
   reset(SB);
    for j:=1 to 1024 do read(SB,A[j]);
   Close(SB);
   Move(a,p[pp]^,1024);
   TextColor(7);
end else
 Begin

   For j:=1 to 1024 do a[j]:=1;

   For j:=1 to 255 do
     If corrup2[j]<>' ' then a[j]:=ord(corrup2[j]) else a[j]:=1;


   Move(a,p[pp]^,1024);
   TextColor(12);
   Inc(ErrDL);

   Assign(ff,'history.doa');
   Append(ff);
   Writeln(ff,'<ERROR> Error loading icon '+s+' File doesn''t exist !!!');
   Close(ff);

 end;

end;

{(((((((((((((((((((((((((((((((((((((((((()))))))))))))))))))))))))))))))}
Procedure SLoad(S:String;pp:integer);
Var j:Integer;
    SB:file of byte;
    a : Array[1..256] of byte;
Begin

Inc(ss);If ss>18 then ss:=1;
If ss=1 then
 Begin
  Inc(ld);
  GoToXY(5+ld,12);
  TextColor(7);
  Write('ฑ');
 end;
{}

If fileex(s) then Begin

   assign(SB,s);
   reset(SB);
    for j:=1 to 256 do read(SB,A[j]);
   Close(SB);
   Move(a,sp[pp]^,256);
   TextColor(7);
end else
 Begin
   For j:=1 to 255 do
     If corrupt[j]<>' ' then a[j]:=ord(corrupt[j]) else a[j]:=0;

   Move(corrupt,sp[pp]^,256);
   TextColor(12);
   Inc(ErrDL);

   Assign(ff,'history.doa');
   Append(ff);
   Writeln(ff,'<ERROR> Error loading icon '+s+' File doesn''t exist !!!');
   Close(ff);

 end;


end;


Begin

Assign(ff,'history.doa');
Rewrite(ff);
Writeln(ff,'-----------------------------NEW GAME------------------------');
Writeln(ff,'Loading data...');
Close(ff);

ErrDl:=0;
ss:=1;
ld:=-1;
ll:=0;
ld:=0;

TextMode(-1);


TextBackGround(0);
Clrscr;




TextBackGround(4);TextColor(15);
Writeln('                          Black Eagle II v1.1 (Beta)                           ');
Writeln('');


TextBackGround(0);TextColor(11);
Writeln('                       Ûฑ Ûฑ Ûฑ  ÛÛÛÛÛÛฑ  ÛÛÛฑ  Ûฑ  Ûฑ          (R)            ');
Writeln('                       Ûฑ ÛฑÛฑ  Ûฑ    Ûฑ Ûฑ  Ûฑ ÛÛฑ Ûฑ                         ');
Writeln('                ÛฒฑฐฐฐฐÛฑฐÛÛฑฐฐฐฐÛÛฑฐฐÛฑฐÛÛÛÛÛฑฐÛฑÛฑÛฑฐฐฐฐฑฒÛ                  ');
Writeln('                       Ûฑ ÛฑÛฑ     Ûฑ Ûฑ Ûฑ  Ûฑ Ûฑ ÛÛฑ                         ');
Writeln('                       Ûฑ Ûฑ ÛÛÛÛÛÛฑ  Ûฑ Ûฑ  Ûฑ Ûฑ  Ûฑ WORKS                   ');

Writeln('');

TextBackGround(0);TextColor(7);

Write('Alocating memory.');
For a:=1 to 333 do GetMem(p[a],1024);
Write('.');
For a:=1 to 90 do GetMem(sp[a],256);
Writeln('. Done');

Writeln('');

Writeln('    ษออออออออออออออออออออออออออออออออLOADINGออออออออออออออออออออออออออออออออป');
Writeln('    ฬดฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑรน');
Writeln('    ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

Writeln('    ษอออออออออออออออออออออออออออออออSOUND TESTออออออออออออออออออออออออออออออป');
Writeln('    ฬดฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑรน');
Writeln('    ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');


Writeln('');


TextColor(15);
TextBackGround(0);

Writeln('');

TextBackGround(1);


{Point}

 assign(SuborB,'fontX.fnt');
 reset(SuborB);

 for i:=1 to 60 do
  Begin
  for j:=1 to 25 do read(SuborB,fontX[i,j]);
  end;
 Close(SuborB);

   Inc(ld);
   GoToXY(6+ld,12);
   TextColor(7);
   Write('ฑ');

(*--*)
If Ld1=1 then BEGIN

SLoad('Cur1.zzz'    ,1);

SLoad('Life.zzz'    ,2);
SLoad('Flame1.zzz'  ,3);
SLoad('Flame2.zzz'  ,4);
SLoad('Flame3.zzz'  ,5);
SLoad('Flame4.zzz'  ,6);
SLoad('LifePt.zzz'  ,7);
SLoad('Bomb.zzz'    ,8);


SLoad('EnShot.zzz'  ,10);
SLoad('Shot1.zzz'   ,11);
SLoad('Shot2.zzz'   ,12);
SLoad('Shot3.zzz'   ,13);
SLoad('Shot4.zzz'   ,14);
SLoad('Bomb1.zzz'   ,15);
SLoad('EnShot00.zzz',16);
SLoad('EnShot30.zzz',17);
SLoad('EnShot45.zzz',18);
SLoad('EnShot2.zzz' ,19);

SLoad('Rocket1.zzz' ,21);
SLoad('Rocket1a.zzz',22);
SLoad('Rocket2.zzz' ,23);
SLoad('Rocket2a.zzz',24);

SLoad('BonusL.zzz'  ,25);
SLoad('BonusW.zzz'  ,26);
SLoad('Rockets.zzz' ,27);
SLoad('Missiles.zzz',28);
SLoad('BonusB.zzz'  ,29);

SLoad('Missile1.zzz' ,31);
SLoad('Missile2.zzz' ,32);
SLoad('Missile3.zzz' ,33);
SLoad('Missile4.zzz' ,34);
SLoad('Missile5.zzz' ,35);
SLoad('Missile6.zzz' ,36);

SLoad('Missil21.zzz' ,37);
SLoad('Missil22.zzz' ,38);
SLoad('Missil23.zzz' ,39);
SLoad('Missil24.zzz' ,40);
SLoad('Missil25.zzz' ,41);
SLoad('Missil26.zzz' ,42);
SLoad('EnSht200.zzz' ,43);
SLoad('EnSht230.zzz' ,44);
SLoad('EnSht245.zzz' ,45);

SLoad('Boom00.zzz'   ,46);
SLoad('Boom30.zzz'   ,47);
SLoad('Boom45.zzz'   ,48);

END;

If Ld3=1 then Begin
SLoad('LettrW.zzz'   ,68);
SLoad('LettrO.zzz'   ,69);
SLoad('LettrR.zzz'   ,70);
SLoad('LettrK.zzz'   ,71);
SLoad('LettrS.zzz'   ,72);
end;

If Ld1=1 then BEGIN

SLoad('Gas1.zzz',73);
SLoad('Gas2.zzz',74);
SLoad('Gas3.zzz',75);
SLoad('Gas4.zzz',76);
SLoad('Gas5.zzz',77);
SLoad('Gas6.zzz',78);
SLoad('Gas7.zzz',79);
SLoad('Gas8.zzz',80);
SLoad('Exp1.zzz',81);
SLoad('Exp2.zzz',82);
SLoad('Exp3.zzz',83);
SLoad('Exp4.zzz',84);
SLoad('Exp5.zzz',85);
SLoad('Exp6.zzz',86);
SLoad('Exp7.zzz',87);
SLoad('Exp8.zzz',88);

Load('Fighter.zzz',1);
Load('Fighter2.zzz',2);

Load('HUD.zzz'     ,3);
Load('GameOver.zzz',4);
Load('Continue.zzz',5);
END;

If Ld3=1 then Begin
Load('Blast.zzz',10);

Load('LetrI.zzz',11);
Load('LetrK.zzz',12);
Load('LetrS.zzz',13);
Load('LetrA.zzz',14);
Load('LetrN.zzz',15);
end;
If Ld1=1 then BEGIN

Load('Crater1.zzz',16);
Load('Crater2.zzz',17);


Load('Terrain1.zzz',21);
Load('Cliff1.zzz'  ,22);
Load('Cliff2.zzz'  ,23);
Load('Terrain2.zzz',24);
Load('Water1.zzz'  ,25);

Load('Buildin1.zzz',31);
Load('Buildin2.zzz',32);
Load('Buildin3.zzz',33);
Load('Radar1.zzz'  ,34);
Load('Radar2.zzz'  ,35);
Load('Radar3.zzz'  ,36);
Load('BBuild1.zzz' ,37);
Load('Tree1.zzz'   ,38);
Load('Tree2.zzz'   ,39);
Load('Tree3.zzz'   ,40);
Load('Car.zzz'     ,41);
Load('Dirt.zzz'    ,42);
Load('Car2.zzz'    ,43);
Load('Shore.zzz'   ,44);


Load('RiverH.zzz'  ,71);
Load('RiverV.zzz'  ,72);
Load('RiverDP.zzz' ,73);
Load('RiverHP.zzz' ,74);
Load('RiverLH.zzz' ,75);
Load('RiverLD.zzz' ,76);

Load('TerPr12.zzz' ,91);

Load('repulse.zzz' ,100);

Load('Heli00.zzz'  ,101);
Load('Heli30.zzz'  ,102);
Load('Heli45.zzz'  ,103);
Load('Heli60.zzz'  ,104);
Load('Ship100.zzz' ,105);
Load('Ship130.zzz' ,106);
Load('Ship145.zzz' ,107);
Load('Ship160.zzz' ,108);
Load('Hlav100.zzz' ,109);
Load('Hlav130.zzz' ,110);
Load('Hlav145.zzz' ,111);
Load('Hlav160.zzz' ,112);
Load('Tur200.zzz'  ,113);
Load('Tur230.zzz'  ,114);
Load('Tur245.zzz'  ,115);
Load('Tur260.zzz'  ,116);
Load('Ship200.zzz' ,117);
Load('Ship230.zzz' ,118);
Load('Ship245.zzz' ,119);
Load('Ship260.zzz' ,120);
Load('Ship300.zzz' ,121);
Load('Ship330.zzz' ,122);
Load('Ship345.zzz' ,123);
Load('Ship360.zzz' ,124);

Load('BShip1a.zzz' ,151);
Load('BShip1b.zzz' ,152);

Load('Tank100.zzz' ,201);
Load('Tank130.zzz' ,202);
Load('Tank145.zzz' ,203);
Load('Tank160.zzz' ,204);

Load('Boss1A.zzz'  ,251);
Load('Boss1B.zzz'  ,252);
Load('Boss1C.zzz'  ,253);


Load('Turret1.zzz' ,301);
Load('Turret1d.zzz',302);
Load('Turret2d.zzz',303);
Load('Bunker.zzz'  ,304);

END;
{}
GoToXY(1,17);
TextColor(12);
If ErrDL=1 then Writeln('     During loading were occured ',ErrDL,' errors!');
TextBackGround(0);
TextColor(7+128);
Writeln('    Loading done press any key...');

{Readkey;{}
TextColor(7);
Writeln('Running graphic engine...');

TextMode(1);

Assign(ff,'history.doa');
Append(ff);
If ErrDL=1 then Writeln(ff,'Loading data done, occured ',ErrDL,' error!')
 else Writeln(ff,'Loading data done, occured ',ErrDL,' errors!');
Close(ff);

{}(**)
end.