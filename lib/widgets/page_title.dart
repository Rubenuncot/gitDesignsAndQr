

import 'package:flutter/material.dart';
import 'package:qr_sql/widgets/widgets.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const SingleCard(icon: Icons.table_bar_rounded, color: Colors.lightGreen, text: 'Comedor', height: 100, margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60), borderRadius: 20,),
              Container(width: size.width * 0.35,),
              const SingleCard(icon: Icons.remove_red_eye_outlined, color: Colors.deepOrange, text: 'Recordatorios', height: 100, margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60), borderRadius: 20,),
            ],)
            
          ],
        )
      ),
    );
  }
}