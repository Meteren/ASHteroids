
import 'dart:async';
import 'package:ashtroids/main.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import '../utilities.dart';

class Bullet extends ShapeComponent with HasGameRef<Ashteroids>{
  double speed = 250;
  Vector2? spaceShipVelocity;
  Vector2 bulletVelocity = Vector2(0,-1);
  double? bulletAngle;

  final bulletPalette = BasicPalette.white.paint();

  Bullet({Vector2? bulletPos, this.spaceShipVelocity,this.bulletAngle})
      :super(position: bulletPos){
    //debugMode = true;
    size = Vector2(2,14);
    anchor = Anchor.bottomCenter;
  }

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    angle = bulletAngle!;
    bulletVelocity.rotate(angle);
    bulletVelocity = bulletVelocity..scaleTo(speed);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    canvas.drawRect(size.toRect(), bulletPalette);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(spaceShipVelocity != Vector2(0,0)){
      position.add((bulletVelocity + spaceShipVelocity!)*dt);
    }else{
      position.add((bulletVelocity) * dt);
    }

    gameRef.children.any((element){
      if(Utilities.isOutsideOfBorders(gameRef.size,position) && element is Bullet){
        gameRef.remove(element);
        return true;
      }else{
        return false;
      }
    });
  }
}
