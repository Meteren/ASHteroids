import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';

class HeartAnimation extends SpriteAnimationComponent with HasGameRef<Ashteroids>{
  late SpriteAnimation heartFading;
  
  HeartAnimation({required super.size});
  
  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    heartFading = SpriteAnimation.fromFrameData(gameRef.images.fromCache('heart_animated_1.png'),
        SpriteAnimationData.sequenced(
            amount: 5, stepTime: 0.1, textureSize: Vector2(17,17),loop: false));
    return super.onLoad();
  }

}