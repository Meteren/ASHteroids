


import 'dart:async';
import 'dart:ui';
import 'package:ashtroids/asteroids/abstract_asteroid.dart';
import 'package:flame/components.dart';

class BigAsteroid extends Asteroid{

  BigAsteroid(Vector2 position,Vector2 size,Vector2 velocity)
      : super(position: position,size: size,velocity: velocity);

  BigAsteroid.fullInit(Vector2 size, Vector2 position,Vector2 velocity,
      int? health,int damage,double speed) : super.fullInit(size,position,velocity,health,damage,speed);

  @override
  void onCreate() {
    // TODO: implement onCreate
  }

  @override
  void onDestroyed() {
    // TODO: implement onDestroyed
  }

  @override
  void onHit() {
    // TODO: implement onHit
  }

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
  }


}