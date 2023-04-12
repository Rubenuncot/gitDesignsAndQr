import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_sql/providers/scan_provider.dart';
import 'package:qr_sql/providers/ui_provider.dart';
//import 'package:qr_sql/screens/prueba_bar_screen.dart';
import 'package:qr_sql/screens/screens.dart';
import 'package:qr_sql/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //

    final size = MediaQuery.of(context).size;

    return const Scaffold(
      appBar: CustomAppBar(),
      body: _HomePageBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CustomFloatingActionButton(),
      //floatingActionButton: CustomSideBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, 
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: const SafeArea(child: Text("Historial")),
        actions: [
          IconButton(
            onPressed: (){
              final scanProvider = Provider.of<ScanProvider>(context, listen: false);
              scanProvider.borrarScans();
            },
            icon: const Icon(Icons.delete)
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener el currentIndex
    final uiPorovider = Provider.of<UiProvider>(context);

    final scanProvider = Provider.of<ScanProvider>(context, listen: false);


    //Cambiar el indice para mostrar la página correspondiente
    final currentIndex = uiPorovider.selecctedMenuOption;
    
    switch(currentIndex){ 
      case 1:
        scanProvider.cargarScansPorTipo('geo');
        return const MapsScreen();
      case 0:
        scanProvider.cargarScansPorTipo('http');
        return const DetailsScreen();
      default:
        return const MapsScreen();
    }
  }
}