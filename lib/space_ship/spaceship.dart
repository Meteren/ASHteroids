import 'dart:async';
import 'package:ashtroids/utilities.dart';
import 'package:flame/components.dart';
import '../main.dart';

class SpaceShip extends SpriteComponent with HasGameRef<Ashteroids>{

  double speed = 200;
  Vector2 spaceShipSize = Vector2(50, 50);
  Vector2 velocity = Vector2.zero();
  JoystickComponent? joystick;

  SpaceShip({this.joystick}): super(){
    size = spaceShipSize;
    anchor = Anchor.center;
    flipVerticallyAroundCenter();
    flipHorizontallyAroundCenter();
  }

  @override
  FutureOr<void> onLoad () async{
    // TODO: implement onLoad
    sprite = await Sprite.load("space_ship.png");
    position = Vector2(gameRef.size.x/2, gameRef.size.y/2);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(!joystick!.delta.isZero()){
      velocity = joystick!.relativeDelta * speed;
      position.add(velocity * dt);
      angle = joystick!.relativeDelta.screenAngle();
    }else{
      velocity = Vector2.zero();
    }
    Utilities.changeShipPosition(gameRef.size, position);
  }

}