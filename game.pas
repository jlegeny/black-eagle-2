Unit Game;

Interface

Uses Data,Main,Col256_2,Palette;


Const Shots:array[1..20,1..10] of byte=(
      (50,50,50,50,50,50,50,50,50,50), { 01 - Helicopter 1}
      (05,50,05,50, 5,50,05,50,05,50), { 02 - Space Ship 1 - Transport}
      (20,20,20,20,50,20,20,20,20,50), { 03 - Tank 1 - Panther}
      (40,40,40,40,40,40,40,40,40,40), { 04 - Turret 1 - AA Cluster Pack mkII}
      (10,40,10,40,10,40,10,40,10,40), { 05 - Rotating Turret 1 - AA Tachyion Cannon mkIV}
      ( 5,40, 5, 5, 5,40, 5, 5, 5,40), { 06 - Big Ship 1 - Commando Transporter}
      ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), { 07 - Bunker With Life}
      ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), { 08 - Bunker With Weapon}
      ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), { 09 - Bunker With Rockets}
      ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), { 10 - Bunker With Missiles}
      ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), { 11 - Bunker With Bomb}
      (30,30,30,30,30,30,30,30,30,30), { 12 - Space Ship 2 - Fang}
      (10,25,25,25,40,25,25,25,25,40), { 13 - Space Ship 3 - Destroyer}
      (10,10,10,10,40,10,10,10,10,40), { 14 - Boss 1 - Kameran Corvette}
      (00,00,00,00,00,00,00,00,00,00), { 15 - }
      (00,00,00,00,00,00,00,00,00,00), { 16 - }
      (00,00,00,00,00,00,00,00,00,00), { 17 - }
      (00,00,00,00,00,00,00,00,00,00), { 18 - }
      (00,00,00,00,00,00,00,00,00,00), { 19 - }
      (00,00,00,00,00,00,00,00,00,00));{ 20 - }

      EnHps:array[1..20] of Integer=
      {   1    2    3    4    5    6    7    8    9   10}
  { 0}(  48,  76, 200,  96, 128, 256,  50,  50,  50,  50,
  {10}   50,  32,  96,2250,   0,   0,   0,   0,   0,   0);

      EnSco:array[1..20] of Integer=
         {   1     2     3     4     5     6     7     8     9    10}
  { 0}  (  350,  525,  400,  875,  945, 2235,    0,    0,    0,    0,
  {10}       0,  375, 1345, 9565,00000,00000,00000,00000,00000,00000);

Procedure DrawEnemys(P:Integer);
Procedure DrawShots;
Procedure DrawFallingShips;
Procedure NextWp(z:Integer);
Procedure MoveEn(z:Integer);

Procedure Strelba;

Function FindSht:Integer;
Function FindEn:Integer;
Function FindExp:Integer;
Function FindFall:Integer;
Function Findtar:Integer;
Function FindBon:Integer;
procedure RouteR(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
procedure RouteS(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
procedure RouteD(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
Procedure GenEn(T,X,Y,W,PrW:Integer;Var Way:Array of Waypoint);
Procedure Shadows(W:Integer);

Function Smr(s:Integer):Integer;


Implementation

Function IsPt(x2,y2,xx,yy,z,tt:Integer):Boolean;
Var  a:Array[1..1024] of byte;
     x,y,i:Integer;
     c:Byte;
     mx,my,tx,ox,oy:Integer;
Begin
 Ispt:=FALSE;

 Move(p[z]^,a,1024);

 For y:=0 to 31 do
  For x:=0 to 31 do
   Begin
     c:=a[x+y*32+1];

       If C>0 then BEGIN
        mx:=x;my:=y;tx:=tt;

        Repeat
         If tx>=90 then Begin ox:=31-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=31-mx; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=31-my; end;
        If tx=3 then Begin mx:=31-mx; my:=31-my; end;

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199)
        and (Intrv(xx+mx,x2-1,x2+1)) and  (Intrv(yy+my,y2-1,y2+1))
       then
        IsPt:=True;
       END;


end;

end;

Procedure GenEn(T,X,Y,W,PrW:Integer;Var Way:Array of Waypoint);
Var K,i:Integer;
Begin

  If PrW=1 then Begin
   RouteR(  2, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(300,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS( -2,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=2 then Begin
   RouteR(  2, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  1,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=3 then Begin
   RouteR(  2, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  2,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=4 then Begin
   RouteR(  2, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  3,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=5 then Begin
   RouteR( 12,  2, 23, 00, 00, 00, 00, 00, 00, 00);
   RouteD(160, 60,100,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  3,  3,  3,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=6 then Begin
   RouteR( 23,  2, 12, 00, 00, 00, 00, 00, 00, 00);
   RouteD(160, 60,100,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  3,  3,  3,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=7 then Begin
   RouteR( 12, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  1,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=8 then Begin
   RouteR( 23, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  1,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=9 then Begin
   RouteR(  3, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  1,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;

  If PrW=10 then Begin
   RouteR(  1, 00, 00, 00, 00, 00, 00, 00, 00, 00);
   RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
   RouteS(  1,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  end;


  K:=FindEn;

  For i:=1 to 10 do
    Begin
     En[K].Way[i].R:=WayP[i].R;
     En[K].Way[i].D:=WayP[i].D;
     En[K].Way[i].S:=WayP[i].S;
    end;


  En[K].T:=T;
  En[K].X:=X;
  En[K].Y:=Y;
  En[K].R:=En[K].Way[1].R;
  En[K].RP:=En[K].Way[1].R;

  En[K].Hp:=EnHps[T];

  En[K].B:=0;
  En[K].D:=0;
  En[K].K:=0;


  En[K].St:=1;
  En[K].SR:=0;
  En[K].SS:=0;

  En[K].S:=En[K].Way[1].S;

  En[K].W:=1;
  En[K].MW:=W;

end;

procedure RouteR(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
Begin
WayP[1].R:=x1;WayP[2].R:=x2;WayP[3].R:=x3;WayP[4].R:=x4;WayP[5].R:=x5;
WayP[6].R:=x6;WayP[7].R:=x7;WayP[8].R:=x8;WayP[9].R:=x9;WayP[10].R:=x0;
end;

procedure RouteS(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
Begin
WayP[1].S:=x1;WayP[2].S:=x2;WayP[3].S:=x3;WayP[4].S:=x4;WayP[5].S:=x5;
WayP[6].S:=x6;WayP[7].S:=x7;WayP[8].S:=x8;WayP[9].S:=x9;WayP[10].S:=x0;
end;

procedure RouteD(x1,x2,x3,x4,x5,x6,x7,x8,x9,x0:Integer);
Begin
WayP[1].D:=x1;WayP[2].D:=x2;WayP[3].D:=x3;WayP[4].D:=x4;WayP[5].D:=x5;
WayP[6].D:=x6;WayP[7].D:=x7;WayP[8].D:=x8;WayP[9].D:=x9;WayP[10].D:=x0;
end;

Function FindSht:Integer;
Var i:integer;
Begin
 FindSht:=100;
 For i:=1 to 100 do
  If St[i].T=0 then
   Begin
    FindSht:=i;
    Break;
   end;
end;


Function FindEn:Integer;
Var i:integer;
Begin
 FindEn:=30;
 For i:=1 to 30 do
  If En[i].T=0 then
   Begin
    FindEn:=i;
    Break;
   end;
end;

Function FindVr:Integer;
Var i:integer;
Begin
 FindVr:=30;
 For i:=1 to 30 do
  If Vr[i].T=0 then
   Begin
    FindVr:=i;
    Break;
   end;
end;

Function FindExp:Integer;
Var i:integer;
Begin
 FindExp:=100;
 For i:=1 to 100 do
  If Exp[i].T=0 then
   Begin
    FindExp:=i;
    Break;
   end;
end;

Function FindFall:Integer;
Var i:integer;
Begin
 FindFall:=10;
 For i:=1 to 10 do
  If Fall[i].T=0 then
   Begin
    FindFall:=i;
    Break;
   end;
end;

Function FindBon:Integer;
Var i:integer;
Begin
 FindBon:=10;
 For i:=1 to 10 do
  If Bon[i].T=0 then
   Begin
    FindBon:=i;
    Break;
   end;
end;

Function FindTar:Integer;
Var i:integer;
Begin
 FindTar:=0;
 For i:=1 to 30 do
  If (En[i].T>00) and (En[i].X>=0) and (En[i].X<=320) and (En[i].Y>=0) and (En[i].Y<=200)
 then
   Begin
    Findtar:=i;
    Break;
   end;
end;

Procedure NextWp(z:Integer);
Begin

    If En[z].D>=En[z].Way[En[z].W].D then Begin
     Inc(En[z].W);
     If (En[z].W=11) and (En[z].T in [14]) then En[z].W:=3;

     En[z].RP:=En[z].Way[En[z].W].R;
     En[z].S:=En[z].Way[En[z].W].S;
     En[z].D:=0;

     if (En[z].W>En[z].MW) and not(En[z].T in [14]) then En[z].T:=0;
    end;

end;

Function Smr(s:Integer):Integer;
Begin
 if s= 2 then Smr:=0;
 if s=23 then Smr:=1;
 if s= 3 then Smr:=2;
 if s=36 then Smr:=3;
 if s= 6 then Smr:=4;
 if s=69 then Smr:=5;
 if s= 9 then Smr:=6;
 if s=98 then Smr:=7;
 if s= 8 then Smr:=8;
 if s=87 then Smr:=9;
 if s= 7 then Smr:=10;
 if s=74 then Smr:=11;
 if s= 4 then Smr:=12;
 if s=41 then Smr:=13;
 if s= 1 then Smr:=14;
 if s=12 then Smr:=15;
end;

Function StUX(s:Integer):Integer;
Begin
 if s= 2 then StUX:=0;
 if s=23 then StUX:=+5;
 if s= 3 then StUX:=+10;
 if s=36 then StUX:=+10;
 if s= 6 then StUX:=+10;
 if s=69 then StUX:=+10;
 if s= 9 then StUX:=+10;
 if s=98 then StUX:=+5;
 if s= 8 then StUX:=0;
 if s=87 then StUX:=-5;
 if s= 7 then StUX:=-10;
 if s=74 then StUX:=-10;
 if s= 4 then StUX:=-10;
 if s=41 then StUX:=-10;
 if s= 1 then StUX:=-10;
 if s=12 then StUX:=-5;
end;

Function StUY(s:Integer):Integer;
Begin
 if s= 2 then StUY:=+10;
 if s=23 then StUY:=+10;
 if s= 3 then StUY:=+10;
 if s=36 then StUY:=+5;
 if s= 6 then StUY:=0;
 if s=69 then StUY:=-5;
 if s= 9 then StUY:=-10;
 if s=98 then StUY:=-10;
 if s= 8 then StUY:=-10;
 if s=87 then StUY:=-10;
 if s= 7 then StUY:=-10;
 if s=74 then StUY:=-5;
 if s= 4 then StUY:=0;
 if s=41 then StUY:=+5;
 if s= 1 then StUY:=+10;
 if s=12 then StUY:=+10;
end;


Procedure DrawFallingShips;
Begin

{FALLING SHIPS}
For z:=1 to 10 do
Begin

If Fall[z].T in [1,2,12,13] then Begin

If Fall[z].T=1 then o:=0;
If Fall[z].T=2 then o:=4;
If Fall[z].T=12 then o:=16;
If Fall[z].T=13 then o:=20;

If  Smer[Fall[z].R]= 2 then MIco(Fall[z].X-16,Fall[z].Y-16,101+o,32-Fall[z].P,31-Fall[z].P,0,0);
 If Smer[Fall[z].R]= 6 then MIco(Fall[z].X-16,Fall[z].Y-16,101+o,32-Fall[z].P,31-Fall[z].P,0,270);
 If Smer[Fall[z].R]= 8 then MIco(Fall[z].X-16,Fall[z].Y-16,101+o,32-Fall[z].P,31-Fall[z].P,0,180);
 If Smer[Fall[z].R]= 4 then MIco(Fall[z].X-16,Fall[z].Y-16,101+o,32-Fall[z].P,31-Fall[z].P,0,90);
If  Smer[Fall[z].R]= 3 then MIco(Fall[z].X-16,Fall[z].Y-16,103+o,32-Fall[z].P,31-Fall[z].P,0,0);
 If Smer[Fall[z].R]= 9 then MIco(Fall[z].X-16,Fall[z].Y-16,103+o,32-Fall[z].P,31-Fall[z].P,0,270);
 If Smer[Fall[z].R]= 7 then MIco(Fall[z].X-16,Fall[z].Y-16,103+o,32-Fall[z].P,31-Fall[z].P,0,180);
 If Smer[Fall[z].R]= 1 then MIco(Fall[z].X-16,Fall[z].Y-16,103+o,32-Fall[z].P,31-Fall[z].P,0,90);
If  Smer[Fall[z].R]=23 then MIco(Fall[z].X-16,Fall[z].Y-16,102+o,32-Fall[z].P,31-Fall[z].P,0,0);
 If Smer[Fall[z].R]=69 then MIco(Fall[z].X-16,Fall[z].Y-16,102+o,32-Fall[z].P,31-Fall[z].P,0,270);
 If Smer[Fall[z].R]=87 then MIco(Fall[z].X-16,Fall[z].Y-16,102+o,32-Fall[z].P,31-Fall[z].P,0,180);
 If Smer[Fall[z].R]=41 then MIco(Fall[z].X-16,Fall[z].Y-16,102+o,32-Fall[z].P,31-Fall[z].P,0,90);
If  Smer[Fall[z].R]=12 then MIco(Fall[z].X-16,Fall[z].Y-16,104+o,32-Fall[z].P,31-Fall[z].P,0,0);
 If Smer[Fall[z].R]=36 then MIco(Fall[z].X-16,Fall[z].Y-16,104+o,32-Fall[z].P,31-Fall[z].P,0,270);
 If Smer[Fall[z].R]=98 then MIco(Fall[z].X-16,Fall[z].Y-16,104+o,32-Fall[z].P,31-Fall[z].P,0,180);
 If Smer[Fall[z].R]=74 then MIco(Fall[z].X-16,Fall[z].Y-16,104+o,32-Fall[z].P,31-Fall[z].P,0,90);

Inc(Fall[z].P);
If Fall[z].P>=15 then
 Begin
  Fall[z].T:=0;
  a:=Findexp;
  Exp[a].T:=2;
  Exp[a].X:=Fall[z].X-8;
  Exp[a].Y:=Fall[z].Y-8;
  Exp[a].P:=0;

  a:=FindVr;
  Vr[a].T:=3;
  Vr[a].X:=Fall[z].X-8;
  Vr[a].Y:=Fall[z].Y-8;


 end;


Inc(Fall[z].R);
If Fall[z].R=16 then Fall[z].R:=0;

end;

If Fall[z].T in [6] then Begin

MIco(Fall[z].X-32+Fall[z].P div 2,Fall[z].Y-16,151,32-Fall[z].P,31-Fall[z].P,0,0);
MIco(Fall[z].X   -Fall[z].P div 2-Fall[z].P mod 2,Fall[z].Y-16,152,32-Fall[z].P,31-Fall[z].P,0,0);

Inc(Fall[z].Y,1);

If roll mod 2 = 0 then Inc(Fall[z].P);

If Fall[z].P>=15 then
 Begin
  Fall[z].T:=0;
  For i:=1 to 10 do Begin
   a:=Findexp;  Exp[a].T:=R(2)+1;  Exp[a].X:=Fall[z].X-24+R(40);  Exp[a].Y:=Fall[z].Y-14+R(16);  Exp[a].P:=0;
  end;

  a:=FindVr;  Vr[a].T:=3;  Vr[a].X:=Fall[z].X-14;  Vr[a].Y:=Fall[z].Y-8;
  a:=FindVr;  Vr[a].T:=3;  Vr[a].X:=Fall[z].X+ 4;  Vr[a].Y:=Fall[z].Y-8;
 end;

end;


If Fall[z].T in [14] then Begin

 MIco(Fall[z].X-48+Fall[z].P*2,Fall[z].Y-16,251,31-Fall[z].P,31-Fall[z].P,0,0);
 MIco(Fall[z].X-16+Fall[z].P div 2,Fall[z].Y-16,252,31-Fall[z].P,31-Fall[z].P,0,0);
 MIco(Fall[z].X+16-Fall[z].P,Fall[z].Y-16,253,31-Fall[z].P,31-Fall[z].P,0,0);

  For i:=1 to 1 do Begin
   a:=Findexp;  Exp[a].T:=R(2)+1;  Exp[a].X:=Fall[z].X-16+Fall[z].P div 2+R(40-Fall[z].P div 4);  Exp[a].Y:=Fall[z].Y-14+R(16);
   Exp[a].P:=0;
  end;

Inc(Fall[z].Y,2);

If roll mod 2 = 0 then Inc(Fall[z].P);

If Fall[z].P>=15 then
 Begin
  Fall[z].T:=0;
  For i:=1 to 20 do Begin
   a:=Findexp;  Exp[a].T:=R(2)+1;  Exp[a].X:=Fall[z].X-48+R(96);  Exp[a].Y:=Fall[z].Y-14+R(16);  Exp[a].P:=0;
  end;

  a:=FindVr;  Vr[a].T:=3;  Vr[a].X:=Fall[z].X-14;  Vr[a].Y:=Fall[z].Y-8;
  a:=FindVr;  Vr[a].T:=3;  Vr[a].X:=Fall[z].X+ 4;  Vr[a].Y:=Fall[z].Y-8;
 end;

end;


end;

end;


Procedure DrawEnemys(P:Integer);
Var pp:Integer;
Begin

For z:=1 to 30 do
BEGIN
 PP:=0;
 If (p=1) and (En[z].T in [1,2,6,12,13,14]) then pp:=1;
 If (p=2) and (En[z].T in [3]) then pp:=1;
 If (p=3) and (En[z].T in [4,5,7,8,9,10,11]) then pp:=1;


 If pp=1  then Begin

If En[z].T in [1] then BEGIN
 a:=R(4);a:=90*a;
 b:=R(4);a:=a+b;
 DIco(En[z].X-16,En[z].Y-16,100,0,a);
END;

 if Px-En[z].X<>0 then xx:=Px-En[z].X else xx:=1;
 if Py-En[z].Y<>0 then yy:=Py-En[z].Y else yy:=1;


If  Intrv(Abs(xx/yy),0.00,0.33) and (yy>=0) then En[z].R:=2;
 If Intrv(Abs(xx/yy),0.00,0.33) and (yy<=0) then En[z].R:=8;
If  Intrv(Abs(xx/yy),1.66,1000) and (xx>=0) then En[z].R:=6;
 If Intrv(Abs(xx/yy),1.66,1000) and (xx<=0) then En[z].R:=4;
If  Intrv(Abs(xx/yy),0.33,0.66) and (yy>=0) and (xx<=0) then En[z].R:=12;
 If Intrv(Abs(xx/yy),0.33,0.66) and (yy>=0) and (xx>=0) then En[z].R:=23;
 If Intrv(Abs(xx/yy),0.33,0.66) and (yy<=0) and (xx<=0) then En[z].R:=87;
 If Intrv(Abs(xx/yy),0.33,0.66) and (yy<=0) and (xx>=0) then En[z].R:=98;
If  Intrv(Abs(xx/yy),0.66,1.33) and (yy>=0) and (xx<=0) then En[z].R:=1;
 If Intrv(Abs(xx/yy),0.66,1.33) and (yy>=0) and (xx>=0) then En[z].R:=3;
 If Intrv(Abs(xx/yy),0.66,1.33) and (yy<=0) and (xx<=0) then En[z].R:=7;
 If Intrv(Abs(xx/yy),0.66,1.33) and (yy<=0) and (xx>=0) then En[z].R:=9;
If  Intrv(Abs(xx/yy),1.33,1.66) and (yy>=0) and (xx<=0) then En[z].R:=41;
 If Intrv(Abs(xx/yy),1.33,1.66) and (yy>=0) and (xx>=0) then En[z].R:=36;
 If Intrv(Abs(xx/yy),1.33,1.66) and (yy<=0) and (xx<=0) then En[z].R:=74;
 If Intrv(Abs(xx/yy),1.33,1.66) and (yy<=0) and (xx>=0) then En[z].R:=69;

If En[z].T in [2,12,13] then En[z].R:=En[z].RP;


If En[z].T in [5,7,8,9,10,11] then BEGIN
 If En[z].T=5 then o:=2;
 If En[z].T in [7,8,9,10,11] then o:=3;
 DIco(En[z].X-16,En[z].Y-16,301+o,0,0);
END;

If En[z].T in [3] then BEGIN
If En[z].T=3 then o:=0;

If  En[z].RP= 2 then DIco(En[z].X-16,En[z].Y-16,201+o,0,0);
 If En[z].RP= 6 then DIco(En[z].X-16,En[z].Y-16,201+o,0,270);
 If En[z].RP= 8 then DIco(En[z].X-16,En[z].Y-16,201+o,0,180);
 If En[z].RP= 4 then DIco(En[z].X-16,En[z].Y-16,201+o,0,90);
If  En[z].RP= 3 then DIco(En[z].X-16,En[z].Y-16,203+o,0,0);
 If En[z].RP= 9 then DIco(En[z].X-16,En[z].Y-16,203+o,0,270);
 If En[z].RP= 7 then DIco(En[z].X-16,En[z].Y-16,203+o,0,180);
 If En[z].RP= 1 then DIco(En[z].X-16,En[z].Y-16,203+o,0,90);
If  En[z].RP=23 then DIco(En[z].X-16,En[z].Y-16,202+o,0,0);
 If En[z].RP=69 then DIco(En[z].X-16,En[z].Y-16,202+o,0,270);
 If En[z].RP=87 then DIco(En[z].X-16,En[z].Y-16,202+o,0,180);
 If En[z].RP=41 then DIco(En[z].X-16,En[z].Y-16,202+o,0,90);
If  En[z].RP=12 then DIco(En[z].X-16,En[z].Y-16,204+o,0,0);
 If En[z].RP=36 then DIco(En[z].X-16,En[z].Y-16,204+o,0,270);
 If En[z].RP=98 then DIco(En[z].X-16,En[z].Y-16,204+o,0,180);
 If En[z].RP=74 then DIco(En[z].X-16,En[z].Y-16,204+o,0,90);
END;


if En[z].T in [1,2,3,5,12,13] then BEGIN

If En[z].T=1 then o:=0;
If En[z].T=2 then o:=4;
If En[z].T=3 then o:=8;
If En[z].T=5 then o:=12;
If En[z].T=12 then o:=16;
If En[z].T=13 then o:=20;


If  En[z].R= 2 then DIco(En[z].X-16,En[z].Y-16,101+o,0,0);
 If En[z].R= 6 then DIco(En[z].X-16,En[z].Y-16,101+o,0,270);
 If En[z].R= 8 then DIco(En[z].X-16,En[z].Y-16,101+o,0,180);
 If En[z].R= 4 then DIco(En[z].X-16,En[z].Y-16,101+o,0,90);
If  En[z].R= 3 then DIco(En[z].X-16,En[z].Y-16,103+o,0,0);
 If En[z].R= 9 then DIco(En[z].X-16,En[z].Y-16,103+o,0,270);
 If En[z].R= 7 then DIco(En[z].X-16,En[z].Y-16,103+o,0,180);
 If En[z].R= 1 then DIco(En[z].X-16,En[z].Y-16,103+o,0,90);
If  En[z].R=23 then DIco(En[z].X-16,En[z].Y-16,102+o,0,0);
 If En[z].R=69 then DIco(En[z].X-16,En[z].Y-16,102+o,0,270);
 If En[z].R=87 then DIco(En[z].X-16,En[z].Y-16,102+o,0,180);
 If En[z].R=41 then DIco(En[z].X-16,En[z].Y-16,102+o,0,90);
If  En[z].R=12 then DIco(En[z].X-16,En[z].Y-16,104+o,0,0);
 If En[z].R=36 then DIco(En[z].X-16,En[z].Y-16,104+o,0,270);
 If En[z].R=98 then DIco(En[z].X-16,En[z].Y-16,104+o,0,180);
 If En[z].R=74 then DIco(En[z].X-16,En[z].Y-16,104+o,0,90);

END;
{}

If En[z].T in [4] then BEGIN
 If En[z].T=4 then o:=0;
 DIco(En[z].X-16,En[z].Y-16,301+o,0,0);
END;

If En[z].T in [6] then BEGIN
 If En[z].T=6 then o:=0;
 DIco(En[z].X-32,En[z].Y-16,151+o,0,0);
 DIco(En[z].X   ,En[z].Y-16,152+o,0,0);
END;

If En[z].T in [14] then BEGIN
 If En[z].T=14 then o:=0;
 DIco(En[z].X-48,En[z].Y-16,251+o,0,0);
 DIco(En[z].X-16,En[z].Y-16,252+o,0,0);
 DIco(En[z].X+16,En[z].Y-16,253+o,0,0);

 If Roll mod 5 =  0 then
 If En[z].Hp<500 then
  For i:=1 to  1 do Begin
   a:=Findexp;Exp[a].T:=1;Exp[a].X:=En[z].X-48+R(96);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
  end;

 If Roll mod 5 =  1 then
 If En[z].Hp<250 then
  For i:=1 to  1 do Begin
   a:=Findexp;Exp[a].T:=2;Exp[a].X:=En[z].X-48+R(96);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
  end;

 If Roll mod 4 =  0 then
 If En[z].Hp<100 then
  For i:=1 to  1 do Begin
   a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-48+R(96);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
  end;

END;

  Inc(En[z].K);

  If (En[z].T in [3]) and ( (En[z].K > Shots[En[z].T,En[z].St]-1)  or (En[z].K=1))then BEGIN
    If  En[z].R= 2 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,46,0,0);
     If En[z].R= 6 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,46,0,270);
     If En[z].R= 8 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,46,0,180);
     If En[z].R= 4 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,46,0,90);
    If  En[z].R= 3 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,48,0,0);
     If En[z].R= 9 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,48,0,270);
     If En[z].R= 7 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,48,0,180);
     If En[z].R= 1 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,48,0,90);
    If  En[z].R=23 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,0);
     If En[z].R=69 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,270);
     If En[z].R=87 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,180);
     If En[z].R=41 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,90);
    If  En[z].R=12 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,1);
     If En[z].R=36 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,272);
     If En[z].R=98 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,181);
     If En[z].R=74 then DSIco(En[z].X-8+StUX(En[z].R) div 5 * 8,En[z].Y-8+StUY(En[z].R) div 5 * 8,47,0,92);
  END;

  If En[z].K>=Shots[En[z].T,En[z].St] Then Begin
   En[z].K:=0;
   Inc(En[z].St); If En[z].St=11 then En[z].St:=1;

   If En[z].T in [1,3,5,13] then BEGIN
    a:=FindSht;
    If En[z].T in [1,3] then St[a].T:=101;
    If En[z].T in [5] then St[a].T:=102;
    If En[z].T in [13] then St[a].T:=103;

    St[a].X:=En[z].X+StUX(En[z].R);
    St[a].Y:=En[z].Y+StUY(En[z].R);

    If En[z].T in [3] then Begin
     St[a].X:=En[z].X+StUX(En[z].R) div 5 * 8;
     St[a].Y:=En[z].Y+StUY(En[z].R) div 5 * 8;
    end;

    St[a].S:=En[z].R;
    St[a].B:=0;

    If En[z].T in [1,3] then St[a].P:=1;
    If En[z].T in [5,13] then St[a].P:=2;
   END;

   If En[z].T in [2,12] then BEGIN
    a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+StUX(En[z].R)-4; St[a].Y:=En[z].Y+StUY(En[z].R);
    St[a].S:=En[z].R; St[a].B:=0;
    If En[z].T=2 then St[a].P:=2;
    If En[z].T=12 then St[a].P:=3;

    a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+StUX(En[z].R)+4; St[a].Y:=En[z].Y+StUY(En[z].R);
    St[a].S:=En[z].R; St[a].B:=0;
    If En[z].T=2 then St[a].P:=2;
    If En[z].T=12 then St[a].P:=3;
   END;

   If En[z].T in [4] then BEGIN
    a:=FindSht;
    St[a].T:=101;
    St[a].X:=En[z].X+2;
    St[a].Y:=En[z].Y-5;
    St[a].S:=En[z].R;
    St[a].B:=0;
    St[a].P:=1;
   END;

   If En[z].T in [6] then BEGIN
    If En[z].St <3 then Begin
    For i:=0 to 4 do Begin
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-5-i*5; St[a].Y:=En[z].Y-i;
     St[a].S:=2; St[a].B:=0; St[a].P:=2;

     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+5+i*5; St[a].Y:=En[z].Y-i;
     St[a].S:=2; St[a].B:=0; St[a].P:=2;
    end;
    end else
     Begin
      a:=FindSht; St[a].T:=101; St[a].X:=En[z].X; St[a].Y:=En[z].Y+7;
      St[a].S:=En[z].R; St[a].B:=0; St[a].P:=1;
     end;
   END;


   If En[z].T in [14] then BEGIN
     a:=FindSht; St[a].T:=101; St[a].X:=En[z].X; St[a].Y:=En[z].Y;
     St[a].S:=En[z].R; St[a].B:=0; St[a].P:=2;

    If En[z].St in [1,6] then BEGIN
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=2; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=12; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=1; St[a].B:=0; St[a].P:=3;

     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=2; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=23; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=3; St[a].B:=0; St[a].P:=3;
    END;

    If En[z].St in [2,7] then BEGIN
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=12; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=1; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=41; St[a].B:=0; St[a].P:=3;

     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=23; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=3; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=36; St[a].B:=0; St[a].P:=3;
    END;

    If En[z].St in [3,8] then BEGIN
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=1; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=41; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=4; St[a].B:=0; St[a].P:=3;

     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=3; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=36; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=6; St[a].B:=0; St[a].P:=3;
    END;

    If En[z].St in [4,9] then BEGIN
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=41; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=4; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X-25; St[a].Y:=En[z].Y+9; St[a].S:=74; St[a].B:=0; St[a].P:=3;

     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=36; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=6; St[a].B:=0; St[a].P:=3;
     a:=FindSht; St[a].T:=102; St[a].X:=En[z].X+25; St[a].Y:=En[z].Y+9; St[a].S:=69; St[a].B:=0; St[a].P:=3;
    END;

   END;


  end;

MoveEn(z);


 If (En[z].T in [1,2,6,12,13]) and (Abs(En[z].X-Px)<20) and (Abs(En[z].Y-Py)<20)
   and (InVis=0)
 then
  Begin
   PalR:=20;
   Dec(En[z].Hp,160);
   Dec(Life,12);
  end;


 If En[z].Hp<=0 then Begin

  If En[z].T in [1,2,12,13] then BEGIN
   o:=R(5);
   if o=0 then BEGIN
   a:=FindFall;Fall[a].T:=En[z].T;Fall[a].R:=0;Fall[a].X:=En[z].X;Fall[a].Y:=En[z].Y;Fall[a].P:=0;
   END ELSE
   For i:=1 to 4 do Begin
    a:=Findexp;Exp[a].T:=(i div 4)+1;Exp[a].X:=En[z].X-16+R(32);Exp[a].Y:=En[z].Y-8+R(16);Exp[a].P:=0;
   end;


  end;

  If En[z].T in [3,7,8,9,10,11] then BEGIN
   For i:=1 to 5 do Begin
    a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-20+R(40);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
   end;

   If En[z].T in [7,8,9,10,11] then BEGIN
    a:=FindBon;   Bon[a].X:=En[z].X;   Bon[a].Y:=En[z].Y;   Bon[a].D:=1;   Bon[a].CD:=1;
    If En[z].T = 7 then Bon[a].T:=1;
    If En[z].T = 8 then Bon[a].T:=2;
    If En[z].T = 9 then Bon[a].T:=3;
    If En[z].T =10 then Bon[a].T:=4;
    If En[z].T =11 then Bon[a].T:=5;
   END;
  end;

  If En[z].T in [4,5] then BEGIN
   For i:=1 to 5 do Begin
    a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-20+R(40);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
   end;

   a:=FindVr;
   If En[z].T=4 then Vr[a].T:=1;
   If En[z].T=5 then Vr[a].T:=2;
   Vr[a].X:=En[z].X;
   Vr[a].Y:=En[z].Y;
  end;


  If En[z].T in [6] then BEGIN
   For i:=1 to 5 do Begin
    a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-20+R(40);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
   end;

   o:=R(5);
   if o=0 then BEGIN
    a:=FindFall;Fall[a].T:=En[z].T;Fall[a].R:=0;Fall[a].X:=En[z].X;Fall[a].Y:=En[z].Y;Fall[a].P:=0;
   end else
   For i:=1 to 5 do Begin
    a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-20+R(40);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
   end;

  end;

  If En[z].T in [14] then BEGIN
   For i:=1 to 20 do Begin
    a:=Findexp;Exp[a].T:=R(2)+1;Exp[a].X:=En[z].X-48+R(96);Exp[a].Y:=En[z].Y-16+R(32);Exp[a].P:=0;
   end;

    a:=FindFall;Fall[a].T:=En[z].T;Fall[a].R:=0;Fall[a].X:=En[z].X;Fall[a].Y:=En[z].Y;Fall[a].P:=0;
  end;

  Inc(Score,EnSco[En[z].T]);
  En[z].T:=0;

 end;

end;

END;

end;


Procedure DrawShots;
Begin
For z:=1 to 100 do
 if St[z].T>0 then
  Begin

   if St[z].T in [1,2,3,4] then
   Begin

    DSIco(St[z].X-1,St[z].Y,10+St[z].T,0,0);
    If St[z].T=1 then Dec(St[z].Y,5);
    If St[z].T=2 then Dec(St[z].Y,6);
    If St[z].T=3 then Dec(St[z].Y,7);
    If St[z].T=4 then Dec(St[z].Y,7);

   For i:=1 to 30 do
    Begin
     U:=0;
     If En[i].T in [6] then U:=16;
     If En[i].T in [14] then U:=36;

    If (En[i].T>0) and (Abs(En[i].X-St[z].X)<12+U) and (Abs(En[i].Y-St[z].Y)<12) then
     Begin
      If St[z].T=1 then Dec(En[i].Hp,5);
      If St[z].T=2 then Dec(En[i].Hp,13);
      If St[z].T=3 then Dec(En[i].Hp,28);
      If St[z].T=4 then Dec(En[i].Hp,32);
      St[z].T:=0;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;
     end;

    end;

    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;


   end;

{----------------------------}
   if St[z].T in [5] then
   Begin

    Dec(St[z].Y,8);
{    Dec(St[z].X,R(7)-3);}

    For d:=1 to 25 do begin x:=St[z].X+R(32)-16;y:=St[z].Y+R(32)-10;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,57,Vaddr);end;
    For d:=1 to 13 do begin x:=St[z].X+R(32)-16;y:=St[z].Y+R(12)+1;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,59,Vaddr);end;
    For d:=1 to 13 do begin x:=St[z].X+R(20)-10;y:=St[z].Y+R(12)+1;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,61,Vaddr);end;
    For d:=1 to 13 do begin x:=St[z].X+R(16)-8;y:=St[z].Y+R(12)+1;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,62,Vaddr);end;
    For d:=1 to 13 do begin x:=St[z].X+R(12)-6;y:=St[z].Y+R(12)+1;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,63,Vaddr);end;
    For d:=1 to 13 do begin x:=St[z].X+R(8)-4;y:=St[z].Y+R(12)+1;
      If (x>=28) and (x<=291) and (y>=0) and (y<=199) then PutPixel(x,y,174,Vaddr);end;

   For i:=1 to 30 do
    Begin
     U:=0;
     If En[i].T in [6] then U:=16;
     If En[i].T in [14] then U:=36;

    If (En[i].T>0) and (Abs(En[i].X-St[z].X)<12+U) and (Abs(En[i].Y-St[z].Y)<12) then
     Begin
      Dec(En[i].Hp,30);
      St[z].T:=0;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;
     end;
    end;


    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;


{    END;}

   end;


   if St[z].T in [11,12] then
   Begin

    If St[z].T=11 then o:=1;
    If St[z].T=12 then o:=3;

    DSIco(St[z].X-o,St[z].Y,21+(St[z].T-11)*2+(St[z].B mod 2),0,0);
    Dec(St[z].Y,4);
    If St[z].B=0 then Inc(St[z].X,St[z].S);
    Inc(St[z].B);If St[z].B=3 then St[z].B:=0;

   For i:=1 to 30 do
    Begin
     U:=0;
     If En[i].T in [6] then U:=16;
     If En[i].T in [14] then U:=36;

    If (En[i].T>0) and (Abs(En[i].X-St[z].X)<12+U) and (Abs(En[i].Y-St[z].Y)<12) then
     Begin
      If St[z].T = 11 then Dec(En[i].Hp,24);
      If St[z].T = 12 then Dec(En[i].Hp,42);
      St[z].T:=0;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;
     end;
    end;

    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;

    EnLight3(St[z].X-7,St[z].Y+5, 2,18,3,Vaddr);
    EnLight3(St[z].X-7,St[z].Y+10,-2,18,3,Vaddr);
    EnLight3(St[z].X-7,St[z].Y+14,-1,18,2,Vaddr);
    EnLight3(St[z].X-7,St[z].Y+17,-1,18,2,Vaddr);
    EnLight3(St[z].X-7,St[z].Y+20,-1,18,2,Vaddr);

   end;

{----------------------------}
   if St[z].T in [21,22] then
   Begin


    If En[St[z].Tar].T=0 then St[z].Tar:=0;

    If (St[z].Tar=0) and (St[z].P=St[z].T-21) then St[z].tar:=FindTar;

    a:=Smr(St[z].S);
    v:=0;
    If (St[z].T=21) and (St[z].P mod 10 = 0) then v:=1;
    If (St[z].T=22) and (St[z].P mod 5 = 1) then v:=1;

    if (St[z].Tar>0) and (v=1) then Begin
      if St[z].X-En[St[z].Tar].X<>0 then xx:=-(St[z].X-En[St[z].Tar].X) else xx:=1;
      if St[z].Y-En[St[z].Tar].Y<>0 then yy:=-(St[z].Y-En[St[z].Tar].Y) else yy:=1;

      If  Intrv(Abs(xx/yy),0.00,0.33) and (yy>=0) then St[z].S:=2;
      If Intrv(Abs(xx/yy),0.00,0.33) and (yy<=0) then St[z].S:=8;
      If  Intrv(Abs(xx/yy),1.66,1000) and (xx>=0) then St[z].S:=6;
      If Intrv(Abs(xx/yy),1.66,1000) and (xx<=0) then St[z].S:=4;
      If  Intrv(Abs(xx/yy),0.33,0.66) and (yy>=0) and (xx<=0) then St[z].S:=12;
      If Intrv(Abs(xx/yy),0.33,0.66) and (yy>=0) and (xx>=0) then St[z].S:=23;
      If Intrv(Abs(xx/yy),0.33,0.66) and (yy<=0) and (xx<=0) then St[z].S:=87;
      If Intrv(Abs(xx/yy),0.33,0.66) and (yy<=0) and (xx>=0) then St[z].S:=98;
      If  Intrv(Abs(xx/yy),0.66,1.33) and (yy>=0) and (xx<=0) then St[z].S:=1;
      If Intrv(Abs(xx/yy),0.66,1.33) and (yy>=0) and (xx>=0) then St[z].S:=3;
      If Intrv(Abs(xx/yy),0.66,1.33) and (yy<=0) and (xx<=0) then St[z].S:=7;
      If Intrv(Abs(xx/yy),0.66,1.33) and (yy<=0) and (xx>=0) then St[z].S:=9;
      If  Intrv(Abs(xx/yy),1.33,1.66) and (yy>=0) and (xx<=0) then St[z].S:=41;
      If Intrv(Abs(xx/yy),1.33,1.66) and (yy>=0) and (xx>=0) then St[z].S:=36;
      If Intrv(Abs(xx/yy),1.33,1.66) and (yy<=0) and (xx<=0) then St[z].S:=74;
      If Intrv(Abs(xx/yy),1.33,1.66) and (yy<=0) and (xx>=0) then St[z].S:=69;
    end;

    b:=Smr(St[z].S);

    If a<>b then BEGIN

     If a>b then U:=a-1;
     If a<b then U:=a+1;
     If u<0 then u:=15;
     If u>15 then u:=0;

     St[z].S:=Smer[u];
    END;

    If  St[z].S= 2 then DSIco(St[z].X-8,St[z].Y-6,31+(St[z].B*3)+((St[z].T-21)*6),0,0);
     If St[z].S= 6 then DSIco(St[z].X-8,St[z].Y-6,31+(St[z].B*3)+((St[z].T-21)*6),0,270);
     If St[z].S= 8 then DSIco(St[z].X-8,St[z].Y-6,31+(St[z].B*3)+((St[z].T-21)*6),0,180);
     If St[z].S= 4 then DSIco(St[z].X-8,St[z].Y-6,31+(St[z].B*3)+((St[z].T-21)*6),0,90);
    If  St[z].S= 3 then DSIco(St[z].X-8,St[z].Y-6,33+(St[z].B*3)+((St[z].T-21)*6),0,0);
     If St[z].S= 9 then DSIco(St[z].X-8,St[z].Y-6,33+(St[z].B*3)+((St[z].T-21)*6),0,270);
     If St[z].S= 7 then DSIco(St[z].X-8,St[z].Y-6,33+(St[z].B*3)+((St[z].T-21)*6),0,180);
     If St[z].S= 1 then DSIco(St[z].X-8,St[z].Y-6,33+(St[z].B*3)+((St[z].T-21)*6),0,90);
    If  St[z].S=23 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,0);
     If St[z].S=69 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,270);
     If St[z].S=87 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,180);
     If St[z].S=41 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,90);
    If  St[z].S=12 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,1);
     If St[z].S=36 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,272);
     If St[z].S=98 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,181);
     If St[z].S=74 then DSIco(St[z].X-8,St[z].Y-6,32+(St[z].B*3)+((St[z].T-21)*6),0,92);
{}
    inc(St[z].B);
    If St[z].B>=2 then St[z].B:=0;

   For i:=1 to St[z].T-20 do BEGIN
    inc(St[z].P);
    If St[z].P>=20 then St[z].P:=0;


    If St[z].S=2 then Begin Inc(St[z].Y,3); end;
    If St[z].S=8 then Begin Dec(St[z].Y,3); end;

    If St[z].S=6 then Begin Inc(St[z].X,3); end;
    If St[z].S=4 then Begin Dec(St[z].X,3); end;

    If St[z].S=3 then Begin Inc(St[z].X,2);Inc(St[z].Y,2); end;
    If St[z].S=9 then Begin Inc(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=7 then Begin Dec(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=1 then Begin Dec(St[z].X,2);Inc(St[z].Y,2); end;

    If St[z].S=23 then Begin Inc(St[z].X,1);Inc(St[z].Y,2); end;
    If St[z].S=36 then Begin Inc(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=69 then Begin Inc(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=98 then Begin Inc(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=87 then Begin Dec(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=74 then Begin Dec(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=41 then Begin Dec(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=12 then Begin Dec(St[z].X,1);Inc(St[z].Y,2); end;
   END;

   For i:=1 to 30 do
    Begin
     U:=0;
     If En[i].T in [6] then U:=16;
     If En[i].T in [14] then U:=36;
    If (En[i].T>0) and (Abs(En[i].X-St[z].X)<12+U) and (Abs(En[i].Y-St[z].Y)<12) then
     Begin
      If St[z].T=21 then Dec(En[i].Hp,20);
      If St[z].T=22 then Dec(En[i].Hp,36);
      St[z].T:=0;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;
     end;
    end;

    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;


   end;


   if St[z].T in [101,103] then
   Begin
    If St[z].T=101 then o:=0;
    If St[z].T=103 then o:=9;

    DSIco(St[z].X-2,St[z].Y-2,10+o,-St[z].B,0);


    inc(St[z].B);
    If St[z].B>=8 then St[z].B:=0;
    If St[z].T in [103] then St[z].B:=0;

   For i:=1 to St[z].P do Begin

    If St[z].S=2 then Begin Inc(St[z].Y,3); end;
    If St[z].S=8 then Begin Dec(St[z].Y,3); end;

    If St[z].S=6 then Begin Inc(St[z].X,3); end;
    If St[z].S=4 then Begin Dec(St[z].X,3); end;

    If St[z].S=3 then Begin Inc(St[z].X,2);Inc(St[z].Y,2); end;
    If St[z].S=9 then Begin Inc(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=7 then Begin Dec(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=1 then Begin Dec(St[z].X,2);Inc(St[z].Y,2); end;

    If St[z].S=23 then Begin Inc(St[z].X,1);Inc(St[z].Y,2); end;
    If St[z].S=36 then Begin Inc(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=69 then Begin Inc(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=98 then Begin Inc(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=87 then Begin Dec(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=74 then Begin Dec(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=41 then Begin Dec(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=12 then Begin Dec(St[z].X,1);Inc(St[z].Y,2); end;

   end;
    o:=0;

    If (Moved=0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,1,0)) then o:=1;
    If (Moved>0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,2,1)) then o:=1;
    If (Moved<0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,2,0)) then o:=1;

    If o=1 then
     Begin

      If St[z].T=101 then u:=R(4)+6;
      If St[z].T=103 then u:=12;

      If InVis=0 then if Life>0 then Begin Dec(Life,u);PalR:=10; end;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;

      St[z].T:=0;
     end;


    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;
   end;




   if St[z].T in [102,104] then
   Begin
    If St[z].T=102 then o:=0;
    If St[z].T=104 then o:=27;



    If  St[z].S= 2 then DSIco(St[z].X-8,St[z].Y-8,16+o,0,0);
     If St[z].S= 6 then DSIco(St[z].X-8,St[z].Y-8,16+o,0,270);
     If St[z].S= 8 then DSIco(St[z].X-8,St[z].Y-8,16+o,0,180);
     If St[z].S= 4 then DSIco(St[z].X-8,St[z].Y-8,16+o,0,90);
    If  St[z].S= 3 then DSIco(St[z].X-8,St[z].Y-8,18+o,0,0);
     If St[z].S= 9 then DSIco(St[z].X-8,St[z].Y-8,18+o,0,270);
     If St[z].S= 7 then DSIco(St[z].X-8,St[z].Y-8,18+o,0,180);
     If St[z].S= 1 then DSIco(St[z].X-8,St[z].Y-8,18+o,0,90);
    If  St[z].S=23 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,0);
     If St[z].S=69 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,270);
     If St[z].S=87 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,180);
     If St[z].S=41 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,90);
    If  St[z].S=12 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,1);
     If St[z].S=36 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,272);
     If St[z].S=98 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,181);
     If St[z].S=74 then DSIco(St[z].X-8,St[z].Y-8,17+o,0,92);


    inc(St[z].B);
    If St[z].B>=8 then St[z].B:=0;

   For i:=1 to St[z].P do Begin

    If St[z].S=2 then Begin Inc(St[z].Y,3); end;
    If St[z].S=8 then Begin Dec(St[z].Y,3); end;

    If St[z].S=6 then Begin Inc(St[z].X,3); end;
    If St[z].S=4 then Begin Dec(St[z].X,3); end;

    If St[z].S=3 then Begin Inc(St[z].X,2);Inc(St[z].Y,2); end;
    If St[z].S=9 then Begin Inc(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=7 then Begin Dec(St[z].X,2);Dec(St[z].Y,2); end;
    If St[z].S=1 then Begin Dec(St[z].X,2);Inc(St[z].Y,2); end;

    If St[z].S=23 then Begin Inc(St[z].X,1);Inc(St[z].Y,2); end;
    If St[z].S=36 then Begin Inc(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=69 then Begin Inc(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=98 then Begin Inc(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=87 then Begin Dec(St[z].X,1);Dec(St[z].Y,2); end;
    If St[z].S=74 then Begin Dec(St[z].X,2);Dec(St[z].Y,1); end;
    If St[z].S=41 then Begin Dec(St[z].X,2);Inc(St[z].Y,1); end;
    If St[z].S=12 then Begin Dec(St[z].X,1);Inc(St[z].Y,2); end;

   end;

    o:=0;

    If (Moved=0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,1,0)) then o:=1;
    If (Moved>0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,2,1)) then o:=1;
    If (Moved<0) and (IsPt(St[z].X,St[z].Y,MysX-15,MysY-14,2,0)) then o:=1;

    If o=1 then
     Begin
      If St[z].T=102 then u:=R(2)+2;
      If St[z].T=104 then u:=R(4)+4;

      If InVis=0 then if Life>0 then Begin Dec(Life,u);PalR:=10; end;

      a:=Findexp;
      Exp[a].T:=1;
      Exp[a].X:=St[z].X;
      Exp[a].Y:=St[z].Y;
      Exp[a].P:=0;

      St[z].T:=0;
     end;


    If St[z].Y<=-10 then St[z].T:=0;
    If St[z].Y>=210 then St[z].T:=0;
    If St[z].X<=-10 then St[z].T:=0;
    If St[z].X>=330 then St[z].T:=0;

  end;



  end;

end;

Procedure Strelba;
Begin

If (Mystlac in [1,3]) then Begin

 if Kad1=0 then Begin

   If Wep1=1 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=1;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=1;
    a:=FindSht;St[a].X:=Px-5;St[a].Y:=Py-3;St[a].T:=1;
    a:=FindSht;St[a].X:=Px+5;St[a].Y:=Py-3;St[a].T:=1;
   end;

   If Wep1=2 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=2;
   end;

   If Wep1=3 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px  ;St[a].Y:=Py-7;St[a].T:=2;
   end;

   If Wep1=4 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px-5;St[a].Y:=Py-3;St[a].T:=2;
    a:=FindSht;St[a].X:=Px+5;St[a].Y:=Py-3;St[a].T:=2;
   end;

   If Wep1=5 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=3;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=3;
   end;

   If Wep1=6 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=3;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=3;
    a:=FindSht;St[a].X:=Px  ;St[a].Y:=Py-7;St[a].T:=3;
   end;

   If Wep1=7 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=3;
    a:=FindSht;St[a].X:=Px-3;St[a].Y:=Py-7;St[a].T:=3;
    a:=FindSht;St[a].X:=Px+3;St[a].Y:=Py-7;St[a].T:=3;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=3;
   end;

   If Wep1=8 then Begin
    a:=FindSht;St[a].X:=Px-7;St[a].Y:=Py-3;St[a].T:=4;
    a:=FindSht;St[a].X:=Px-3;St[a].Y:=Py-7;St[a].T:=4;
    a:=FindSht;St[a].X:=Px+3;St[a].Y:=Py-7;St[a].T:=4;
    a:=FindSht;St[a].X:=Px+7;St[a].Y:=Py-3;St[a].T:=4;
   end;

   If Wep1=9 then Begin
    For i:=-3 to 3 do Begin
     a:=FindSht;St[a].X:=Px+(i*4);St[a].Y:=Py-16+Abs(i)*2;St[a].T:=4;
    end;
   end;

   If Wep1=10 then Begin
    a:=FindSht;St[a].X:=Px;St[a].Y:=Py+4;St[a].T:=5;
    St[a].B:=0;St[a].S:=8;
   end;


   If Wep1 in [1,2,3] then kad1:=10;
   If Wep1 in [4,5,6] then kad1:=7;
   If Wep1 in [7,8,9] then kad1:=5;
   If Wep1 in [10] then kad1:=1;


 end;

 If (kad2=0) then Begin

 If ChMis=1 then BEGIN

  if Wep2 in [1,2,3,4,5,6] then Begin
   a:=FindSht;
   St[a].X:=Px-7;St[a].Y:=Py+3;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=-1;St[a].B:=0;

   a:=FindSht;
   St[a].X:=Px+7;St[a].Y:=Py+3;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=1;St[a].B:=0;
  end;

  if Wep2 in [2,3,5,6] then Begin
   a:=FindSht;
   St[a].X:=Px-9;St[a].Y:=Py+8;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=-2;St[a].B:=2;

   a:=FindSht;
   St[a].X:=Px+9;St[a].Y:=Py+8;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=2;St[a].B:=2;
  end;

  if Wep2 in [3,6] then Begin
   a:=FindSht;
   St[a].X:=Px-11;St[a].Y:=Py+10;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=-3;St[a].B:=2;

   a:=FindSht;
   St[a].X:=Px+11;St[a].Y:=Py+10;
   St[a].T:=11+(Wep2-1) div 3;St[a].S:=3;St[a].B:=2;
  end;

  If wep2 in [1,2,3] then Kad2:=30;
  If wep2 in [4,5,6] then Kad2:=30;
 END;

 If ChMis=2 then BEGIN

  if Wep3 in [1,2,3,4,5,6] then Begin
   a:=FindSht;
   St[a].X:=Px-7;St[a].Y:=Py+3; St[a].tar:=0;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=87; St[a].P:=1;

   a:=FindSht;
   St[a].X:=Px+7;St[a].Y:=Py+3; St[a].tar:=0;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=98; St[a].P:=1;
  end;

  if Wep3 in [2,3,5,6] then Begin
   a:=FindSht;
   St[a].X:=Px-9;St[a].Y:=Py+8; St[a].tar:=0;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=7; St[a].P:=1;

   a:=FindSht;
   St[a].X:=Px+9;St[a].Y:=Py+8;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=9; St[a].P:=1;
  end;

  if Wep3 in [3,6] then Begin
   a:=FindSht;
   St[a].X:=Px-11;St[a].Y:=Py+10; St[a].tar:=0;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=74; St[a].P:=1;

   a:=FindSht;
   St[a].X:=Px+11;St[a].Y:=Py+10; St[a].tar:=0;
   St[a].T:=21+(Wep3-1) div 3;;St[a].B:=0;St[a].S:=69; St[a].P:=1;
  end;


  If Wep3 in [1,2,3] then Kad2:=65;
  If Wep3 in [4,5,6] then Kad2:=35;
 END;


 end;

end;

end;



Procedure Shadows(W:Integer);
var zq:Integer;
Begin


For z:=1 to 30 do
 Begin
  zq:=0;

  If (W=1) and (En[z].T in [1,2,6,12,13]) then zq:=1;
  If (W=2) and (En[z].T in [3])   then zq:=1;
  If (W=3) and (En[z].T in [4,5,7,8,9,10,11]) then zq:=1;

  If zq=1 then BEGIN
   i:=0;

   If En[z].T in [1,2,6,12,13] then Begin
    a:=(160-En[z].X) div 3;
    b:=(200-En[z].Y) div 3;

    If En[z].T =1 then i:=0;
    If En[z].T =2 then i:=4;
    If En[z].T =6 then i:=50;
    If En[z].T =12 then i:=16;
    If En[z].T =13 then i:=20;

    q:=0; u:=En[z].R;
   end;


   If En[z].T in [3] then Begin a:=3;b:=1;i:=100;q:=7; u:=En[z].RP;end;

   If En[z].T in [7,8,9,10,11] then Begin a:=+3;b:=+3;q:=7; u:=En[z].RP;end;

   If En[z].T in [4,5] then Begin a:=3;b:=3;q:=7; u:=En[z].RP;end;

   If En[z].T in [1,2,3,12,13] then BEGIN
     If  U= 2 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,0);
      If U= 6 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,270);
      If U= 8 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,180);
      If U= 4 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,90);
     If  U= 3 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,103+i,25+Q,25+Q,-2,0);
      If U= 9 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,103+i,25+Q,25+Q,-2,270);
      If U= 7 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,103+i,25+Q,25+Q,-2,180);
      If U= 1 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,103+i,25+Q,25+Q,-2,90);
     If  U=23 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,102+i,25+Q,25+Q,-2,0);
      If U=69 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,102+i,25+Q,25+Q,-2,270);
      If U=87 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,102+i,25+Q,25+Q,-2,180);
      If U=41 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,102+i,25+Q,25+Q,-2,90);
     If  U=12 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,104+i,25+Q,25+Q,-2,0);
      If U=36 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,104+i,25+Q,25+Q,-2,270);
      If U=98 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,104+i,25+Q,25+Q,-2,180);
      If U=74 then DarkIco(En[z].X-16+a,(En[z].Y)-14+b,104+i,25+Q,25+Q,-2,90);
   END;

   If En[z].T in [4,5,7,8,9,10,11] then Begin
    If En[z].T=4 then i:=200;
    If En[z].T=5 then i:=202;
    If En[z].T in [7,8,9,10,11] then i:=203;

    DarkIco(En[z].X-16+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,0);
   end;

   If En[z].T in [6] then Begin
      DarkIco(En[z].X-25+a,(En[z].Y)-14+b,101+i,25+Q,25+Q,-2,0);
      DarkIco(En[z].X- 0+a,(En[z].Y)-14+b,102+i,25+Q,25+Q,-2,0);
   END;


  END;



 end;
end;

Procedure MoveEn(z:Integer);
Begin

{Inc(En[z].SR);}
En[z].SR:=1;
{If En[z].Sr>=Abs(En[z].S) then En[z].SR:=0;}
If TSpd=1 then En[z].SR:=0;

If En[z].S>0 then En[z].SR:=0;

En[z].SS:=En[z].S;
If En[z].SS<0 then En[z].SS:=1;


If En[z].S>0 then For i:=1 to En[z].SS do Inc(En[z].D);
If En[z].S<0 then If En[z].SR=0 then Inc(En[z].D);
If En[z].S=0 then Inc(En[z].D);


{POHYB TANKU AJ DOLE}
If En[z].T in [3] then BEGIN
If TSpd=1 then Inc(En[z].Y);

END;

If En[z].SR=0 then BEGIN


 {POHYB DOLU}
  If En[z].RP=2 then
   Begin

    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE}
  If En[z].RP=8 then
   Begin

    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB DOPRAVA}
  If En[z].RP=6 then
   Begin

    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLAVA}
  If En[z].RP=4 then
   Begin

    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLU DOLU DOPRAVA}
  If En[z].RP=23 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].Y); end;
      if En[z].B=1 then Begin Inc(En[z].Y);Inc(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLU DOLU DOLAVA}
  If En[z].RP=12 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].Y); end;
      if En[z].B=1 then Begin Inc(En[z].Y);Dec(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE HORE DOPRAVA}
  If En[z].RP=98 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].Y); end;
      if En[z].B=1 then Begin Dec(En[z].Y);Inc(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE HORE DOLAVA}
  If En[z].RP=87 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].Y); end;
      if En[z].B=1 then Begin Dec(En[z].Y);Dec(En[z].X); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLU DOPRAVA}
  If En[z].RP=3 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].X);Inc(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLU DOLAVA}
  If En[z].RP=1 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].X);Inc(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE DOPRAVA}
  If En[z].RP=9 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].X);Dec(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE DOLAVA}
  If En[z].RP=7 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=1 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].X);Dec(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE DOLAVA DOLAVA}
  If En[z].RP=74 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].X); end;
      if En[z].B=1 then Begin Dec(En[z].X);Dec(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB HORE DOPRAVA DOPRAVA}
  If En[z].RP=69 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].X); end;
      if En[z].B=1 then Begin Inc(En[z].X);Dec(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLE DOLAVA DOLAVA}
  If En[z].RP=41 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Dec(En[z].X); end;
      if En[z].B=1 then Begin Dec(En[z].X);Inc(En[z].Y); end;
     end;
    NextWp(z);
   end;

 {POHYB DOLE DOPRAVA DOPRAVA}
  If En[z].RP=36 then
   Begin
    For i:=1 to En[z].SS do
     Begin
      Inc(En[z].B);
      If En[z].B>=2 then En[z].B:=0;
      if En[z].B=0 then Begin Inc(En[z].X); end;
      if En[z].B=1 then Begin Inc(En[z].X);Inc(En[z].Y); end;
     end;
    NextWp(z);
   end;

END;

end;

Begin
end.

