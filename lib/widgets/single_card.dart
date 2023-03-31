import 'package:flutter/material.dart';
import 'dart:ui';

class SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double? height;
  final double? borderRadius;
  final EdgeInsets? margin;
  final void Function()? onTap;

  const SingleCard({
    super.key, 
    required this.icon, 
    required this.color, 
    required this.text, 
    this.height = 150, 
    this.margin = const EdgeInsets.all(0), 
    this.borderRadius = 40, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapUp: (details) {
        //TODO:Poner la parte del gestor de estado que hace la animación. 
        //TODO:Para hacer la animación es tan facil como poner más radio del 
        //TODO:circle avatar, notificar, volver al mismo que antes y notificar. 
        //TODO:Luego hacer que la app no cambie hasta que no se complete la animación.
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius as double),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: height,
              decoration: BoxDecoration(
                color: const Color.fromARGB(129, 72, 75, 148),
                borderRadius: BorderRadius.circular(borderRadius as double),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: height!/5,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [0.1, 0.5],
                          colors: [
                            const Color.fromARGB(255, 209, 209, 209),
                            color,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(icon, color: Colors.white, size: 30,)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(text, style: TextStyle(color: color, fontSize: 15),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}