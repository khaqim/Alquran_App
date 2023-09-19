import 'package:belajar_flutter_dari_nol/pages/quran/surah_page.dart';
import 'package:flutter/material.dart';
import 'home_header_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> get _menus => ['Surah', 'Para', 'Page', 'Hijb'];

  List<Widget> get _pages => const [
        SurahPage(),
        Center(child: Text('Page2')),
        Center(child: Text('Page3')),
        Center(child: Text('Page4')),
      ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeaderUI(),
          const SizedBox(height: 25),
          Expanded(
            child: DefaultTabController(
              length: _menus.length,
              child: Scaffold(
                appBar: TabBar(
                  indicatorColor: const Color(0xff672CBC),
                  labelColor: const Color(0xff672CBC),
                  unselectedLabelColor: const Color(0xff8789A3),
                  tabs: _menus.map((e) => Tab(text: e)).toList(),
                  onTap: (index) => setState(() => _index = index),
                ),
                body: _pages[_index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
