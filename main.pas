Unit Main;
{Version 2.5}

Interface

Uses Crt,Data,dos,col256_2;

Var Gd,Gm:Integer;

Function Click(x,y,x2,y2:integer):boolean;
Function R(x:Integer):Integer;
Function LngOfText(s:String):Integer;
Function Lng(a,b,c,d:integer):Integer;
Function PliX(a,b,c,d,e:integer):Integer;
Function PliY(a,b,c,d,e:integer):Integer;
Function Vzd(a,b,c,d:Integer):Integer;
Function intrv(X:Real;a,b:Real):Boolean;
function LZ(w : LongInt) : String;


Procedure XText(s:string;x,y,z:Integer);
Procedure PutChr(x,y,z,TType:Integer);
Procedure Chancol(x,y,x2,y2:Integer;c1,c2:Byte;W:word);
Procedure CBize(x,y,kx,ky,p:Integer);
Procedure pix(x,y:Integer;c:byte;W:word);
Procedure XXLine(x,y,x2,y2:Integer;col:byte;cc:Integer;where:Word);
Procedure Square(x,y,x2,y2,col:Integer;W:Word);
Procedure PLine(a,b,c,d,e:integer;W:word);
Procedure EnLight(x,y,kx,ky,z:Integer;W:Word);
Procedure EnLight3(x,y,z,zz,r:Integer;W:Word);
Procedure  Ico(x,y,z:Integer;where:Word);
Procedure SIco(x,y,z:Integer;where:Word);
Procedure BigIco(xx,yy,z,t,qp:Integer;Where:Word);
Procedure BigSIco(xx,yy,z,t,qp:Integer;Where:Word);
Procedure BigBigSIco(xx,yy,z:Integer;Where:Word);
Procedure DIco(xx,yy,z,t,tt:Integer);
Procedure DSIco(xx,yy,z,t,tt:Integer);
Procedure MIco(xx,yy,z,rx,ry,dc,rt:Integer);
Procedure MSIco(xx,yy,z,rx,ry,dc,rt:Integer);
Procedure DarkIco(xx,yy,z,rx,ry,dc,rt:Integer);


Procedure MouseInit;
Procedure MousePos;
Procedure SetMousePos(mx,my:Word);
Procedure MouseRange(minx,miny,maxx,maxy:integer);

Implementation

procedure MouseInit;
var gminit:boolean;
begin
with reg do
    begin
    AX:=0;
    intr($33,reg);
    if AX=0 then gminit:=true else gminit:=false;
    end;
if gminit=true then
    begin
    textcolor(7);
    writeln;
    writeln('MYS!');
    delay(2000);
    end;
end;
{**********************************}
procedure MousePos;
begin
with reg do
    begin
    AX:=3;
    intr($33,reg);
    mystlac:=BX;
    mysx:=CX;
    mysy:=DX;
    end;
end;
{**********************************}
Procedure SetMousePos(mx,my:Word); assembler;
asm
  mov ax,4
  mov cx,mx
  mov dx,my
  int 33h
End;
{**********************************}
procedure MouseRange(minx,miny,maxx,maxy:integer);
begin
with reg do
    begin
    AX:=7;
    CX:=minx;
    DX:=maxx;
    intr($33,reg);
    AX:=8;
    CX:=miny;
    DX:=maxy;
    intr($33,reg);
    end;
end;


Function intrv(X:Real;a,b:Real):Boolean;
Begin
 Intrv:=False;
 If (x>=a) and (x<=b) then Intrv:=true;
end;


Function Click(x,y,x2,y2:Integer):Boolean;
Begin
Click:=False;

If (Mysx >= x) and (Mysy >= y) and (Mysx <= x2) and (Mysy <= y2) then Click:=True;

end;

Function R(x:Integer):Integer;
Begin

R:=Random(x);

end;



function LZ(w : LongInt) : String;
var
  s : String;
begin
  Str(w:0,s);
  if Length(s) = 1 then s := '000000000' + s;
  if Length(s) = 2 then s := '00000000' + s;
  if Length(s) = 3 then s := '0000000' + s;
  if Length(s) = 4 then s := '000000' + s;
  if Length(s) = 5 then s := '00000' + s;
  if Length(s) = 6 then s := '0000' + s;
  if Length(s) = 7 then s := '000' + s;
  if Length(s) = 8 then s := '00' + s;
  if Length(s) = 9 then s := '0' + s;

  LZ := s;
end;

Function LngOfText(s:String):Integer;
Var A,B:Integer;
    Ch,Ch2:String;
    chs:char;
    C:byte;
begin
b:=0;

for a:=1 to Length(s) do
begin
ch:=copy(s,a,1);

chs:=upcase(ch[1]);

Case chs of
')' : b:=b-1;
{' ' : b:=b-2;}
'(' : b:=b-1;
'W' : b:=b+2;
end;


end;

LngOfText:=(4*a)+b;


end;

Procedure pix(x,y:Integer;c:byte;W:word);
Begin
 PutPixel(x,y,c,w);          {}
 Square(x-1,y-1,x+1,y+1,c,w);{}
 Square(x-1,y-2,x+1,y+2,c,w);{}
end;


Procedure XXLine(x,y,x2,y2:Integer;col:byte;cc:Integer;where:Word);
Var com,a:Integer;
Begin
If (x<>x2) and (y=y2) then
 Begin
  If x>x2 then com:=x-x2;
  If x2>x then com:=x2-x;

  For a:=0 to com do
   Begin
   PutPixel(x+a,y,col,where);
   if (cc<> 666) and (cc<>-666) then col:=col+cc;
   if cc=666 then if (a mod 2)=0 then col:=col+1;
   if cc=-666then if (a mod 2)=0 then col:=col-1;

   end;

 end;

If (x=x2) and (y<>y2) then
 Begin
  If y>y2 then com:=y-y2;
  If y2>y then com:=y2-y;

  For a:=0 to com do
   Begin
   PutPixel(x,y2-a,col,where);
   if (cc<> 666) and (cc<>-666) then col:=col+cc;
   if cc=666 then if (a mod 5)=0 then col:=col+1;
   if cc=-666then if (a mod 5)=0 then col:=col-1;

   end;

 end;

If (x=x2) and (y=y2) then PutPixel(x,y,col,where);



end;


Procedure Square(x,y,x2,y2,col:Integer;W:Word);
 Begin
  Line(x,y,x2,y,col,W);
  Line(x,y2,x2,y2,col,W);
  Line(x,y,x,y2,col,W);
  Line(x2,y,x2,y2,col,W);
 end;

Procedure Ico(x,y,z:Integer;where:Word);
Begin
PutIco(x,y,32,32,p[z]^,where);
end;

Procedure SIco(x,y,z:Integer;where:Word);
Begin
PutIco(x,y,16,16,sp[z]^,where);
end;



Function PliX(a,b,c,d,e:integer):Integer;
function sgn(aa:real):integer;      {zisti ci je cislo}
	begin
			 if aa>0 then sgn:=+1;                       {kladne}
                         if aa<0 then sgn:=-1;                       {zaporne}
			 if aa=0 then sgn:=0;                        {nula}
	end;
var ju,i,s,d1x,d1y,d2x,d2y,u,v,m,n,zc,zm:integer;
begin
ju:=1;
zc:=0;
zm:=1;
		 u:= c - a;
		 v:= d - b;
		 d1x:= SGN(u);
		 d1y:= SGN(v);
		 d2x:= SGN(u);
		 d2y:= 0;
		 m:= ABS(u);
		 n := ABS(v);
		 IF NOT (M>N) then
		 BEGIN
					d2x := 0 ;
					d2y := SGN(v);
					m := ABS(v);
					n := ABS(u);
		 END;
		 s := m shr 1;          { toto znamena s:=m div 2}
                 For i:=1 to e do
		 BEGIN
                  PliX:=a;

		  s := s + n;



		 IF not (s<m) THEN
				BEGIN
				 s := s - m;
				 a:= a + d1x;
			         b := b + d1y;
				END
			       	 ELSE
				  BEGIN
				   a := a + d2x;
				   b := b + d2y;
				  END;
		 end;


END;
(**)

Function PliY(a,b,c,d,e:integer):Integer;
function sgn(aa:real):integer;      {zisti ci je cislo}
	begin
			 if aa>0 then sgn:=+1;                       {kladne}
                         if aa<0 then sgn:=-1;                       {zaporne}
			 if aa=0 then sgn:=0;                        {nula}
	end;
var ju,i,s,d1x,d1y,d2x,d2y,u,v,m,n,zc,zm:integer;
begin
ju:=1;
zc:=0;
zm:=1;
		 u:= c - a;
		 v:= d - b;
		 d1x:= SGN(u);
		 d1y:= SGN(v);
		 d2x:= SGN(u);
		 d2y:= 0;
		 m:= ABS(u);
		 n := ABS(v);
		 IF NOT (M>N) then
		 BEGIN
					d2x := 0 ;
					d2y := SGN(v);
					m := ABS(v);
					n := ABS(u);
		 END;
		 s := m shr 1;          { toto znamena s:=m div 2}
		 i := e;
                 For i:=1 to e do
		 BEGIN
                  PliY:=b;

		  s := s + n;



		 IF not (s<m) THEN
				BEGIN
				 s := s - m;
				 a:= a + d1x;
			         b := b + d1y;
				END
			       	 ELSE
				  BEGIN
				   a := a + d2x;
				   b := b + d2y;
				  END;
		 end;


END;
(**)

Function Vzd(a,b,c,d:Integer):Integer;
Var x,y:Integer;
Begin

x:=Abs(a-c);
y:=Abs(b-d);

If x*x+y*y>=0 then Vzd:=Trunc(Sqrt(x*x+y*y)) else Vzd:=-1;

end;



Function Lng(a,b,c,d:integer):Integer;
Var P:Integer;
Begin
 If Abs(a-c)>Abs(b-d) then Lng:=Abs(a-c) else Lng:=Abs(b-d);
end;


Procedure PLine(a,b,c,d,e:integer;W:word);
function sgn(aa:real):integer;      {zisti ci je cislo}
	begin
			 if aa>0 then sgn:=+1;                       {kladne}
                         if aa<0 then sgn:=-1;                       {zaporne}
			 if aa=0 then sgn:=0;                        {nula}
	end;
var ju,i,s,d1x,d1y,d2x,d2y,u,v,m,n,rt:integer;
begin
ju:=1;
rt:=0;
		 u:= c - a;
		 v:= d - b;
		 d1x:= SGN(u);
		 d1y:= SGN(v);
		 d2x:= SGN(u);
		 d2y:= 0;
		 m:= ABS(u);
		 n := ABS(v);
		 IF NOT (M>N) then
		 BEGIN
					d2x := 0 ;
					d2y := SGN(v);
					m := ABS(v);
					n := ABS(u);
		 END;
		 s := m shr 1;          { toto znamena s:=m div 2}
                 For i:=0 to m do
		 BEGIN
                  PutPixel(a,b,e,w);

		  s := s + n;



		 IF not (s<m) THEN
				BEGIN
				 s := s - m;
				 a:= a + d1x;
			         b := b + d1y;
				END
			       	 ELSE
				  BEGIN
				   a := a + d2x;
				   b := b + d2y;
				  END;
		 end;

END;
(**)


Procedure EnLight(x,y,kx,ky,z:Integer;W:Word);
Var xx,yy,i:Integer;
    c:byte;
 Begin
  If z>0 then
   For i:=1 to z do
    For yy:=0 to ky-1 do
    For xx:=0 to kx-1 do
     Begin
      c:=GetPixel(x+xx,y+yy,W);
      For i:=1 to z do c:=BrCol[c];
      PutPixel(x+xx,y+yy,c,W);
     end;

  If z<0 then
    For yy:=0 to ky-1 do
    For xx:=0 to kx-1 do
     Begin
      c:=GetPixel(x+xx,y+yy,W);
      For i:=-1 downto z do c:=DecCol[c];
      PutPixel(x+xx,y+yy,c,W);
     end;
 end;


 Procedure EnLight3(x,y,z,zz,r:Integer;W:Word);
 Var xx,yy,i:Integer;
  Begin
    If z>0 then
    For i:=1 to z do
    For yy:=0 to 15 do
    For xx:=0 to 15 do
    If (xx+x>=28) and (xx+x<=291) and (yy+y>=0) and (yy+y<=199) then
    Begin
    If (Enmask[yy,xx]<=r) and (Enmask[yy,xx]>0) then Begin
    If GetPixel(x+xx,y+yy,W)=0 then PutPixel(x+xx,y+yy,16+zz,W);
    PutPixel(x+xx,y+yy,BrCol[GetPixel(x+xx,y+yy,W)],W);
    end;
    end;
    If z<0 then
    For i:=-1 downto z do
    For yy:=0 to 15 do
    For xx:=0 to 15 do
    If (xx+x>=28) and (xx+x<=291) and (yy+y>=0) and (yy+y<=199) then
    Begin
    If (Enmask[yy,xx]<=r) and (Enmask[yy,xx]>0) then Begin
    PutPixel(x+xx,y+yy,DecCol[GetPixel(x+xx,y+yy,W)],W);
    end;
    end;
    end;


Procedure CBize(x,y,kx,ky,p:Integer);
Var a,b,c:Integer;
    rr,gg,bb:byte;
Begin
For b:=0 to ky-1 do
 For a:=0 to kx-1 do
    Begin
     C:=Getpixel(x+a,y+b,Vaddr);
     GetPal(c,rr,gg,bb);
     c:=((rr+gg+bb) div 6)+p;
     If c>31 then c:=31;
     Putpixel(x+a,y+b,c+16,Vaddr);
    end;
end;
{
Procedure Comment(S:String);
Var d,o,y:Integer;
Begin
y:=0;
d:=LngOfText(S);
o:=319-MysX;
If o>d+2 then o:=0
 else o:=1;

If mysy<8 then y:=8-mysY;

Square(MysX  -(o*d),MysY-9+y,MysX+d+2-(o*d),MysY-1+y,238,Vaddr);
Filled(MysX+1-(o*d),MysY-8+y,MysX+d+1-(o*d),MysY-2+y,236,Vaddr);
XText(S,MysX-2-(o*d),MysY-7+y,0,227);

end;
}
Procedure Chancol(x,y,x2,y2:Integer;c1,c2:Byte;W:word);
VAr a,b:Integer;
Begin

For b:=0 to y2-y do
 For a:=0 to x2-x do
   If Getpixel(x+a,y+b,W)=c1 then PutPixel(x+a,y+b,c2,W);


end;


Procedure BigIco(xx,yy,z,t,qp:Integer;Where:Word);
Var  a:Array[1..1024] of byte;
     x,y:Integer;
     c,w:Byte;

Begin
 Move(p[z]^,a,1024);

 w:=0;
 If qp=5 then Begin w:=1; qp:=3; end;
 For y:=0 to 31 do
  For x:=0 to 31 do
   Begin
    c:=a[x+y*32+1];

   If (c<>0) and (c<>255) then BEGIN
    If w=1 then Begin
     For z:=0 to 2 do c:=DecCol[c];
    end;

    PutPixel(xx+(x*qp),yy+(y*qp),c,Where);

    If t in [1,2] then c:=DecCol[c];
    If t=2 then c:=DecCol[c];
    PutPixel(xx+(x*qp)+1,yy+(y*qp),c,Where);
    PutPixel(xx+(x*qp),yy+(y*qp)+1,c,Where);
    PutPixel(xx+(x*qp)+1,yy+(y*qp)+1,c,Where);

    If t in [0,1,2] then c:=DecCol[c];
    If t=2 then c:=DecCol[c];
    PutPixel(xx+(x*qp)+2,yy+(y*qp)  ,c,Where);
    PutPixel(xx+(x*qp)+2,yy+(y*qp)+1,c,Where);
    PutPixel(xx+(x*qp)+2,yy+(y*qp)+2,c,Where);
    PutPixel(xx+(x*qp)  ,yy+(y*qp)+2,c,Where);
    PutPixel(xx+(x*qp)+1,yy+(y*qp)+2,c,Where);

    If qp=4 then Begin
    c:=DecCol[c];If t=2 then c:=DecCol[c];
    PutPixel(xx+(x*4)+3,yy+(y*4)  ,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+1,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+2,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)  ,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)+1,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)+2,yy+(y*4)+3,c,Where);

    end;

   END;

   end;


end;

Procedure BigSIco(xx,yy,z,t,qp:Integer;Where:Word);
Var  a:Array[1..256] of byte;
     x,y:Integer;
     c:Byte;
Begin
 Move(sp[z]^,a,256);

 For y:=0 to 15 do
  For x:=0 to 15 do
   Begin
    c:=a[x+y*16+1];
   If (c<>0) and (c<>255) then BEGIN
    PutPixel(xx+(x*qp),yy+(y*qp),c,Where);

    If t in [1,2] then c:=DecCol[c];
    If t=2 then c:=DecCol[c];
    PutPixel(xx+(x*qp)+1,yy+(y*qp),c,Where);
    PutPixel(xx+(x*qp),yy+(y*qp)+1,c,Where);
    PutPixel(xx+(x*qp)+1,yy+(y*qp)+1,c,Where);

    If t in [1,2] then c:=DecCol[c];
    If t=2 then c:=DecCol[c];
    PutPixel(xx+(x*qp)+2,yy+(y*qp)  ,c,Where);
    PutPixel(xx+(x*qp)+2,yy+(y*qp)+1,c,Where);
    PutPixel(xx+(x*qp)+2,yy+(y*qp)+2,c,Where);
    PutPixel(xx+(x*qp)  ,yy+(y*qp)+2,c,Where);
    PutPixel(xx+(x*qp)+1,yy+(y*qp)+2,c,Where);

{    If qp=4 then Begin
    c:=DecCol[c];c:=DecCol[c];c:=DecCol[c];
    PutPixel(xx+(x*4)+3,yy+(y*4)  ,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+1,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+2,c,Where);
    PutPixel(xx+(x*4)+3,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)  ,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)+1,yy+(y*4)+3,c,Where);
    PutPixel(xx+(x*4)+2,yy+(y*4)+3,c,Where);
    end;}
   END;

   end;

end;

Procedure DSIco(xx,yy,z,t,tt:Integer);
Var  a:Array[1..256] of byte;
     x,y,i:Integer;
     c:Byte;
     mx,my,tx,ox,oy:Integer;
Begin

{If (t=0) and (tt=0) then SIco(xx,yy,z,Vaddr) else
Begin}
 Move(sp[z]^,a,256);

 For y:=0 to 15 do
  For x:=0 to 15 do
   Begin
     c:=a[x+y*16+1];
     If t>0 then For i:=1 to t do c:=BrCol[c];
     If t<0 then For i:=-1 downto t do c:=DecCol[c];

       If C>0 then BEGIN
        mx:=x;my:=y;tx:=tt;

        Repeat
         If tx>=90 then Begin ox:=15-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=15-mx; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=15-my; end;
        If tx=3 then Begin mx:=15-mx; my:=15-my; end;

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199) then
        PutPixel(xx+mx,yy+my,c,Vaddr);

       END;
   end;
{end;}

end;

Procedure DIco(xx,yy,z,t,tt:Integer);
Var  a:Array[1..1024] of byte;
     x,y,i:Integer;
     c:Byte;
     mx,my,tx,ox,oy:Integer;
Begin

{If (t=0) and (tt=0) then Ico(xx,yy,z,Vaddr) else
Begin}

 Move(p[z]^,a,1024);

 For y:=0 to 31 do
  For x:=0 to 31 do
   Begin
     c:=a[x+y*32+1];
     If t>0 then For i:=1 to t do c:=BrCol[c];
     If t<0 then For i:=-1 downto t do c:=DecCol[c];

       If C>0 then BEGIN
        mx:=x;my:=y;tx:=tt;

        Repeat
         If tx>=90 then Begin ox:=31-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=31-mx; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=31-my; end;
        If tx=3 then Begin mx:=31-mx; my:=31-my; end;

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199) then
        PutPixel(xx+mx,yy+my,c,Vaddr);

       END;

{     If ttt=1 then If (((a[(x-1)+(y  )*32+1]>0) and (x>0)) or
                      ((a[(x+1)+(y  )*32+1]>0) and (x<31)) or
                      ((a[(x  )+(y+1)*32+1]>0) and (y<31)) or
                      ((a[(x  )+(y-1)*32+1]>0) and (y>0))) and
          (a[(x)+(y)*32+1]=0) then PutPixel(xx+x,yy+y,42,Vaddr);}

{   end;}

end;

end;

Procedure DarkIco(xx,yy,z,rx,ry,dc,rt:Integer);
Var  a:Array[1..1024] of byte;
     x,y,i:Integer;
     c:Byte;
     px,py:Integer;
     cfx,cfy:Real;
     mx,my,tx,ox,oy:Integer;
Begin
 Move(p[z]^,a,1024);

 px:=0;py:=0;

 cfx:=32 / Rx;
 cfy:=32 / Ry;

 For y:=1 to ry do
  Begin
   For x:=1 to rx do
    Begin
     c:=a[px+py*32+1];


       If C>0 then BEGIN
        mx:=x;my:=y;tx:=rt;

        Repeat
         If tx>=90 then Begin ox:=Rx-1-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=rx-mx-1; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=ry-my-1; end;
        If tx=3 then Begin mx:=rx-mx-1; my:=ry-my-1; end;

        C:=GetPixel(xx+mx,yy+my,Vaddr);

        If dc>0 then For i:=1 to dc do c:=BrCol[c];
        If dc<0 then For i:=-1 downto dc do c:=DecCol[c];

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199) then
        PutPixel(xx+mx,yy+my,c,Vaddr);

       END;


     Px:=Trunc(x * Cfx);
    end;
     Py:=Trunc(y * Cfy);
     Px:=0;
  end;

end;



Procedure MIco(xx,yy,z,rx,ry,dc,rt:Integer);
Var  a:Array[1..1024] of byte;
     x,y,i:Integer;
     c:Byte;
     px,py:Integer;
     cfx,cfy:Real;
     mx,my,tx,ox,oy:Integer;
Begin
 Move(p[z]^,a,1024);

 px:=0;py:=0;

 cfx:=32 / Rx;
 cfy:=32 / Ry;

 For y:=1 to ry do
  Begin
   For x:=1 to rx do
    Begin
     c:=a[px+py*32+1];
     If dc>0 then For i:=1 to dc do c:=BrCol[c];
     If dc<0 then For i:=-1 downto dc do c:=DecCol[c];


       If C>0 then BEGIN
        mx:=x;my:=y;tx:=rt;

        Repeat
         If tx>=90 then Begin ox:=Rx-1-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=rx-mx-1; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=ry-my-1; end;
        If tx=3 then Begin mx:=rx-mx-1; my:=ry-my-1; end;

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199) then
        PutPixel(xx+mx,yy+my,c,Vaddr);

       END;


     Px:=Trunc(x * Cfx);
    end;
     Py:=Trunc(y * Cfy);
     Px:=0;
  end;

end;

Procedure MSIco(xx,yy,z,rx,ry,dc,rt:Integer);
Var  a:Array[1..256] of byte;
     x,y,i:Integer;
     c:Byte;
     px,py:Integer;
     cfx,cfy:Real;
     mx,my,tx,ox,oy:Integer;
Begin
 Move(sp[z]^,a,256);

 px:=0;py:=0;

 cfx:=16 / Rx;
 cfy:=16 / Ry;

 For y:=1 to ry do
  Begin
   For x:=1 to rx do
    Begin
     c:=a[px+py*16+1];
     If dc>0 then For i:=1 to dc do c:=BrCol[c];
     If dc<0 then For i:=-1 downto dc do c:=DecCol[c];


       If C>0 then BEGIN
        mx:=x;my:=y;tx:=rt;

        Repeat
         If tx>=90 then Begin ox:=Rx-1-my; oy:=mx; mx:=ox; my:=oy; tx:=tx-90; end;
        Until tx<90;

        If tx=0 then Begin mx:=mx; my:=my; end;
        If tx=1 then Begin mx:=rx-mx-1; my:=my; end;
        If tx=2 then Begin mx:=mx; my:=ry-my-1; end;
        If tx=3 then Begin mx:=rx-mx-1; my:=ry-my-1; end;

       If (xx+mx>=28) and (xx+mx<=291) and (yy+my>=0) and (yy+my<=199) then
        PutPixel(xx+mx,yy+my,c,Vaddr);

       END;

     Px:=Trunc(x * Cfx);
    end;
     Py:=Trunc(y * Cfy);
     Px:=0;
  end;
end;

Procedure BigBigSIco(xx,yy,z:Integer;Where:Word);
Var  a:Array[1..256] of byte;
     x,y:Integer;
     c:Byte;
Begin
 Move(sp[z]^,a,256);

 For y:=0 to 15 do
  For x:=0 to 15 do
   Begin
    c:=a[x+y*16+1];
    PutPixel(xx+(x*5),yy+(y*5),c,Where);

    c:=DecCol[c];
    PutPixel(xx+(x*5)+1,yy+(y*5),c,Where);
    PutPixel(xx+(x*5),yy+(y*5)+1,c,Where);
    PutPixel(xx+(x*5)+1,yy+(y*5)+1,c,Where);

    c:=DecCol[c];
    PutPixel(xx+(x*5)+2,yy+(y*5)  ,c,Where);
    PutPixel(xx+(x*5)+2,yy+(y*5)+1,c,Where);
    PutPixel(xx+(x*5)+2,yy+(y*5)+2,c,Where);
    PutPixel(xx+(x*5)  ,yy+(y*5)+2,c,Where);
    PutPixel(xx+(x*5)+1,yy+(y*5)+2,c,Where);

    c:=DecCol[c];
    PutPixel(xx+(x*5)+3,yy+(y*5)  ,c,Where);
    PutPixel(xx+(x*5)+3,yy+(y*5)+1,c,Where);
    PutPixel(xx+(x*5)+3,yy+(y*5)+2,c,Where);
    PutPixel(xx+(x*5)+3,yy+(y*5)+3,c,Where);
    PutPixel(xx+(x*5)  ,yy+(y*5)+3,c,Where);
    PutPixel(xx+(x*5)+1,yy+(y*5)+3,c,Where);
    PutPixel(xx+(x*5)+2,yy+(y*5)+3,c,Where);

   end;


end;

Procedure PutChr(x,y,z,TType:Integer);
Begin

If TType=0 then PutIco(x,y,5,5,FontX[z],vaddr);
If TType=3 then PutIco(x,y,5,5,FontX[z],vga);


end;


Procedure XText(s:string;x,y,z:Integer);
Var A,B:Integer;
    Ch,Ch2:String;
    chs:char;
    C:byte;
begin


b:=0;


for a:=1 to Length(s) do
begin
ch:=copy(s,a,1);

chs:=upcase(ch[1]);

Case chs of


' ' :Begin Inc(b,-1); end;
'A' :Begin PutChr(x+((a-1)*5)+b,y,1,z); Inc(b,0); end;
'B' :Begin PutChr(x+((a-1)*5)+b,y,2,z); Inc(b,0); end;
'C' :Begin PutChr(x+((a-1)*5)+b,y,3,z); Inc(b,0); end;
'D' :Begin PutChr(x+((a-1)*5)+b,y,4,z); Inc(b,0); end;
'E' :Begin PutChr(x+((a-1)*5)+b,y,5,z); Inc(b,0); end;
'F' :Begin PutChr(x+((a-1)*5)+b,y,6,z); Inc(b,0); end;
'G' :Begin PutChr(x+((a-1)*5)+b,y,7,z); Inc(b,0); end;
'H' :Begin PutChr(x+((a-1)*5)+b,y,8,z); Inc(b,0); end;
'I' :Begin PutChr(x+((a-1)*5)+b,y,9,z); Inc(b,-1); end;
'J' :Begin PutChr(x+((a-1)*5)+b,y,10,z); Inc(b,0); end;
'K' :Begin PutChr(x+((a-1)*5)+b,y,11,z); Inc(b,0); end;
'L' :Begin PutChr(x+((a-1)*5)+b,y,12,z); Inc(b,0); end;
'M' :Begin PutChr(x+((a-1)*5)+b,y,13,z); Inc(b,+1); end;
'N' :Begin PutChr(x+((a-1)*5)+b,y,14,z); Inc(b,0); end;
'O' :Begin PutChr(x+((a-1)*5)+b,y,15,z); Inc(b,0); end;
'P' :Begin PutChr(x+((a-1)*5)+b,y,16,z); Inc(b,0); end;
'Q' :Begin PutChr(x+((a-1)*5)+b,y,17,z); Inc(b,0); end;
'R' :Begin PutChr(x+((a-1)*5)+b,y,18,z); Inc(b,0); end;
'S' :Begin PutChr(x+((a-1)*5)+b,y,19,z); Inc(b,0); end;
'T' :Begin PutChr(x+((a-1)*5)+b,y,20,z); Inc(b,+1); end;
'U' :Begin PutChr(x+((a-1)*5)+b,y,21,z); Inc(b,0); end;
'V' :Begin PutChr(x+((a-1)*5)+b,y,22,z); Inc(b,0); end;
'W' :Begin PutChr(x+((a-1)*5)+b,y,23,z); Inc(b,+1); end;
'X' :Begin PutChr(x+((a-1)*5)+b,y,24,z); Inc(b,+1); end;
'Y' :Begin PutChr(x+((a-1)*5)+b,y,25,z); Inc(b,+1); end;
'Z' :Begin PutChr(x+((a-1)*5)+b,y,26,z); Inc(b,0); end;
'0' :Begin PutChr(x+((a-1)*5)+b,y,27,z); Inc(b,0); end;
'1' :Begin PutChr(x+((a-1)*5)+b,y,28,z); Inc(b,0); end;
'2' :Begin PutChr(x+((a-1)*5)+b,y,29,z); Inc(b,0); end;
'3' :Begin PutChr(x+((a-1)*5)+b,y,30,z); Inc(b,0); end;
'4' :Begin PutChr(x+((a-1)*5)+b,y,31,z); Inc(b,0); end;
'5' :Begin PutChr(x+((a-1)*5)+b,y,32,z); Inc(b,0); end;
'6' :Begin PutChr(x+((a-1)*5)+b,y,33,z); Inc(b,0); end;
'7' :Begin PutChr(x+((a-1)*5)+b,y,34,z); Inc(b,0); end;
'8' :Begin PutChr(x+((a-1)*5)+b,y,35,z); Inc(b,0); end;
'9' :Begin PutChr(x+((a-1)*5)+b,y,36,z); Inc(b,0); end;
'.' :Begin PutChr(x+((a-1)*5)+b,y,37,z); Inc(b,-3); end;
'!' :Begin PutChr(x+((a-1)*5)+b,y,38,z); Inc(b,-1); end;
'?' :Begin PutChr(x+((a-1)*5)+b,y,39,z); Inc(b,0); end;
'&' :Begin PutChr(x+((a-1)*5)+b,y,40,z); Inc(b,0); end;
'-' :Begin PutChr(x+((a-1)*5)+b,y,41,z); Inc(b,0); end;
'+' :Begin PutChr(x+((a-1)*5)+b,y,42,z); Inc(b,0); end;
'/' :Begin PutChr(x+((a-1)*5)+b,y,43,z); Inc(b,0); end;
'(' :Begin PutChr(x+((a-1)*5)+b,y,44,z); Inc(b,-2); end;
')' :Begin PutChr(x+((a-1)*5)+b,y,45,z); Inc(b,0); end;
':' :Begin PutChr(x+((a-1)*5)+b,y,46,z); Inc(b,-3); end;
'''':Begin PutChr(x+((a-1)*5)+b,y,47,z); Inc(b,-2); end;
'%' :Begin PutChr(x+((a-1)*5)+b,y,48,z); Inc(b,+1); end;
'Û' :Begin PutChr(x+((a-1)*5)+b,y,49,z); Inc(b,+1); end;
'<' :Begin PutChr(x+((a-1)*5)+b,y,50,z); Inc(b,-1); end;
'>' :Begin PutChr(x+((a-1)*5)+b,y,51,z); Inc(b,-1); end;
'±' :Begin PutChr(x+((a-1)*5)+b,y,52,z); Inc(b,+1); end;
'"' :Begin PutChr(x+((a-1)*5)+b,y,53,z); Inc(b,-1); end;
'{' :Begin PutChr(x+((a-1)*5)+b,y,54,z); Inc(b,+1); end;
'}' :Begin PutChr(x+((a-1)*5)+b,y,55,z); Inc(b,0); end;
'Î' :Begin PutChr(x+((a-1)*5)+b,y,56,z); Inc(b,+1); end;
'@' :Begin PutChr(x+((a-1)*5)+b,y,57,z); Inc(b,+1); end;
'' :Begin PutChr(x+((a-1)*5)+b,y,58,z); Inc(b,+1); end;
'$' :Begin PutChr(x+((a-1)*5)+b,y,59,z); Inc(b,+1); end;
'' :Begin PutChr(x+((a-1)*5)+b,y,60,z); Inc(b,+1); end;



end;


END;

{-------------------------------------------------------------------}



END;
{-------------------------------------------------------------------}


{}


end.