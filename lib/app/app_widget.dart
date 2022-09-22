import 'package:challenge65/app/modules/home/home_page.dart';
import 'package:challenge65/app/modules/reportCard/report_card_page.dart';
import 'package:challenge65/app/modules/student_information/student_information_page.dart';
import 'package:flutter/material.dart';
import 'modules/notes/notes_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/studentInformation': (context) => const StudentInformation(),
        NotesPage.roteName: (context) => const NotesPage(title: 'Notas'),
        ReportCard.routeName: (context) => const ReportCard(),
      },
    );
  }
}
