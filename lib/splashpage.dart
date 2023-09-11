import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Quran APP',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Color(0xFF672CBC),
            ),
          ),const SizedBox(height: 15,),
          const Text(
            'Learn Quran aaa',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF8789A3),
            ),
          ),
          const Text(
            'Recite once everyday',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF8789A3),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.only(left: 25),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/bg.png",
                ),
                Positioned(
                  bottom: 15,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(185, 60),
                          elevation: 5,
                          backgroundColor: const Color(0xFFF9B091),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Text(
                        'Get Started',
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
