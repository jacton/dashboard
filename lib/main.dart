import 'package:flutter/material.dart';
import 'package:dashboard/ui/windows_adapter.dart';
import 'package:dashboard/screen/dashboard_screen.dart';
import 'package:dashboard/const/constants.dart';
import 'package:dashboard/controllers/MenuAppController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  WindowsAdapter.setSize();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
