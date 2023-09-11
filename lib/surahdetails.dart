import 'package:flutter/material.dart';

class SurahDetails extends StatelessWidget {
  const SurahDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Al-Fatiah',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff672CBC),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xff8789A3),
        ),
        actions: [
          Image.asset('assets/images/search-line 1.png'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 260,
                  width: 320,
                  child: Image.asset('assets/images/Frame 33.png'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 214,
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              'Al-Fatiah',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 15),
                              child: Text('The Opening',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ),
                            Divider(
                              color: Colors.white30,
                              thickness: 1,
                            ),
                            Text('Meccan . 7 verses',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('data',
                          style: TextStyle(fontSize: 26, color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(padding: EdgeInsets.only(left: 13,right: 13),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff863ED5),
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),SizedBox(width: 170,),
                  Image.asset('assets/images/share.png'),
                    Image.asset('assets/images/play.png'),
                    Image.asset('assets/images/copy.png')

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              height: 47,
              width: 320,
            ),
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
