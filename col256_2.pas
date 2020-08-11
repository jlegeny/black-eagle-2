{$G+}
UNIT col256_2;
INTERFACE USES crt;

CONST  VGA = $A000;

TYPE   Virtual = Array [1..64000] of byte;  { The size of our Virtual Screen }
       VirtPtr = ^Virtual;                  { Pointer to the virtual screen }

VAR  Virscr : VirtPtr;                      { Our first Virtual screen }
     Virscr2: VirtPtr;
     Vaddr  : word;
     Vaddr2 : word;                         { The segment of our virtual screen}
     Pall,Pall2 : Array[0..255,1..3] of Byte;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure DirectVid;  { You can use gotoyx and write(ln) in graphics mode }
Procedure MCGAon;   { This procedure gets you into 320x200x256 mode. }
Procedure MCGAoff;  { This procedure returns you to text mode.  }
Procedure Cls (Col : Byte; Where:word);
    { This clears the screen to the specified color }
Procedure Putpixel (X,Y : Integer; Col : Byte; where:word);
  { This puts a pixel on the screen by writing directly to memory. }
Function Getpixel (X,Y : Integer; where:word) :Byte;
   { This gets the pixel on the screen by reading directly to memory. }
procedure WaitRetrace;
  {  This waits for a vertical retrace to reduce snow on the screen }
Procedure Pal(Col,R,G,B : Byte);
    { This sets the Red, Green and Blue values of a certain color }
Procedure GetPal(Col : Byte; Var R,G,B : Byte);
  { This gets the Red, Green and Blue values of a certain color }
Procedure Blackout;
  { This procedure blackens the screen by setting the pallette values of
    all the colors to zero. }
Procedure Pal_NB;
  { This fades up the pallette to white }
Procedure GetPal1;
Procedure GetPal2;
Procedure RollPal(col1,col2:byte);
Procedure Pal_CN;
  { This procedure slowly fades up the new screen }
Procedure Pal_BN;
  { This procedure slowly fades up the new screen from white }
Procedure Pal_NC;
  { This procedure fades the screen out to black. }
Procedure RestorePal;
  { This procedure restores the origional pallette }
Procedure SetUpVirtual;
    { This sets up the memory needed for the virtual screen }
Procedure SetUpVirtual2;
    { This sets up the memory needed for the virtual screen }
Procedure ShutDown;
    { This frees the memory used by the virtual screen }
Procedure ShutDown2;
    { This frees the memory used by the virtual screen }
procedure flip(source,dest:Word);
   { This copies the entire screen at "source" to destination }
Procedure putico(X,Y:Word; xx,yy:byte; VAR sprt{:array of byte}; Where:Word);
  { This puts an icon, EXCEPT it's color 0 (black) pixels, onto the screen
    "where", at position X,Y }
Procedure Line(a,b,c,d:integer; col:byte; where:word);
Procedure ScreenTrans (x,y,xx,yy,source,dest:word);
  { This is a small procedure to copy a xx*yy pixel block from coordinates
    x,y on the source screen to coordinates x,y on the dest screen }
Procedure Trans2 (x,y,xx,yy,poc,source,pau:word);
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
IMPLEMENTATION
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure DirectVid;
BEGIN
directvideo:=FALSE;  { This handy trick allows you to use GOTOXY and }
                     { Writeln in GFX mode. Hit CTRL-F1 on it for more }
                     { info/help }
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure MCGAon;   { This procedure gets you into 320x200x256 mode. }
BEGIN
asm mov ax,0013h; int 10h; end;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure MCGAoff;  { This procedure returns you to text mode.  }
BEGIN
asm mov ax,0003h; int 10h; end;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Cls (Col : Byte; Where:word);
   { This clears the screen to the specified color }
BEGIN
    asm
        push    es
        mov     cx, 32000;
        mov     es,[where]
        xor     di,di
        mov     al,[col]
        mov     ah,al
        rep     stosw
        pop     es
    End;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Putpixel (X,Y : Integer; Col : Byte; where:word);
  { This puts a pixel on the screen by writing directly to memory. }
BEGIN
    Asm
        push    ds
        push    es
        mov     ax,[where]
        mov     es,ax
        mov     bx,[X]
        mov     dx,[Y]
        push    bx                      {; and this again for later}
        mov     bx, dx                  {; bx = dx}
        mov     dh, dl                  {; dx = dx * 256}
        xor     dl, dl
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1
        shl     bx, 1                   {; bx = bx * 64}
        add     dx, bx                  {; dx = dx + bx (ie y*320)}
        pop     bx                      {; get back our x}
        add     bx, dx                  {; finalise location}
        mov     di, bx
        {; es:di = where to go}
        xor     al,al
        mov     ah, [Col]
        mov     es:[di],ah
        pop     es
        pop     ds
    End;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Function Getpixel (X,Y : Integer; where:word):byte; assembler;
   { This gets the pixel on the screen by reading directly to memory. }
Asm
  mov     ax,[where]
  mov     es,ax
  mov     bx,[X]
  mov     dx,[Y]
  mov     di,bx
  mov     bx, dx                  {; bx = dx}
  shl     dx, 8
  shl     bx, 6
  add     dx, bx                  {; dx = dx + bx (ie y*320)}
  add     di, dx                  {; finalise location}
  mov     al, es:[di]
End;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
procedure WaitRetrace; assembler;
  {  This waits for a vertical retrace to reduce snow on the screen }
label l1, l2;
asm
    mov dx,3DAh
l1:
    in al,dx
    and al,08h
    jnz l1
l2:
    in al,dx
    and al,08h
    jz  l2
end;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Blackout;
  { This procedure blackens the screen by setting the pallette values of
    all the colors to zero. }
VAR loop1:integer;
BEGIN
  WaitRetrace;
  For loop1:=0 to 255 do
    Pal (loop1,0,0,0);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Pal_NB;
  { This fades up the pallette to white }
VAR loop1,loop2:integer;
    Tmp : Array [1..3] of byte;
BEGIN
  For loop1:=1 to 64 do BEGIN
    WaitRetrace;
    For loop2:=0 to 255 do BEGIN
      Getpal (loop2,Tmp[1],Tmp[2],Tmp[3]);
      If Tmp[1]<63 then inc (Tmp[1]);
      If Tmp[2]<63 then inc (Tmp[2]);
      If Tmp[3]<63 then inc (Tmp[3]);
      Pal (loop2,Tmp[1],Tmp[2],Tmp[3]);
    END;
  END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure GetPal1;
VAR loop1:integer;
BEGIN
  For loop1:=0 to 255 do
    Getpal (loop1,pall[loop1,1],pall[loop1,2],pall[loop1,3]);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure GetPal2;
VAR loop1:integer;
BEGIN
  For loop1:=0 to 255 do
    Getpal (loop1,pall2[loop1,1],pall2[loop1,2],pall2[loop1,3]);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure RollPal(col1,col2:byte);
Var Tmp : Array[1..3] of Byte;
  { This is used as a "temporary color" in our pallette }
    loop1 : Integer;
BEGIN
   Move(Pall[col2],Tmp,3);
     { This copies color col2 from our virtual pallette to the Tmp variable }
   Move(Pall[col1],Pall[col1+1], (col2-col1) *3);
     { This moves the entire virtual pallette up one color }
   Move(Tmp,Pall[col1],3);
     { This copies the Tmp variable to the bottom of the virtual pallette }
   WaitRetrace;
   For loop1:=col1 to col2 do
     pal (loop1,pall[loop1,1],pall[loop1,2],pall[loop1,3]);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Pal_CN;
  { This procedure slowly fades up the new screen }
VAR loop1,loop2:integer;
    Tmp : Array [1..3] of byte;
      { This is temporary storage for the values of a color }
BEGIN
  For loop1:=1 to 64 do BEGIN
      { A color value for Red, green or blue is 0 to 63, so this loop only
        need be executed a maximum of 64 times }
    WaitRetrace;
    For loop2:=0 to 255 do BEGIN
      Getpal (loop2,Tmp[1],Tmp[2],Tmp[3]);
      If Tmp[1]<Pall2[loop2,1] then inc (Tmp[1]);
      If Tmp[2]<Pall2[loop2,2] then inc (Tmp[2]);
      If Tmp[3]<Pall2[loop2,3] then inc (Tmp[3]);
        { If the Red, Green or Blue values of color loop2 are less then they
          should be, increase them by one. }
      Pal (loop2,Tmp[1],Tmp[2],Tmp[3]);
        { Set the new, altered pallette color. }
    END;
  END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Pal_BN;
  { This procedure slowly fades up the new screen from white }
VAR loop1,loop2:integer;
    Tmp : Array [1..3] of byte;
      { This is temporary storage for the values of a color }
BEGIN
  For loop1:=1 to 64 do BEGIN
      { A color value for Red, green or blue is 0 to 63, so this loop only
        need be executed a maximum of 64 times }
    WaitRetrace;
    For loop2:=0 to 255 do BEGIN
      Getpal (loop2,Tmp[1],Tmp[2],Tmp[3]);
      If Tmp[1]>Pall2[loop2,1] then dec (Tmp[1]);
      If Tmp[2]>Pall2[loop2,2] then dec (Tmp[2]);
      If Tmp[3]>Pall2[loop2,3] then dec (Tmp[3]);
        { If the Red, Green or Blue values of color loop2 are less then they
          should be, increase them by one. }
      Pal (loop2,Tmp[1],Tmp[2],Tmp[3]);
        { Set the new, altered pallette color. }
    END;
  END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Pal_NC;
  { This procedure fades the screen out to black. }
VAR loop1,loop2:integer;
    Tmp : Array [1..3] of byte;
      { This is temporary storage for the values of a color }
BEGIN
  For loop1:=1 to 64 do BEGIN
    WaitRetrace;
    For loop2:=0 to 255 do BEGIN
      Getpal (loop2,Tmp[1],Tmp[2],Tmp[3]);
      If Tmp[1]>0 then dec (Tmp[1]);
      If Tmp[2]>0 then dec (Tmp[2]);
      If Tmp[3]>0 then dec (Tmp[3]);
        { If the Red, Green or Blue values of color loop2 are not yet zero,
          then, decrease them by one. }
      Pal (loop2,Tmp[1],Tmp[2],Tmp[3]);
        { Set the new, altered pallette color. }
    END;
  END;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure RestorePal;
  { This procedure restores the origional pallette }
VAR loop1:integer;
BEGIN
  WaitRetrace;
  For loop1:=0 to 255 do
    pal (loop1,Pall2[loop1,1],Pall2[loop1,2],Pall2[loop1,3]);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure SetUpVirtual;
    { This sets up the memory needed for the virtual screen }
BEGIN
    GetMem (VirScr,64000);
    vaddr := seg (virscr^);
    GetMem (VirScr2,64000);
    vaddr2 := seg (virscr2^);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure ShutDown;
    { This frees the memory used by the virtual screen }
BEGIN
    FreeMem (VirScr,64000);
    FreeMem (VirScr2,64000);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure SetUpVirtual2;
    { This sets up the memory needed for the virtual screen }
BEGIN
    GetMem (VirScr,64000);
    vaddr := seg (virscr^);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure ShutDown2;
    { This frees the memory used by the virtual screen }
BEGIN
    FreeMem (VirScr,64000);
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
procedure flip(source,dest:Word);
   { This copies the entire screen at "source" to destination }
begin
    asm
        push    ds
        mov     ax, [Dest]
        mov     es, ax
        mov     ax, [Source]
        mov     ds, ax
        xor     si, si
        xor     di, di
        mov     cx, 32000
        rep     movsw
        pop     ds
    end;
end;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure putico(X,Y:Word; xx,yy:byte; VAR sprt{:array of byte}; Where:Word);
  { This puts an icon, EXCEPT it's color 0 (black) pixels, onto the screen
    "where", at position X,Y }
label
  _Redraw, _DrawLoop, _Exit, _LineLoop, _NextLine, _Store, _NoPaint;
BEGIN
if (x+xx>320) or (y+yy>200) or (y<0) or (x<0) then exit;
asm
    push  ds
    push  es
    lds   si,Sprt
    mov   ax,X     { ax = x }
    mov   bx,Y     { bx = y }
_Redraw:
    push    ax
    mov     ax,[where]
    mov     es,ax
    mov     ax, bx                  {; ax = bx  x = y}
    mov     bh, bl                  {; y = y * 256  bx = bx * 256}
    xor     bl, bl
    shl     ax, 1
    shl     ax, 1
    shl     ax, 1
    shl     ax, 1
    shl     ax, 1
    shl     ax, 1                   {; y = y * 64   ax = ax * 64}
    add     bx, ax                  {; y = (y*256) + (Y*64)  bx = bx + ax (ie y*320)}
    pop     ax                      {; get back our x}
    add     ax, bx                  {; finalise location}
    mov     di, ax
    mov   dl,yy    { dl = height of sprite }
    xor   ch,ch
    mov   cl,xx     { cx = width of sprite }
    cld
    push  ax
    mov   ax,cx
_DrawLoop:
    push  di            { store y adr. for later }
    mov   cx,ax          { store width }
_LineLoop:
    mov   bl,byte ptr [si]
    or    bl,bl
    jnz   _Store
_NoPaint:
    inc    si
    inc    di
    loop   _LineLoop
    jmp    _NextLine
_Store:
    movsb
    loop  _LineLoop
_NextLine:
    pop   di
    dec   dl
    jz    _Exit
    add   di,320        { di = next line of sprite }
    jmp   _DrawLoop
_Exit:
    pop   ax
    pop   es
    pop   ds
  end;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Line(a,b,c,d:integer; col:byte; where:word);

    function sgn(a:real):integer;
    begin
        if a>0 then sgn:=+1;
        if a<0 then sgn:=-1;
        if a=0 then sgn:=0;
   end;
var i,s,d1x,d1y,d2x,d2y,u,v,m,n:integer;
begin
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
     s := m shr 1;
     FOR i := 0 TO m DO
     BEGIN
         putpixel(a,b,col,where);
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
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure ScreenTrans (x,y,xx,yy,source,dest:word);
  { This is a small procedure to copy a xx*yy pixel block from coordinates
    x,y on the source screen to coordinates x,y on the dest screen }
var xxx,yyy,xxxx:word;
BEGIN
xxx:=xx div 2;  yyy:=yy;
xxxx:=320-xx;
  asm
    push    ds
    push    es
    mov     ax,dest
    mov     es,ax
    mov     ax,source
    mov     ds,ax
    mov     bx,[X]
    mov     dx,[Y]
    push    bx                      {; and this again for later}
    mov     bx, dx                  {; bx = dx}
    mov     dh, dl                  {; dx = dx * 256}
    xor     dl, dl
    shl     bx, 1
    shl     bx, 1
    shl     bx, 1
    shl     bx, 1
    shl     bx, 1
    shl     bx, 1                   {; bx = bx * 64}
    add     dx, bx                  {; dx = dx + bx (ie y*320)}
    pop     bx                      {; get back our x}
    add     bx, dx                  {; finalise location}
    mov     di, bx                  {; es:di = where to go}
    mov     si, di
    mov     al,60
    mov     bx, yyy        { Hight of block to copy }
@@1 :
    mov     cx, xxx        { Width of block to copy divided by 2 }
    rep     movsw
    add     di,xxxx        { 320 - 48 = 272 .. or 110 in hex }
    add     si,xxxx
    dec     bx
    jnz     @@1

    pop     es
    pop     ds
  end;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
Procedure Trans2 (x,y,xx,yy,poc,source,pau:word);
var a,b:byte;
BEGIN
for a:=0 to yy-1 do
    begin
    for b:=0 to a do
        screentrans(x,y+(b*yy)+a-b,xx,1,source,vga);
    delay(pau);
    end;
if poc>yy then
    for a:=0 to poc-yy-1 do
        begin
        for b:=0 to yy-1 do
            screentrans(x,y+(b*(yy-1))+(yy*2)+(a*yy)-1,xx,1,source,vga);
        delay(pau);
        end;
for a:=0 to yy-2 do
    begin
    for b:=a to yy-2 do
        screentrans(x,y+a-1+(b*(yy-1))+(yy*(poc-yy+2)),xx,1,source,vga);
    delay(pau);
    end;
END;
{컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴}
END.