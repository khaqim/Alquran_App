import 'package:flutter/material.dart';

class HomeHeaderUI extends StatelessWidget {
  const HomeHeaderUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assalamualaikum',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8789A3),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Lukman',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff8789A3),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 140,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg2.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/read.png'),
                        const SizedBox(width: 10),
                        const Text(
                          'Last Read',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Al-Fatiah',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Ayah No: 1',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
