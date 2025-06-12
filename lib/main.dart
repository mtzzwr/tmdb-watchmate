import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_watchmate/app/core/di/injector.dart';
import 'package:tmdb_watchmate/app/core/routes/routes.dart';
import 'package:tmdb_watchmate/app/presentation/pages/home_page.dart';

void main() {
  Injector.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.playTextTheme()),
      onGenerateRoute: onGenerateRoute(),
      home: HomePage(),
    );
  }
}
