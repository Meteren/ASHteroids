
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

abstract class Asteroid extends SpriteComponent with CollisionCallbacks{
  static const double defaultSpeed = 50;
  static const int defaultHealth = 100;
  static const int defaultDamage = 1;

  double? _speed;
  Vector2? _velocity;
  int?_health;
  int? _damage;

  Asteroid({Vector2? size, Vector2? position,Vector2? velocity})
      : super(position: position,size: size) {
    _speed = defaultSpeed;
    _health = defaultHealth;
    _damage = defaultDamage;
    _velocity = velocity;
  }

  Asteroid.fullInit(Vector2 size, Vector2 position,Vector2 velocity,
  int? health,int damage,double speed)
      : super(position: position,size: size){
    _speed = speed;
    _health = health;
    _damage = damage;
    _velocity = velocity;
  }

  int? get health => _health;

  int? get damage => _damage;

  Vector2? get velocity => _velocity;

  double? get speed => _speed;

  void onCreate();

  void onDestroyed();

  void onHit();

}