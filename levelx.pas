Unit LevelX;

Interface

Uses Data,Game;
procedure MakeEnemyz(W:Integer);

Implementation


Procedure MakeEnemyz(W:Integer);
Begin

 If W=97 then BEGIN
  RouteR(  2,  2, 23,  3, 36,  6, 69,  9, 00, 00);
  RouteD(150, 50, 10, 10, 10, 10, 10,160, 00, 00);
  RouteS(  1,  0,  2,  2,  2,  2,  2,  1, 00, 00);
  GenEn(1,200,-110,8,0,WayP);
 END;

 If W=94 then BEGIN
  RouteR(  2,  2, 23,  3, 36,  6, 69,  9, 00, 00);
  RouteD(250, 50, 10, 10, 10, 10, 10,160, 00, 00);
  RouteS(  2,  0,  2,  2,  2,  2,  2,  1, 00, 00);
  GenEn(1,230,-110,8,0,WayP);

  RouteR(  2,  2, 12,  1, 41,  4, 74,  7, 00, 00);
  RouteD(250, 50, 10, 10, 10, 10, 10,160, 00, 00);
  RouteS(  2,  0,  2,  2,  2,  2,  2,  1, 00, 00);
  GenEn(1, 90,-110,8,0,WayP);
 END;

 If W=92 then BEGIN
  GenEn(4,190,-40,1,1,WayP);
 END;

 If W=90 then BEGIN
  GenEn(4, 90,-40,1,1,WayP);
 END;

 If W=88 then BEGIN
  RouteR(  2,  2, 23,  3, 36,  6, 69,  9, 00, 00);
  RouteD(250, 50, 10, 10, 10, 10, 10,160, 00, 00);
  RouteS(  2,  0,  2,  2,  2,  2,  2,  1, 00, 00);
  GenEn(1,230,-110, 8,0,WayP);

  RouteR(  2,  1,  4,  7,  8,  9,  6, 36, 36,  3);
  RouteD(230, 10, 10, 10, 10, 10,120, 10, 50,100);
  RouteS(  3,  2,  2,  2,  2,  2,  3,  2,  0,  3);
  GenEn(1, 90,-110,10,0,WayP);
 END;

 If W=85 then BEGIN
  RouteR( 12,  2, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(180,160,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  3,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,140,-110,2,0,WayP);

  GenEn(12,160,-110,1,4,WayP);

  RouteR( 23,  2, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(180,160,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  3,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,180,-110,2,0,WayP);
 END;

 If W=83 then BEGIN
  RouteR( 12, 12,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(190,100,130,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,140,-110,3,0,WayP);

  RouteR(  2,  2,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(160,100,160,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,160,-110,3,0,WayP);

  RouteR( 23, 23,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(190,100,130,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,180,-110,3,0,WayP);
 END;

 If W=82 then BEGIN
  GenEn(5,190,-40,1,1,WayP);
 END;

 If W=80 then BEGIN
  RouteR(  2, 69,  6, 36, 00, 00, 00, 00, 00, 00);
  RouteD( 70,100, 77,100,  0,  0,  0,  0, 00, 00);
  RouteS(  1,  1,  1,  1,  0,  0,  0,  0, 00, 00);
  GenEn(3,50,-30,4,0,WayP);

  GenEn(9,100,-40,1,1,WayP);
 END;

 If W=77 then BEGIN
  GenEn(5,120,-40,1,1,WayP);
  GenEn(5,160,-60,1,1,WayP);
  GenEn(5,200,-80,1,1,WayP);
 END;

 If W=75 then BEGIN
  GenEn(12,140,-110,3,5,WayP);
  GenEn(12,160,-110,1,4,WayP);
  GenEn(12,180,-110,3,6,WayP);
 END;

 If W=73 then BEGIN
  GenEn(12,140,-110,3,5,WayP);
  GenEn(12,160,-110,1,4,WayP);
  GenEn(12,180,-110,3,6,WayP);
 END;

 If W=72 then BEGIN
  RouteR( 12, 12,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(190,100,100,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,140,-110,3,0,WayP);

  RouteR(  2,  2,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(160,100,130,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,160,-110,3,0,WayP);

  RouteR( 23, 23,  2, 00, 00, 00, 00, 00, 00, 00);
  RouteD(190,100,100,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  3,  0,  0,  0,  0,  0, 00, 00);
  GenEn(1,180,-110,3,0,WayP);
 END;

 If W=70 then BEGIN
  GenEn(4,117,-40,1,1,WayP);
  GenEn(4,155,-40,1,1,WayP);
 END;

 If W=69 then BEGIN
  GenEn(5,257,-40,1,1,WayP);
 END;

 If W=68 then BEGIN
  GenEn(12,140,-110,3,5,WayP);
  GenEn(12,160,-110,1,4,WayP);
  GenEn(12,180,-110,3,6,WayP);
 END;

 If W=66 then BEGIN
  GenEn(2, 60,-110,1,2,WayP);
  GenEn(2,100,-110,1,2,WayP);
 END;

 If W=64 then BEGIN
  GenEn(2,260,-110,1,2,WayP);
  GenEn(2,220,-110,1,2,WayP);
 END;

 If W=62 then BEGIN
  GenEn(6,160,-110,1,2,WayP);
 END;

 If W=61 then BEGIN
  GenEn(12, 40,-110,1,4,WayP);
  GenEn(12,100,-110,1,4,WayP);
  GenEn(12,220,-110,1,4,WayP);
  GenEn(12,260,-110,1,4,WayP);
 END;

 If W=60 then BEGIN
  GenEn(12, 60,-110,1,4,WayP);
  GenEn(12,120,-110,1,4,WayP);
  GenEn(12,200,-110,1,4,WayP);
  GenEn(12,240,-110,1,4,WayP);
 END;

 If W=58 then BEGIN
  RouteR(  6, 69,  9, 98,  9, 69,  6, 36,  6, 00);
  RouteD(120, 10, 10, 60, 10, 10, 10, 60, 60, 00);
  RouteS(  1,  1,  1,  1,  1,  1,  1,  1,  1, 00);
  GenEn( 3, -10, 35,9,0,WayP);
 END;

 If W=56 then BEGIN
  RouteR( 12,  2, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(180,160,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  3,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,140,-110,2,0,WayP);

  GenEn(12,160,-110,1,4,WayP);

  RouteR( 23,  2, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(180,160,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  3,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,180,-110,2,0,WayP);
 END;


 If W=55 then BEGIN
  GenEn(12, 40,-110,1,4,WayP);
  GenEn(12,100,-110,1,4,WayP);
  GenEn(12,220,-110,1,4,WayP);
  GenEn(12,280,-110,1,4,WayP);
 END;

 If W=54 then BEGIN
  GenEn(12,130,-110,1,4,WayP);
  GenEn(12,160,-110,1,4,WayP);
  GenEn(12,190,-110,1,4,WayP);
 END;


 If W=53 then BEGIN
  GenEn(4,200,-30,1,1,WayP);
 END;

 If W=52 then BEGIN
  GenEn(4, 80,-50,1,1,WayP);
  GenEn(4,120,-30,1,1,WayP);
  GenEn(5,195,-66,1,1,WayP);
 END;

 If W=50 then BEGIN
  RouteR(  4, 00, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(360,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,320, 50,1,0,WayP);

  RouteR(  6, 00, 00, 00, 00, 00, 00, 00, 00, 00);
  RouteD(410,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  RouteS(  3,  0,  0,  0,  0,  0,  0,  0, 00, 00);
  GenEn(12,-50,100,1,0,WayP);
 END;

 If W=49 then BEGIN
  GenEn(2, 60,-110,1,2,WayP);
  GenEn(2,100,-110,1,2,WayP);
 END;

 If W=48 then BEGIN
  GenEn(2,160,-110,1,2,WayP);
  GenEn(2,200,-110,1,2,WayP);
 END;

 If W=46 then BEGIN
  GenEn(12,160,-110,3,5,WayP);
  GenEn(1,160,-110,1,2,WayP);
  GenEn(12,160,-110,3,6,WayP);
 END;

 If W=45 then BEGIN
  GenEn(1, 60,-110,1,2,WayP);
  GenEn(1,100,-140,1,2,WayP);
 END;

 If W=44 then BEGIN
  GenEn(2,320,-110,1,7,WayP);
  GenEn(2,230,-140,1,2,WayP);
 END;

 If W=43 then BEGIN
  GenEn(2,-130,-140,1,9,WayP);
 END;

 If W=42 then BEGIN
  RouteR(  4, 41,  1, 12,  2, 23,  3, 36,  6, 00);
  RouteD(140, 20, 20, 20, 20, 20, 20, 20,190, 00);
  RouteS(  3,  3,  3,  3,  3,  3,  3,  3,  3, 00);
  GenEn(12,380,40,9,0,WayP);

  RouteR(  4, 41,  1, 12,  2, 23,  3, 36,  6, 00);
  RouteD(240, 20, 20, 20, 20, 20, 20, 20,290, 00);
  RouteS(  3,  3,  3,  3,  3,  3,  3,  3,  3, 00);
  GenEn(12,480,40,9,0,WayP);
 END;

 If W=41 then BEGIN
  RouteR(  6, 36,  3, 23,  2, 12,  1, 41,  4, 00);
  RouteD(180, 20, 20, 20, 20, 20, 20, 20,230, 00);
  RouteS(  3,  3,  3,  3,  3,  3,  3,  3,  3, 00);
  GenEn(12,-50,40,9,0,WayP);
 END;

 If W=40 then BEGIN
  RouteR(  4, 41,  1, 12,  2, 23,  3, 36,  6, 00);
  RouteD(140, 20, 20, 20, 20, 20, 20, 20,190, 00);
  RouteS(  5,  4,  4,  4,  4,  4,  4,  4,  5, 00);
  GenEn(12,380,40,9,0,WayP);

  RouteR(  6, 36,  3, 23,  2, 12,  1, 41,  4, 00);
  RouteD(180, 10, 10, 10, 10, 10, 10, 10,230, 00);
  RouteS(  4,  3,  3,  3,  3,  3,  3,  3,  4, 00);
  GenEn(12,-50,20,9,0,WayP);
 END;

 If W=39 then BEGIN
  GenEn(12,100,-110,1,4,WayP);
  GenEn(12,160,-110,1,4,WayP);
  GenEn(12,220,-110,1,4,WayP);
  GenEn( 5, 70,-30,1,1,WayP);
  GenEn( 5,260,-35,1,1,WayP);
 END;

 If W=38 then BEGIN
  GenEn( 4,160,-45,1,1,WayP);

 END;

 If W=35 then BEGIN
  RouteR(  4, 74,  7, 87,  8, 87,  4, 41,  4, 00);
  RouteD(100,  5,  5,  5, 40,  5,  5, 85,100, 00);
  RouteS(  1,  2,  2,  2,  1,  2,  2,  1,  1, 00);
  GenEn( 3,330,40,9,0,WayP);
 END;

 If W=33 then BEGIN
  GenEn( 5,240,-40,1,1,WayP);
  GenEn( 5,275,-40,1,1,WayP);
 END;

 If W=32 then BEGIN
  RouteR(  4, 41,  1, 12,  2, 23,  3, 36,  6, 00);
  RouteD(140, 20, 20, 20, 20, 20, 20, 20,190, 00);
  RouteS(  2,  1,  1,  1,  1,  1,  1,  1,  2, 00);
  GenEn(1,380,40,9,0,WayP);

  RouteR(  6, 36,  3, 23,  2, 12,  1, 41,  4, 00);
  RouteD(180, 10, 10, 10, 10, 10, 10, 10,230, 00);
  RouteS(  2,  1,  1,  1,  1,  1,  1,  1,  2, 00);
  GenEn(1,-50,20,9,0,WayP);
 END;

 If W=31 then BEGIN
  GenEn( 6, 80,-110,1,2,WayP);
 END;

 If W=30 then BEGIN
  GenEn( 6,250,-110,1,2,WayP);
 END;

 If W=26 then BEGIN
  RouteR(  6, 69,  9, 69,  6, 00, 00, 00, 00, 00);
  RouteD(160, 10,150, 10, 50,  0,  0,  0, 00, 00);
  RouteS(  1,  1,  1,  1,  1,  0,  0,  0, 00, 00);
  GenEn( 3,-40,  50,5,0,WayP);
 END;

 If W=24 then BEGIN
  RouteR(  6, 69,  9, 98,  8, 98,  9, 69,  6, 00);
  RouteD(200, 10, 10, 10, 60, 10, 10, 10, 90, 00);
  RouteS(  1,  1,  1,  1,  1,  1,  1,  1,  1, 00);
  GenEn( 3,-40,  50,9,0,WayP);
 END;

 If W=23 then BEGIN
  GenEn( 5, 70, -30,1,1,WayP);
 END;

 If W=22 then BEGIN
  GenEn( 4,200, -30,1,1,WayP);
 END;

 If W=19 then BEGIN
  GenEn( 5, 60, -30,1,1,WayP);
  GenEn( 5,110, -30,1,1,WayP);
  GenEn( 5,160, -30,1,1,WayP);
 END;

 If W=15 then BEGIN
  GenEn( 7, 90, -30,1,1,WayP);
  GenEn( 8,230, -30,1,1,WayP);
 END;



 If W=9 then BEGIN
  RouteR(  2,  6,  3,  2,  1,  4,  7,  8,  9,  6);
  RouteD(180,110, 10, 10, 10,260, 10, 10, 10,260);
  RouteS(  7,  1,  1,  1,  1,  1,  1,  1,  1,  1);
  GenEn(14,160,-110,1,0,WayP);
 END;


end;


Begin
end.