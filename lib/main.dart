import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/ui/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmate_farmacia/widgets/nav_rail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.interTightTextTheme()),
      home: const NavRail(),
    );
  }
}


