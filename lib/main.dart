import 'dart:async';
import 'package:ashtroids/bullet/bullet.dart';
import 'package:ashtroids/space_ship/spaceship.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

void main() {
  final game = Ashteroids();
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: game));
}

class Ashteroids extends FlameGame with TapDetector {

  late SpaceShip spaceShip;
  late ParallaxComponent parallax;
  static Vector2 universeSpeed = Vector2(0, 2);
  final pList = [
    ParallaxImageData("bkgd_0.png"),
    ParallaxImageData("bkgd_1.png"),
    ParallaxImageData("bkgd_2.png"),
    ParallaxImageData("bkgd_3.png"),
    ParallaxImageData("bkgd_4.png"),
    ParallaxImageData("bkgd_5.png"),
    ParallaxImageData("bkgd_6.png"),
    ParallaxImageData("bkgd_7.png")
  ];
  late JoystickComponent joystick;

  Ashteroids(){
    debugMode = false;
  }

  @override
  void onTapUp(TapUpInfo info) {
    // TODO: implement onTapUp
    super.onTapUp(info);
    add(Bullet(bulletPos:Vector2(spaceShip.position.x,spaceShip.position.y),
        spaceShipVelocity: spaceShip.velocity * spaceShip.speed,
        bulletAngle: spaceShip.angle));

  }

  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    final knobPalette = BasicPalette.darkRed.withAlpha(200).paint();
    final backgroundPalette = BasicPalette.red.withAlpha(100).paint();
    joystick = JoystickComponent(
        knob: CircleComponent(radius: 15, paint: knobPalette),
        background: CircleComponent(radius: 50, paint: backgroundPalette),
        margin: const EdgeInsets.only(left: 20, bottom: 20));

    spaceShip = SpaceShip(joystick: joystick);

    parallax = await loadParallaxComponent(
        pList,
        baseVelocity: universeSpeed,
        velocityMultiplierDelta: Vector2(1.2, 1.2),
        repeat: ImageRepeat.repeat);

    add(parallax);
    add(spaceShip);
    add(joystick);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if(joystick.delta.isZero()){
      parallax.parallax!.baseVelocity = universeSpeed;
    }else{
      parallax.parallax!.baseVelocity = spaceShip.velocity + universeSpeed;
    }
    print(children.length) ;
  }
}



