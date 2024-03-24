import 'dart:async';
import 'package:flame/components.dart';

enum HeartContent{
  border,
  background,
  heart
}

class HeartSprite extends SpriteGroupComponent<HeartContent>{
  late Sprite border;
  late Sprite background;
  late Sprite heart;

  HeartSprite({required super.size});

  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad

    border = await Sprite.load('border.png');
    background = await Sprite.load('background.png');
    heart = await Sprite.load('heart.png');

    sprites = {
      HeartContent.border: border,
      HeartContent.background: background,
      HeartContent.heart: heart
    };

    current = HeartContent.heart;
    return super.onLoad();
  }

}