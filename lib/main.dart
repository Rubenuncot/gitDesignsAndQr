import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_sql/providers/ui_provider.dart';
import 'package:qr_sql/screens/screens.dart';
import 'package:qr_sql/theme/theme.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider(),)
      ],

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Reader',
       initialRoute: '_home',
       routes: {
        '_home':( _ ) => const HomeScreen(),
        '_map':( _ ) => const MapScreen(),
       },
       theme: CustomTheme.lightTheme(),
      ),
    );
  }

  
}