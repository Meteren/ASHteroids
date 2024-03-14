import 'package:flame/components.dart';

class Utilities{
  static bool isOutsideOfBorders(Vector2 screenSize, Vector2 bulletPosition){
    if(bulletPosition.x < 0 ||
        bulletPosition.x > screenSize.x ||
        bulletPosition.y < 0 ||
        bulletPosition.y > screenSize.y){
      return true;
    }else{
      return false;
    }
  }
  static void changeShipPosition(Vector2 screenSize, Vector2 spaceShipPosition){
    if(spaceShipPosition.x < 0){
      spaceShipPosition.x = screenSize.x;
    }
    if(spaceShipPosition.x > screenSize.x){
      spaceShipPosition.x = 0;
    }
    if(spaceShipPosition.y < 0){
      spaceShipPosition.y = screenSize.y;
    }
    if(spaceShipPosition.y > screenSize.y){
      spaceShipPosition.y = 0;
    }
  }
}

