
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_sql/providers/ui_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selecctedMenuOption;
    return BottomNavigationBar(
      onTap: (index){
        uiProvider.selecctedMenuOption = index;
      },
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.black87,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.blur_on),
          label: "Direcciones"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Mapa"
        ),
      ]
    );
  }
}