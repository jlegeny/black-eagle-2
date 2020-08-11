{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,420000,655360}
Program BlackEagleII;

Uses Crt,Dos,col256_2,data,main,palette,Game,LevelX;


Var fil:Text;

{************************}                           {***********************}
{-------------------------------{THE BEGINNING)------------------------------}
{************************}                           {***********************}




Begin

  mcgaon;{}
  setupvirtual2;
  directvid;
  Cls(0,Vaddr);


  RANDOMIZE;

  Inver:=0;
  CB:=0;
  PalR:=0;
  PalG:=0;
  PalB:=0;
  Bright:=0;

{ CrtPal;{}
{ CrtFil('pal1.pal');{}
  LodFil('pal1.pal');{}
  Cur:=1;

 Assign(fil,'Map.dat');
  Reset(fil);
   For y:=0 to 100 do Begin
    For x:=1 to 11 do Begin
     Read(fil,ch);
     If ch='-' then Map[x,y]:=1;
     If ch='c' then Map[x,y]:=2;
     If ch='C' then Map[x,y]:=3;
     If ch='.' then Map[x,y]:=4;
     If ch='=' then Map[x,y]:=5;

     If ch='Û' then Begin Map[x,y]:=1; Ppr[x,y]:=1; end;
     If ch='²' then Begin Map[x,y]:=1; Ppr[x,y]:=2; end;
     If ch='±' then Begin Map[x,y]:=1; Ppr[x,y]:=3; end;
     If ch='°' then Begin Map[x,y]:=1; Ppr[x,y]:=4; end;
     If ch='r' then Begin Map[x,y]:=1; Ppr[x,y]:=5; end;
     If ch='R' then Begin Map[x,y]:=1; Ppr[x,y]:=6; end;
     If ch='B' then Begin Map[x,y]:=1; Ppr[x,y]:=7; end;
     If ch='t' then Begin Map[x,y]:=1; Ppr[x,y]:=8; end;
     If ch='T' then Begin Map[x,y]:=1; Ppr[x,y]:=9; end;
     If ch='P' then Begin Map[x,y]:=1; Ppr[x,y]:=10; end;
     If ch='V' then Begin Map[x,y]:=1; Ppr[x,y]:=11; end;
     If ch='"' then Begin Map[x,y]:=1; Ppr[x,y]:=12; end;
     If ch='v' then Begin Map[x,y]:=1; Ppr[x,y]:=13; end;
     If ch='W' then Begin Map[x,y]:=1; Ppr[x,y]:=14; end;

     If ch='Í' then Begin Map[x,y]:=1; Ppr[x,y]:=41; end;
     If ch='º' then Begin Map[x,y]:=1; Ppr[x,y]:=42; end;
     If ch='É' then Begin Map[x,y]:=1; Ppr[x,y]:=43; end;
     If ch='È' then Begin Map[x,y]:=1; Ppr[x,y]:=44; end;
     If ch='¼' then Begin Map[x,y]:=1; Ppr[x,y]:=45; end;
     If ch='»' then Begin Map[x,y]:=1; Ppr[x,y]:=46; end;

     If ch=',' then Begin Map[x,y]:=1; Ppr[x,y]:=61; end;
    end;
   Read(fil,ch);
   Read(fil,ch);
  end;
  Close(fil);



  Lives:=3;
  Life:=12;
  Credits:=3;
  Bombs:=3;


  MysX:=160;
  MysY:=180;

  px2:=0;
  py2:=0;
  mx:=MysX;
  my:=MysY;
  Px:=MysX;
  Py:=MysY;

  Level:=1;

  Wep1:=1;
  Wep2:=0;
  Wep3:=0;

  ChMis:=1;

  SetMousepos(Px,Py);

  TerPos:=98;
  Terol:=0;

  InVis:=30;

  Gamesa:=2;

  aa:=0;

  Z:=0;

  Speed:=0;

  Delay(1000);
(**************************************************************************)
(*********************************)REPEAT(*********************************)
(*************************************************************************)
If Bright>80 then Bright:=80;


If Gamesa=2 then BEGIN
 MousePos;

 If Z<16 then BEGIN
  MIco( 40-z,80,11,2+z*2,32,z-15,0);
  MIco( 80-z,80,12,2+z*2,32,z-15,0);
  MIco(120-z,80,13,2+z*2,32,z-15,0);
  MIco(160-z,80,11,2+z*2,32,z-15,0);
  MIco(200-z,80,14,2+z*2,32,z-15,0);
  MIco(240-z,80,15,2+z*2,32,z-15,0);
 END;

 If Z>15 then BEGIN
  Ico( 40-14,80+1,11,Vaddr);
  Ico( 80-14,80+1,12,Vaddr);
  Ico(120-14,80+1,13,Vaddr);
  Ico(160-14,80+1,11,Vaddr);
  Ico(200-14,80+1,14,Vaddr);
  Ico(240-14,80+1,15,Vaddr);
 END;

If Z<121 then BEGIN
For i:=1 to 5 do
 If Z>i*15 then BEGIN
  a:=45 - (Z-i*15);
  iF a<0 then a:=0;
  MSIco(160+i*20-a*2,120-a*2,67+i,16+a,16+a,(-a div 5),0);
 END;
END;

If Z>120 then BEGIN
 For i:=1 to 5 do
  SIco(161+i*20,121,67+i,Vaddr);
END;

If Z>120 then BEGIN
a:=z-120;
If a<8 then b:=a;
If a>7 then b:=14-a;

 MIco(15+a*10,20-b*2,10,32-a,32-a,0,0);

 MIco(300-a*10,150+b*2,10,32-a,32-a,0,0);

END;



 If z<150 then BEGIN
  Inc(o);
  If z in [0..15] then If o>=2 then Begin Inc(z); o:=0; end;
  If z in [16..120] then If o>=1 then Begin Inc(z); o:=0; end;
  If z in [121..150] then If o>=3 then Begin Inc(z); o:=0; end;
 END;


 If (Mystlac<>0) or (Keypressed) then aa:=1;

 If aa>0 then BEGIN
  Inc(Bright,3);
  ReloadPalette;
 If Bright>=63 then Begin Gamesa:=1;StrtGame:=66; end;
end;

Flip(Vaddr,Vga);
If z<121 then Cls(16,Vaddr);
END;

If Gamesa=1 then BEGIN

{Ch:=#27;}
{POHYB}

If MLock=1 then Mystlac:=0;

If not( (MLock=1) ) then BEGIN

MousePos;

If GO=0 then BEGIN
px2:=mysx-mx;
py2:=mysy-my;
if px2>10 then  px2:=10;
if px2<-10 then px2:=-10;
if py2>6 then   py2:=6;
if py2<-6 then  py2:=-6;
mysx:=mx+px2;
mysy:=my+py2;
SetMousePos(mysx,mysy);
mx:=mysx;
my:=mysy;
inc(px,px2);
inc(py,py2);
If Abs(Px2)>4 then Moved:=(Px2 div Abs(Px2))*6;
END;

END;

{OBRAZ}

For y:= -1 to 7 do
 For x:= 1 to 11 do
  Begin
   If (y in [6,7]) or (y=-1) then DIco(x*24+4,y*28+Terol,20+Map[x,terpos+y-6],0,0)
   else Ico(x*24+4,y*28+Terol,20+Map[x,terpos+y-6],Vaddr);
  end;

For z:=1 to 30 do
 Begin

 If Vr[z].T in [1,2] then BEGIN
  If Vr[z].T=1 then o:=1;
  If Vr[z].T=2 then o:=2;

   DIco(Vr[z].X-16,Vr[z].Y-16,301+o,0,0);
   If TSpd=1 then Inc(Vr[z].Y);
   if Vr[z].Y>220 then Vr[z].T:=0;
 END;

 If Vr[z].T in [3] then BEGIN
   DIco(Vr[z].X-16,Vr[z].Y-16,16,0,0);
   DarkIco(Vr[z].X-15,Vr[z].Y-16,16,32,32,-3,0);
   DarkIco(Vr[z].X-16,Vr[z].Y-16,17,32,32,-2,0);
   DarkIco(Vr[z].X-20,Vr[z].Y-20,17,40,40,-1,0);
   If TSpd=1 then Inc(Vr[z].Y);
   if Vr[z].Y>220 then Vr[z].T:=0;
 END;
end;

{Shadows(3);}
DrawEnemys(3);

Shadows(2);
DrawEnemys(2);

{
For y:= -1 to 7 do
 For x:= 1 to 11 do
  Begin
   If PPr[x,terpos+y-6]>0 then BEGIN
    If (y in [6,7]) or (y=-1) or (x in [1,11]) then DarkIco(x*24+4-4+4,y*28+Terol-2+4,30+Ppr[x,terpos+y-6],32,32,-2,0)
    else DarkIco(x*24+4-4+4,y*28+Terol-2+4,30+Ppr[x,terpos+y-6],32,32,-2,0);
  END;
 end;
{}

For y:= -1 to 7 do
 For x:= 1 to 11 do
  Begin
   If PPr[x,terpos+y-6]>0 then BEGIN
    If (y in [6,7]) or (y=-1) or (x in [1,11]) then DIco(x*24+4-4,y*28+Terol-2,30+Ppr[x,terpos+y-6],0,0)
    else Ico(x*24+4-4,y*28+Terol-2,30+Ppr[x,terpos+y-6],Vaddr);
  END;
 end;

Shadows(1);


If GO=0 then BEGIN
 If Moved=0 then DarkIco(PX-15+(160-Px) div 3,PY-14+(200-PY) div 4,1,25,25,-2,0);
 If Moved>0 then DarkIco(PX-15+(160-Px) div 3,PY-14+(200-PY) div 4,2,25,25,-2,1);
 If Moved<0 then DarkIco(PX-15+(160-Px) div 3,PY-14+(200-PY) div 4,2,25,25,-2,0);
END;



{STRELBA}

Strelba;

if Mystlac in [2,3] then Begin
 if (Bombs>0) and (BT=0) then Begin
   BT:=1;
   BX:=PX;
   BY:=PY;
   Dec(Bombs);
 end;
end;

{SHIPS}

DrawFallingShips;

DrawEnemys(1);

{BONUSES}

For z:=1 to 10 do
 If Bon[z].T>0 then Begin
  Inc(Bon[z].D);

  If (Bon[z].D>=Bon[z].CD) or
     ((Bon[z].X<50) and (Bon[z].R in [87,7,74,4,41,1,12])) or
     ((Bon[z].X>270) and (Bon[z].R in [23,3,36,6,69,9,98])) or
     ((Bon[z].Y<20) and (Bon[z].R in [69,9,98,8,87,7,74])) or
     ((Bon[z].Y>180) and (Bon[z].R in [41,1,12,2,23,3,36])) then
   Begin
    Bon[z].R:=Smer[R(16)];
    Bon[z].CD:=R(50)+30;
    Bon[z].D:=0;
   end;

   If Bon[z].R= 2 then Begin Inc(Bon[z].X, 0);Inc(Bon[z].Y,+2); end;
   If Bon[z].R=23 then Begin Inc(Bon[z].X,+1);Inc(Bon[z].Y,+2); end;
   If Bon[z].R= 3 then Begin Inc(Bon[z].X,+2);Inc(Bon[z].Y,+2); end;
   If Bon[z].R=36 then Begin Inc(Bon[z].X,+2);Inc(Bon[z].Y, 1); end;
   If Bon[z].R= 6 then Begin Inc(Bon[z].X,+2);Inc(Bon[z].Y, 0); end;
   If Bon[z].R=69 then Begin Inc(Bon[z].X,+2);Inc(Bon[z].Y,-1); end;
   If Bon[z].R= 9 then Begin Inc(Bon[z].X,+2);Inc(Bon[z].Y,-2); end;
   If Bon[z].R=98 then Begin Inc(Bon[z].X,+1);Inc(Bon[z].Y,-2); end;
   If Bon[z].R= 8 then Begin Inc(Bon[z].X, 0);Inc(Bon[z].Y,-2); end;
   If Bon[z].R=87 then Begin Inc(Bon[z].X,-1);Inc(Bon[z].Y,-2); end;
   If Bon[z].R= 7 then Begin Inc(Bon[z].X,-2);Inc(Bon[z].Y,-2); end;
   If Bon[z].R=74 then Begin Inc(Bon[z].X,-2);Inc(Bon[z].Y,-1); end;
   If Bon[z].R= 4 then Begin Inc(Bon[z].X,-2);Inc(Bon[z].Y, 0); end;
   If Bon[z].R=41 then Begin Inc(Bon[z].X,-2);Inc(Bon[z].Y,+1); end;
   If Bon[z].R= 1 then Begin Inc(Bon[z].X,-2);Inc(Bon[z].Y,+2); end;
   If Bon[z].R=12 then Begin Inc(Bon[z].X,-1);Inc(Bon[z].Y,+2); end;

  DSIco(Bon[z].X-8,Bon[z].Y-8,24+Bon[z].T,0,0);

  If (Abs(Bon[z].X-Px)<20) and (Abs(Bon[z].Y-Py)<19) then BEGIN
   If Bon[z].T=1 then Begin Inc(Lives); Life:=12; Inc(Score,5000); end;
   If (Bon[z].T=2) and (Wep1<10) then Begin Inc(Wep1); Life:=12; Inc(Score,5000); end;
   If (Bon[z].T=3) and (Wep2<6) then Begin Inc(Wep2); Life:=12; Inc(Score,5000); end;
   If (Bon[z].T=4) and (Wep3<6) then Begin Inc(Wep3); Life:=12; Inc(Score,5000); end;
   If Bon[z].T=5 then Begin Inc(Bombs); Life:=12; Inc(Score,2000); end;


   Bon[z].T:=0;
  END;

 end;

{SHOTS}

DrawShots;

If kad1>0 then Dec(kad1);
If kad2>0 then Dec(kad2);

{BOMB}
if BT>0 then BEGIN
 MSIco(BX-8,BY-8,15,16-(BT div 6),16-(BT div 2),0,0);
 Inc(BT);
 Dec(BY);

 If BT=16 then Begin
  BT:=0;

  For i:=1 to 30 do if En[i].Hp>0 then dec(En[i].Hp,200);

 For I:=1 to 10 do
  Begin
   a:=FindExp;
   Exp[a].T:=2;
   Exp[a].X:=Bx-64+R(128);
   Exp[a].Y:=By-64+R(128);
   Exp[a].P:=0;
  end;

  a:=Findexp;
  Exp[a].X:=BX;
  Exp[a].Y:=BY;
  Exp[a].T:=3;
  Exp[a].P:=0;
 end;

end;

if InVis>0 then Begin
o:=(Roll mod 3)*1;
Dec(InVis);
end else o:=0;

If GO=0 then BEGIN

If Moved=0 then
 Begin
  DIco(MysX-15,MysY-14,1,o+Die,0);
  DSIco(MysX-8,MysY+12,3+Roll mod 2,o+Die,0);
 end;

If Moved>0 then
 Begin
  DIco(MysX-15,MysY-14,2,o+Die,1);
  DSIco(MysX-7,MysY+10,5+Roll mod 2,o+Die,1);
 end;

If Moved<0 then
 Begin
  DIco(MysX-15,MysY-14,2,o+Die,0);
  DSIco(MysX-7,MysY+10,5+Roll mod 2,o+Die,0);
 end;

END;

 If Moved>0 then Begin Dec(Moved,1); If Moved<0 then Moved:=0; end;
 If Moved<0 then Begin Inc(Moved,1); If Moved>0 then Moved:=0; end;



{EXPLOSIONS}
For z:=1 to 100 do
 Begin

  If Exp[z].T=1 then Begin
   DSico(Exp[z].X-8,Exp[z].Y-8,81+(Exp[z].P div 3),0,0);
   Inc(Exp[z].P);
   if Exp[z].P=24 then Exp[z].T:=0;
  end;

  If Exp[z].T=2 then Begin
   MSico(Exp[z].X-8-Exp[z].P,Exp[z].Y-8-Exp[z].P,81+(Exp[z].P div 3),15+Exp[z].P,15+Exp[z].P,0,0);
   Inc(Exp[z].P);
   if Exp[z].P=24 then Exp[z].T:=0;
  end;

  If Exp[z].T=3 then Begin
   MSico(Exp[z].X-8-Exp[z].P*2,Exp[z].Y-8-Exp[z].P*2,81+(Exp[z].P div 3),15+Exp[z].P*4,15+Exp[z].P*4,0,0);
   Inc(Exp[z].P);
   If Exp[z].P<13 then Flash:=1 else Flash:=0;
   If Flash=1 then Inc(Bright,2);
   if Exp[z].P=24 then Begin Exp[z].T:=0; end;
   ReloadPalette;
  end;

  If Exp[z].T=4 then Begin
   DSico(Exp[z].X-4,Exp[z].Y-4,73+(Exp[z].P div 2),0,0);
   Inc(Exp[z].P);
   Inc(Exp[z].X);
   Inc(Exp[z].Y);
   if Exp[z].P=16 then Exp[z].T:=0;
  end;
 end;


{KLAVESNICA}
If (Keypressed) and (KLock=0) then Begin
 Ch:=Readkey;

 If Ch=#13 then Begin
  If ChMis=1 then ChMis:=2 else ChMis:=1;
 end;

 If Ch=#8 then Begin
  a:=FindBon;
  Bon[a].X:=160;
  Bon[a].Y:=100;
  Bon[a].T:=R(5)+1;
  Bon[a].D:=1;
  Bon[a].CD:=1;
 end;

 If Ch='+' then Begin Inc(Speed); If Speed>40 then Speed:=40; end;
 If Ch='-' then Begin Dec(Speed); If Speed<0  then Speed:= 0; end;

 If Ch='q' then Begin Inc(Wep1); If Wep1=11 then Wep1:=10; end;
 If Ch='a' then Begin Dec(Wep1); If Wep1= 0 then Wep1:=1; end;
 If Ch='w' then Begin Inc(Wep2); If Wep2= 7 then Wep2:=6; end;
 If Ch='s' then Begin Dec(Wep2); If Wep2=-1 then Wep2:=0; end;
 If Ch='e' then Begin Inc(Wep3); If Wep3= 7 then Wep3:=6; end;
 If Ch='d' then Begin Dec(Wep3); If Wep3=-1 then Wep3:=0; end;

 If Ch=' ' then Begin


  GenEn(2,250,0,1,1,WayP);

 end;

end;

If PalR>0 then Begin
 Dec(PalR);
 If Bright=0 then ReloadPalette;
end;

If (Flash=0) and (Bright>0) then BEGIN
 Dec(bright);
 ReloadPalette;
end;



{PANEL}

If (Life<10) then
Begin
If Life>0 then a:=Life else a:=1;
If Roll mod a = 0 then Begin
 a:=FindExp;
 Exp[a].T:=4;
 Exp[a].X:=PX-8+R(16);
 Exp[a].Y:=PY-2+R(15);
 Exp[a].P:=0;
end;
end;

If (Life<5) then
Begin
If Life>0 then a:=(Life * 8) else a:=8;
If Roll mod a = 0 then Begin
 a:=FindExp;
 Exp[a].T:=1;
 Exp[a].X:=PX-8+R(16);
 Exp[a].Y:=PY-2+R(15);
 Exp[a].P:=0;
end;
end;

If Lives>0 then For i:=1 to Lives do SIco(20+(15*i),8,2,Vaddr);

If Bombs>0 then For i:=1 to Bombs do SIco(15+(20*i),180,8,Vaddr);

Str(credits,s);
S:='Credits: '+s;
XText(s,35,1,0);

s:=LZ(score)+'$';
XText(s,130,1,0);

DarkIco(200,1,3,32,32,6,0);

For i:=1 to Wep1 do Begin {SIco(230+(5*i),1,7,Vaddr);}
 Enlight(230+(5*i),2,4,5,4,Vaddr);
 Enlight(231+(5*i),3,3,4,3,Vaddr);
end;

If Wep2>0 then For i:=1 to Wep2 do Begin
 Enlight(230+(5*i),8,4,5,4,Vaddr);
 Enlight(231+(5*i),9,3,4,3,Vaddr);
end;

If Wep3>0 then For i:=1 to Wep3 do Begin
 Enlight(230+(5*i),14,4,5,4,Vaddr);
 Enlight(231+(5*i),15,3,4,3,Vaddr);
end;


 If Die>0 then Inc(Die);



If (Lives>=0) or (Credits>0) then BEGIN

  If (Life<=0) and (Die=0) then Begin Die:=1; MLock:=1; KLock:=1; end;

  If Die>=30 then Begin
   Dec(Lives);
   Life:=12;
   InVis:=40;

   MLock:=0;
   KLock:=0;
   Die:=0;

   For I:=1 to 10 do
    Begin a:=FindExp;Exp[a].T:=R(2)+1;Exp[a].X:=Px-16+R(32);Exp[a].Y:=Py-16+R(32);Exp[a].P:=0;end;


   If Lives=-1 then Begin
    If Credits>0 then Begin Cont:=60; end else GO:=1;

    InVis:=60;

    For I:=1 to 5 do
     Begin a:=FindExp;Exp[a].T:=R(2)+1;Exp[a].X:=Px-16+R(32);Exp[a].Y:=Py-16+R(32);Exp[a].P:=0;end;
         a:=FindExp;Exp[a].T:=3;Exp[a].X:=Px;Exp[a].Y:=Py;Exp[a].P:=0;
   end;

    MysX:=160;MysY:=180;px2:=0;py2:=0;mx:=MysX;my:=MysY;Px:=MysX;Py:=MysY;
    SetMousepos(Px,Py);
   end;

END;

If (Go>0) and (GO<21) then Begin
 If Go<19 then Begin MLock:=1;KLock:=1; end;
 If GO<20 then Inc(GO);

 MIco(160-16-(GO*3),110-16-GO*2,4,12+GO*6,12+GO*4,0,0);

 If GO>=19 then Begin MLock:=0;KLock:=0; end;

 If (GO=20) and (MysTlac=1) then Ch:=#27;
end;


If (Cont>0) and (Cont<61) then Begin
 If Cont>56 then Begin MLock:=1;KLock:=1; end;
 If Cont>0 then Dec(Cont);

 MIco(160-16-Cont,110-16-Cont*2 div 3,5,12+Cont*2,12+Cont*4 div 3,0,0);

 If Cont=55 then Begin MLock:=0;KLock:=0; end;

 If (MysTlac=1) then Begin Dec(Credits);Lives:=3;Cont:=0;MLock:=0;KLock:=0; end;
 If (Cont=1) then Begin GO:=1; end;

end;




  Inc(Roll);
  If Roll=48 then Roll:=0;

  If Roll mod 2=0 then Inc(Unc);
  If Unc=12 then Unc:=1;

  PalX(1,R(40)+20,R(20),0);
  PalX(2,R(30)+30,R(30),0);
  PalX(3,R(20)+40,R(40),0);
  PalX(4,R(10)+50,R(50),0);


If GO<20 then BEGIN
  Inc(TSpd);

 if terPos>7 then Begin
  If TSpd=2 then begin inc(Terol);TSpd:=0; end;

  If terol=28 then Begin Terol:=0;Dec(TerPos);
                         MakeEnemyz(TerPos); end;
 end;

END;

  Inc(Wait,40-Speed);

  If StrtGame>0 then Dec(StrtGame);

  Mouserange(28,0,291,184);
  Flip(Vaddr,Vga);
  If StrtGame=0 then Cls(0,Vaddr) else Cls(16,Vaddr);
  Delay(wait);

  wait:=0;

  If KLock=2 then KLock:=0;
  If KLock=3 then KLock:=2;

  IF ((Mystlac<>0) or (WFClick=1)) and (WFClick<>2) then WFClick:=1;

END;

{***********************}Until Ch=#27;{*******************}

{If Hp=0 then Delay(1000);}

{
  For i:=100 downto 1 do
   Begin
    Square(0,100-i,319,100+i,0,Vga);
    Square(0,101-i,319,99+i,80,Vga);
    Delay(0);
   end;

  For i:=0 to 158 do
   Begin
    PutPixel(i,100,0,Vga);
    PutPixel(319-i,100,0,Vga);
    Delay(0);
   end;

   }
 mcgaoff;


 For a:=1 to 333 do Freemem(p[a],1024);{}
 For a:=1 to 90 do Freemem(sp[a],256);{}

 NoSound;


His('>>> Sound Blaster switched Off..');


End.



{}


