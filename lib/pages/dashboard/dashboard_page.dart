import 'package:belajar_flutter_dari_nol/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'dashboard_menu.dart';

class DashboardPage extends StatefulWidget {
  static const route = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Image.asset('assets/images/line.png'),
          actions: [Image.asset('assets/images/search-line 1.png')],
          title: const Text('Quran App',
              style: TextStyle(color: Color(0xFF672CBC), fontSize: 20)),
        ),
        body: _pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: const Color(0xFF672CBC),
          items: DashboardMenu.values
              .map((e) => BottomNavigationBarItem(
                  label: e.name, icon: Image.asset(e.icon)))
              .toList(),
          onTap: (index) => setState(() => _index = index),
        ),
      );

  List<Widget> get _pages =>
      const [HomePage(), Page2(), Page3(), Page4(), Page5()];
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 1'));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 2'));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 3'));
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 4'));
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Page 5'));
  }
}
