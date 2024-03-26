import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';
import '../life_bar/life_bar.dart';
import 'heart_contents/heart_animation.dart';
import 'heart_contents/heart_sprite.dart';

class Heart extends PositionComponent with HasGameRef<Ashteroids>{
  late HeartSprite heartSprite;
  late HeartAnimation heartAnimation;
  int heartNumber;
  LifeBar lifeBar;
  Heart({required Vector2 position,required Vector2 size,required this.heartNumber,required this.lifeBar}) : super(
    position: position,
    size: size
  );
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    heartAnimation = HeartAnimation(size: size);
    heartSprite = HeartSprite(size:size);
    add(heartSprite);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(lifeBar.lifeBarHeartStateHolder < heartNumber){
      //print("heart destroyed");
        add(heartAnimation);
        heartAnimation.animation = heartAnimation.heartFading;
        heartAnimation.animationTicker?.completed.whenComplete((){
        heartSprite.current = HeartContent.background;
        heartAnimation.removeFromParent();
       //print(lifeBar.lifeBarHeartStateHolder);

        if(lifeBar.lifeBarHeartStateHolder != -1){
          lifeBar.lifeBarElements[1].size.y = lifeBar.size.y;
        }
        heartNumber = -1;
        gameRef.spaceShip.health = lifeBar.lifeBarElements[1].size.y;

      });
    }
    super.update(dt);
  }
}