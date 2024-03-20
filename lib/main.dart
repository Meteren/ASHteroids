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

import 'menu_widgets/pause_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ashteroids',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AshteroidPage(title: 'Ashteroids'),
    );
  }
}

class AshteroidPage extends StatefulWidget {
  const AshteroidPage({super.key, required this.title});
  final String title;

  @override
  State<AshteroidPage> createState() => _AshteroidPageState();
}

class _AshteroidPageState extends State<AshteroidPage> {
  late Ashteroids _ashteroids;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ashteroids = Ashteroids();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
          game: _ashteroids ,
          overlayBuilderMap:{
            'PauseMenu': (BuildContext context, Ashteroids game) => PauseMenu(game:_ashteroids),
            'PauseButton': pauseMenu,
          },),
    );
  }

  Widget pauseMenu(BuildContext context, Ashteroids game) {
    return IconButton(onPressed:(){
      game.pauseEngine();
      game.overlays.remove('PauseButton');
      game.overlays.add('PauseMenu');
    }, icon: const Icon(Icons.pause),
        color: Colors.white,
        );
  }
}

class Ashteroids extends FlameGame with TapDetector{
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
    if(overlays.isActive('PauseMenu')){

    }else{
      add(Bullet(bulletPos:Vector2(spaceShip.position.x,spaceShip.position.y),
          spaceShipVelocity: spaceShip.velocity * spaceShip.speed,
          bulletAngle: spaceShip.angle));
    }
  }
  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    overlays.add('PauseButton');
    final knobPalette = BasicPalette.darkRed.withAlpha(200).paint();
    final backgroundPalette = BasicPalette.red.withAlpha(100).paint();
    joystick = JoystickComponent(
        knob: CircleComponent(radius: 15, paint: knobPalette),
        background: CircleComponent(radius: 50, paint: backgroundPalette),
        margin: const EdgeInsets.only(left: 20, bottom: 20));
    //camera.viewport.add(Bullet(bulletPos: Vector2(10,10)));

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



