Unit Palette;

Interface

Uses Crt,Dos;

Procedure CrtPal;
Procedure Pal(Col,R,G,B : Byte);
Procedure PalX(Col,R,G,B:Integer);
Procedure CrtFil(s:string);
Procedure LodFil(s:string);
Procedure GetPal(Col : Byte; Var R,G,B : Byte);
Procedure ReloadPalette;

Procedure FadeIn(del:Integer);
Procedure FadeOut(del:Integer);

Type pallette= Record
                R,G,B:Integer;
               end;

Var CB,INVER,PalR,PalG,PalB,Bright:Integer;
    pll:array[0..255] of Pallette;

ff:file of byte;
bt:byte;
a,b,c,d:Integer;
rr,gg,bb:byte;
clr:Integer;

Implementation

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

Procedure PalX(Col,R,G,B:Integer);
Var RR,GG,BB:Integer;
    ro,re:Integer;
Begin

{
If R>63 then R:=63;
If G>63 then G:=63;
If B>63 then B:=63;

If R<0  then R:=0;
If G<0  then G:=0;
If B<0  then B:=0;
}

If CB=0 then begin
 RR:=PalR+R+Bright;
  If RR>63 then RR:=63;
  If RR<  0 then RR:=0;

 GG:=PalG+G+Bright;
  If GG>63 then GG:=63;
  If GG<  0 then GG:=0;

 BB:=PalB+B+Bright;
  If BB>63 then BB:=63;
  If BB<  0 then BB:=0;

 Pal(Col,RR,GG,BB);
If (Inver=1) and (col<>0) then  Pal(Col,63-RR+bright,63-GG+bright,63-BB+bright);

end;

If CB=1 then begin
 ro:=R+G+B+bright;
 re:=ro div 3;
  If Re>63 then Re:=63;
  If Re< 0 then Re:=0;
 Pal(Col,re,re,re);
If (Inver=1) and (col<>0) then Pal(Col,63-re+bright,63-re+bright,63-re+bright);

end;


If Clr>0 then begin
 ro:=R+G+B;
 ro:=ro div 3;
  If Ro>63 then Ro:=63;
  If Ro< 0 then Ro:=0;

 If R<ro then R:=R+Clr;If R>ro then R:=R-Clr;
 If G<ro then G:=G+Clr;If G>ro then G:=G-Clr;
 If B<ro then B:=B+Clr;If B>ro then B:=B-Clr;

 RR:=PalR+R+Bright;
  If RR>63 then RR:=63;
  If RR<  0 then RR:=0;

 GG:=PalG+G+Bright;
  If GG>63 then GG:=63;
  If GG<  0 then GG:=0;

 BB:=PalB+B+Bright;
  If BB>63 then BB:=63;
  If BB<  0 then BB:=0;

 Pal(Col,RR,GG,BB);


end;


end;




Procedure Pal(Col,R,G,B : Byte);
    { This sets the Red, Green and Blue values of a certain color }
Begin
    asm
        mov    dx,3c8h
        mov    al,[col]
        out    dx,al
        inc    dx
        mov    al,[r]
        out    dx,al
        mov    al,[g]
        out    dx,al
        mov    al,[b]
        out    dx,al
    end;
End;


Procedure CrtPal;
Var a:integer;

Begin
Pal( 1,00,00,42);
Pal( 2,00,42,00);
Pal( 3,00,42,42);
Pal( 4,42,00,00);
Pal( 5,42,00,42);
Pal( 6,42,21,00);
Pal( 7,42,42,42);
Pal( 8,21,21,21);
Pal( 9,21,21,63);
Pal(10,21,63,21);
Pal(11,21,63,63);
Pal(12,63,21,21);
Pal(13,63,21,63);
Pal(14,63,63,21);
Pal(15,63,63,63);


For a:=16 to 255 do PalX(a,0,15,15);

For a:=0  to  15 do  PalX(a+16 ,a*2,a*2,a*2);
For a:=0  to  15 do  PalX(a+32 ,(a*2)+32,(a*2)+32,(a*2)+32);

  PalX(0,0,0,0);


  PalX(48,63,31,31);
  PalX(49,63,39,31);
  PalX(50,63,47,31);
  PalX(51,63,55,31);

  PalX(52,63,63,45);
  PalX(53,63,58,45);
  PalX(54,63,54,45);
  PalX(55,63,49,45);
  PalX(56,63,45,45);

For a:=1 to  7 do  PalX(56+a,10+(a*6),0,35+(a*4));

For a:=0 to 15 do PalX( 64+a,(3*a)+13,0,0);
For a:=0 to 15 do PalX( 80+a,60,4*a,0);

For a:=0 to 15 do PalX( 96+a,a*4,a*2,0);


For a:=0 to 15 do PalX(112+a,0,(4*a)+3,0);

For a:=0 to 15 do PalX(128+a,a*3,a*3,a*3+8);

{For a:=0 to 15 do PalX(144+a,0,2*a,4*a+3);{}
{For a:=0 to 15 do PalX(144+a,3*a+6,3*a+6,4*a);{}
PalX(144,20,16,11);
PalX(145,27,21,15);
PalX(146,35,27,19);
PalX(147,38,30,25);
PalX(148,48,42,35);
For a:=8 to 15 do PalX(144+a,a*2,0,a*4);



For a:=0 to  7 do PalX(160+a,0,0,(a*6)+20);{}
PalX(168,12,12,63);
PalX(169,18,18,63);
PalX(170,25,25,63);
PalX(171,32,32,63);
PalX(172,39,39,63);
PalX(173,46,46,63);
PalX(174,53,53,63);
PalX(175,60,60,63);


PalX(176,63,53,0);
PalX(177,56,42,0);
PalX(178,50,33,0);
PalX(179,44,25,0);
PalX(180,36,20,0);
PalX(181,29,15,0);
PalX(182,22,11,0);

PalX(187,24,49,54);
PalX(188,14,40,48);
PalX(189,07,31,43);
PalX(190,02,25,39);
PalX(191,00,20,36);

{For a:=0 to  7 do PalX(176+a,a*3,a*3+8,a*3);
{For a:=8 to 15 do PalX(176+a,a*3+8,a*3,a*3);}

{For a:=0 to  7 do PalX(192+a,0,a*3+8,a*3);{}
For a:=8 to 15 do PalX(192+a,a*3+8,a*3,a*3+8);

For a:=0 to  7 do PalX(192+a,a*3+8,a*3+8,a*3);


PalX(210,00,10,10);
PalX(211,00,12,12);
PalX(212,01,14,15);
PalX(213,02,19,19);
PalX(214,05,23,24);
PalX(215,07,26,27);
PalX(216,11,30,31);

For a:=9 to 15 do PalX(208+a,0,28+5*(a-8),28+5*(a-8));




PalX(224,57,59,44);
PalX(225,50,55,38);
PalX(226,42,53,33);
PalX(227,34,49,29);
PalX(228,26,45,24);
PalX(229,20,42,23);
PalX(230,17,39,24);
PalX(231,13,35,23);
PalX(232,10,32,22);
PalX(233,08,29,22);
PalX(234,05,25,21);
PalX(235,03,22,20);
PalX(236,02,18,19);
PalX(237,01,13,15);
PalX(238,00,08,12);
PalX(239,00,05,09);

PalX(255,0,0,0);

end;

Procedure CrtFil(s:string);
Begin

Assign(ff,s);
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

Procedure LodFil(s:string);
Begin

Assign(ff,s);
Reset(ff);
For a:=0 to 255 do
 Begin
  Read(ff,rr);
  Read(ff,gg);
  Read(ff,bb);

  PalX(a,rr,gg,bb);
  pll[a].R:=rr;
  pll[a].G:=gg;
  pll[a].B:=bb;
 end;

Close(ff);


end;


Procedure ReloadPalette;
Begin

Pal(0,0,0,0);

For a:=1 to 255 do
 Begin
  PalX(a,pll[a].R,pll[a].G,pll[a].B);
 end;



end;


Procedure FadeIn(del:Integer);
Begin
  For Bright:=0 to 70 do
   Begin
    CrtPal;
    Delay(del);
   end;
end;

Procedure FadeOut(del:Integer);
Begin
  For Bright:=70 downto 0 do
   Begin
    CrtPal;
    Delay(del);
   end;
end;


Begin
{CrtPal;
CrtFil('Pal1.pal');{}

end.


{PalX(232,58,30,23);
PalX(233,57,26,17);
PalX(234,53,22,10);
PalX(235,49,16, 0);
PalX(236,41, 9, 0);
PalX(237,34, 5, 1);
PalX(238,31, 3, 0);
PalX(239,28, 0, 2);}
