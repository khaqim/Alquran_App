import 'package:belajar_flutter_dari_nol/pages/bookmarks/bookmarks.dart';
import 'package:belajar_flutter_dari_nol/pages/dashboard/dashboard_page.dart';
import 'package:belajar_flutter_dari_nol/pages/quran/surah_detail_page.dart';
import 'package:belajar_flutter_dari_nol/splashpage.dart';
import 'package:belajar_flutter_dari_nol/surahdetails.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DashboardPage.route,
      routes: {
        DashboardPage.route: (context) => const DashboardPage(),
        SurahDetailPage.route: (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          return SurahDetailPage(argument: argument as SurahDetailArgument);
        }
      },
    );
  }
}
