import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeBar extends PositionComponent with HasGameRef<Ashteroids>{
  int lifeBarHeartStateHolder = 3;
  static final Vector2 barSize = Vector2(10,50);
  int health = barSize.y.toInt();
  final backgroundColor = BasicPalette.black.paint();
  final foreGround = BasicPalette.darkRed.paint();
  late List<RectangleComponent> lifeBarElements;
  late TextComponent hp;
  TextPaint textPaint = TextPaint(
    style: GoogleFonts.oswald(
      textStyle: const TextStyle(fontSize: 15,color: Colors.white)
    )
  );



  LifeBar(Vector2 position) : super(position: position){
    size = barSize;
  }

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad

    hp = TextComponent(textRenderer:textPaint,text: 'HP',position: Vector2(-3,size.y));

    lifeBarElements = List<RectangleComponent>.generate(2, (index){
      if(index == 0){
        return RectangleComponent(size: barSize,paint: backgroundColor,
            anchor: Anchor.bottomLeft,position:Vector2(0,size.y));
      }else{
        return RectangleComponent(size:barSize,paint: foreGround,
            anchor: Anchor.bottomLeft,position: Vector2(0,size.y));
      }
    });
    addAll(lifeBarElements);
    add(hp);
    return super.onLoad();
  }
  @override
  void update(double dt) {
    // TODO: implement update

    super.update(dt);

    if(lifeBarElements[1].size.y != 0){
      lifeBarElements[1].size.y = gameRef.spaceShip.health;
    }
    if(gameRef.spaceShip.health == 0){
      if(lifeBarHeartStateHolder !=-1){
        lifeBarHeartStateHolder--;
      }
      print(lifeBarHeartStateHolder);
      gameRef.spaceShip.health--;
    }

  }
}