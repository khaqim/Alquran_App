import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bookmarks',
          style: TextStyle(fontSize: 20, color: Color(0xff672CBC)),
        ),
        leading: Image.asset('assets/images/line2.png'),
        actions: [
          Image.asset('assets/images/search-line 1.png'),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/vector2.png'),
                const Text(
                  'Add new collection',
                  style: TextStyle(fontSize: 16, color: Color(0xff863ED5)),
                ),
                const SizedBox(
                  width: 130,
                ),
                Image.asset('assets/images/vector1.png'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FileWidget('My Favorite', '8 items'),
            FileWidget('Daily', '6 items'),
          ],
        ),
      ),
    );
  }
}

class FileWidget extends StatelessWidget {
  String nameFile;
  String nameItems;

  FileWidget(
    this.nameFile,
    this.nameItems,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 50,
      child: Row(
        children: [
          Image.asset('assets/images/vector.png'),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                nameFile,
                style: TextStyle(fontSize: 16, color: Color(0xff240F4F)),
              ),
              Text(nameItems,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff8789A3),
                  )),
            ],
          ),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }
}
