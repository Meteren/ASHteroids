import 'package:ashtroids/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PauseMenuInterface extends StatelessWidget {
  final Ashteroids _game;
  const PauseMenuInterface({super.key,required Ashteroids game}) : _game = game;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          shadowColor: Colors.deepPurple,
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Paused',
                  style: GoogleFonts.oswald(
                    textStyle: const TextStyle(fontSize:50,color: Colors.white, letterSpacing: .5),
                  ),),
                IconButton(onPressed: () {
                  _game.resumeEngine();
                  _game.overlays.remove('PauseMenu');
                  _game.overlays.add('PauseButton');
                  },
                    icon: const Icon(Icons.play_arrow),
                    color: Colors.white,)
              ],
            ),
          ),
        ));
  }
}
