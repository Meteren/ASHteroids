import 'package:flame/components.dart';

class AsteroidBuildContext{
  static const double defaultSpeed = 50;
  static const int defaultHealth = 100;
  static const int defaultDamage = 1;
  double speed;
  Vector2 velocity;
  int health;
  int damage;
  Vector2 position;
  Vector2 size;

  AsteroidBuildContext(this.speed,this.size,this.health,this.damage,this.position,this.velocity);

}