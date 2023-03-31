import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_sql/widgets/widgets.dart';

class PruebaBarScreen extends StatelessWidget {
   
  const PruebaBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Stack(
        children: const[
          //Static Background
          Background(),
      
          //Scrollable Body
          _Body()
        ],
      ),
    );
  }
}
class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          //Titulos
          PageTitle(),
          //Card Table
          CardTable()

        ]
      ),
    );
  }
}