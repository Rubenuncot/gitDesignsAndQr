import 'package:flutter/material.dart';
import 'package:qr_sql/widgets/widgets.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.2),
      child: SizedBox(
        width: size.width * 0.7,
        child: Table(
          children: [
            TableRow(
              children: [
                SingleCard(icon: Icons.looks_one_outlined, text: "Sala 1", color: Colors.blue, onTap:() {
                  print("hola");
                },),
                const SingleCard(icon: Icons.looks_two_outlined, text: "Sala 2", color: Colors.amber,),
              ]
            ),
            TableRow(
              children: [
                SingleCard(icon: Icons.looks_3_outlined, text: "Sala 3", color: Colors.red, onTap: () {
                  
                },),
                const SingleCard(icon: Icons.looks_4_outlined, text: "Sala 4", color: Colors.cyan,),
              ]
            ),
            TableRow(
              children: [
                SingleCard(icon: Icons.looks_5_outlined, text: "Sala 5", color: Colors.red, onTap: () {
                  
                },),
                const SingleCard(icon: Icons.looks_6_outlined, text: "Sala 6", color: Colors.cyan,),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

