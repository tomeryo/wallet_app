import 'package:flutter/material.dart';
import 'package:wallet_app/custom_drawer/navigation_home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Supabase.initialize(
      url: 'https://ciddvvoyfduqguvgnrds.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNpZGR2dm95ZmR1cWd1dmducmRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTA4ODY4ODIsImV4cCI6MTk2NjQ2Mjg4Mn0.tdPgoNYdjRWnRt2xG_tX12rJDoENTRNkj0qKyIb4ktI',
      debug: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wallet app',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
