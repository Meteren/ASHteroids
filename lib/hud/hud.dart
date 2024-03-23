import 'dart:async';
import 'package:ashtroids/hud_components/heart/heart.dart';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';

class Hud extends PositionComponent with HasGameRef<Ashteroids>{
  late Heart heart;

  Hud(){
    //debugMode = true;
    priority = 1;
  }
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    size = gameRef.size;
    Heart? tempHeart;
    for(int i = 1; i < 4; i++){
      if(i == 1){
        heart = Heart(position:Vector2(i*40,20),size:Vector2(30,30),heartNumber:i);
        tempHeart = heart;
      }else{
        heart = Heart(
            position:Vector2(tempHeart!.position.x + tempHeart.width + 10,20),
            size:Vector2(30,30),heartNumber:i);
        tempHeart = heart;
      }
      add(heart);
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    if(gameRef.spaceShip.health == 0){
      gameRef.add(gameRef.createExplosion(gameRef.spaceShip.position));
      gameRef.overlays.add('GameOverMenu');
      gameRef.spaceShip.removeFromParent();
      gameRef.spaceShip.health = -1;
    }
    super.update(dt);
  }
}