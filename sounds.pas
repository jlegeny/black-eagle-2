Unit Sounds;

Interface

Uses Crt,Dsp,dos;
Var ff:file;
    lg:longint;

Procedure Sound_Vulcan(spd:word);
Procedure Sound_Laser(spd:word);
Procedure Sound_Plasma(spd:word);
Procedure Sound_Explode1(spd:word);

Implementation




Procedure Sound_Vulcan(spd:word);
Var a:Array[0..3125] of byte;
begin
Assign(ff,'other/sounds/Vulcan.wav');
Reset(ff,1);
Blockread(ff,a,Sizeof(a));
Close(ff);

lg:=(sizeof(a) div 11) -255;

  If Spd=1 then PlayBack(Addr(a),Sizeof(a), 8000);
  If Spd=2 then PlayBack(Addr(a),Sizeof(a),11025);
  If Spd=3 then PlayBack(Addr(a),Sizeof(a),22050);
  If Spd>3 then PlayBack(Addr(a),Sizeof(a),Spd);
end;

Procedure Sound_Laser(spd:word);
Var a:Array[0..3500] of byte; {3845}
begin
Assign(ff,'other/sounds/Laser.wav');
Reset(ff,1);
Blockread(ff,a,300);
Blockread(ff,a,Sizeof(a));
Close(ff);

lg:=(sizeof(a) div 11) -255;

  If Spd=1 then PlayBack(Addr(a),Sizeof(a), 8000);
  If Spd=2 then PlayBack(Addr(a),Sizeof(a),11025);
  If Spd=3 then PlayBack(Addr(a),Sizeof(a),22050);
  If Spd>3 then PlayBack(Addr(a),Sizeof(a),Spd);
end;

Procedure Sound_Plasma(spd:word);
Var a:Array[0..1500] of byte; {1705}
begin
Assign(ff,'other/sounds/Plasma.wav');
Reset(ff,1);
Blockread(ff,a,200);
Blockread(ff,a,Sizeof(a));
Close(ff);

lg:=(sizeof(a) div 11) -255;

  If Spd=1 then PlayBack(Addr(a),Sizeof(a), 8000);
  If Spd=2 then PlayBack(Addr(a),Sizeof(a),11025);
  If Spd=3 then PlayBack(Addr(a),Sizeof(a),22050);
  If Spd>3 then PlayBack(Addr(a),Sizeof(a),Spd);
end;

Procedure Sound_Explode1(spd:word);
Var a:Array[0..9000] of byte;
begin
Assign(ff,'other/sounds/Explode1.wav');
Reset(ff,1);
Blockread(ff,a,Sizeof(a));
Close(ff);

lg:=(sizeof(a) div 11) -255;

  If Spd=1 then PlayBack(Addr(a),Sizeof(a), 8000);
  If Spd=2 then PlayBack(Addr(a),Sizeof(a),11025);
  If Spd=3 then PlayBack(Addr(a),Sizeof(a),22050);
  If Spd>3 then PlayBack(Addr(a),Sizeof(a),Spd);
end;


Begin
end.