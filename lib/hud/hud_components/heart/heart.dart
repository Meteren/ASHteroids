import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'heart_contents/heart_animation.dart';
import 'heart_contents/heart_sprite.dart';

class Heart extends PositionComponent with HasGameRef<Ashteroids>{
  late HeartSprite heartSprite;
  late HeartAnimation heartAnimation;
  int heartNumber;
  Heart({required Vector2 position,required Vector2 size,required this.heartNumber}) : super(
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
    //print(gameRef.spaceShip.health);
    if(gameRef.spaceShip.health < heartNumber){
      //print("heart destroyed");
      add(heartAnimation);
      heartAnimation.animation = heartAnimation.heartFading;
      heartAnimation.animationTicker?.onStart = () => gameRef.spaceShip.add(
          OpacityEffect.fadeOut(EffectController(
              duration: 0.1,
              alternate: true,
              repeatCount: 5
          ))..removeOnFinish = true);
      heartAnimation.animationTicker?.completed.whenComplete((){
        heartSprite.current = HeartContent.background;
        heartAnimation.removeFromParent();
        heartNumber = -1;
      });
    }
    super.update(dt);
  }
}