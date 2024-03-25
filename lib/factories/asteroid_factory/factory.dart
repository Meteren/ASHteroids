
import 'package:ashtroids/asteroids/abstract_asteroid.dart';
import 'package:ashtroids/asteroids/big_asteroid/big_asteroid.dart';
import 'package:ashtroids/factories/asteroid_factory/asteroid_build_context.dart';

import '../../asteroids/medium_asteroid/medium_asteroid.dart';
import '../../asteroids/small_asteroid/small_asteroid.dart';

enum AsteroidType{
  small,
  medium,
  big
}

class AsteroidFactory{

  static Asteroid buildAsteroids(AsteroidBuildContext context,AsteroidType type){
    Asteroid asteroid;
    switch(type){
      case AsteroidType.small:
        if(context.speed != AsteroidBuildContext.defaultSpeed){
          asteroid = SmallAsteroid.fullInit(context.size, context.position, context.velocity,
              context.health, context.damage, context.speed);
        }else{
          asteroid = SmallAsteroid(context.position, context.size, context.velocity);
        }
        break;
      case AsteroidType.medium:
        if(context.speed != AsteroidBuildContext.defaultSpeed){
          asteroid = MediumAsteroid.fullInit(context.size, context.position, context.velocity,
              context.health, context.damage, context.speed);
        }else{
          asteroid = MediumAsteroid(context.position, context.size, context.velocity);
        }
        break;
      case AsteroidType.big:
        if(context.speed != AsteroidBuildContext.defaultSpeed){
          asteroid = BigAsteroid.fullInit(context.size, context.position, context.velocity,
              context.health, context.damage, context.speed);
        }else{
          asteroid = BigAsteroid(context.position, context.size, context.velocity);
        }
        break;
      default:
        if(context.speed != AsteroidBuildContext.defaultSpeed){
          asteroid = BigAsteroid.fullInit(context.size, context.position, context.velocity,
              context.health, context.damage, context.speed);
        }else{
          asteroid = BigAsteroid(context.position, context.size, context.velocity);
        }
        break;
    }
    return asteroid;
  }

}