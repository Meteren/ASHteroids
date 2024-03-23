
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Game Over',
            style: GoogleFonts.oswald(
              textStyle:const TextStyle(color: Colors.white,fontSize: 50,letterSpacing: 5)
            )
        ),
        );
  }
}
