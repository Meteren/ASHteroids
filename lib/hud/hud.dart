import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';
import 'hud_components/heart/heart.dart';
import 'hud_components/life_bar/life_bar.dart';

class Hud extends PositionComponent with HasGameRef<Ashteroids>{
  late Heart heart;
  late LifeBar lifeBar;
  Hud(){
    //debugMode = true;
    priority = 1;
  }
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    lifeBar = LifeBar(Vector2(20,30));
    add(lifeBar);
    size = gameRef.size;
    Heart? tempHeart;
    for(int i = 1; i < 4; i++){
      if(i == 1){
        heart = Heart(position:Vector2(i*40,20),size:Vector2(30,30),heartNumber:i,lifeBar:lifeBar);
        tempHeart = heart;
      }else{
        heart = Heart(
            position:Vector2(tempHeart!.position.x + tempHeart.width + 10,20),lifeBar: lifeBar,
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
    //print(children.length);
    if(lifeBar.lifeBarHeartStateHolder == 0){
      gameRef.add(gameRef.createExplosion(gameRef.spaceShip.position));
      gameRef.overlays.add('GameOverMenu');
      gameRef.spaceShip.removeFromParent();
      lifeBar.lifeBarHeartStateHolder = -1;
    }
    super.update(dt);
  }
}