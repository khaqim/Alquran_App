import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurahDetailArgument {
  final int surahNumber;
  final String latinName;
  final String surahName;
  final String meaning;
  final String place;
  final int amount;

  SurahDetailArgument({
    required this.surahNumber,
    required this.surahName,
    required this.latinName,
    required this.meaning,
    required this.place,
    required this.amount,
  });
}

class SurahDetailPage extends StatefulWidget {
  static const route = '/surah-detail';
  final SurahDetailArgument argument;

  const SurahDetailPage({super.key, required this.argument});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  Map<String, dynamic>? _response;
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = false;
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.argument.latinName,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff672CBC),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff8789A3),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Image.asset('assets/images/search-line 1.png'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/Frame 33.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          widget.argument.latinName,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(widget.argument.meaning,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white)),
                        ),
                        const SizedBox(
                          width: 200,
                          child: Divider(color: Colors.white30, thickness: 1),
                        ),
                        Text(
                            '${widget.argument.place} . ${widget.argument.amount} ayat',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              _response == null
                  ? Visibility(
                      visible: _isLoading,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _response!['data']['ayat'].length,
                      itemBuilder: (_, i) {
                        Map<String, dynamic> itemAyat =
                            _response!['data']['ayat'][i];
                        int number = itemAyat['nomorAyat'];
                        String arabicText = itemAyat['teksArab'];
                        String indonesianText = itemAyat['teksIndonesia'];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildPlayerUI(number),
                              const SizedBox(height: 16),
                              Text(
                                arabicText,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                indonesianText,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color:
                                    const Color(0xffBBC4CE).withOpacity(0.35),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPlayerUI(int number) {
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color.fromRGBO(18, 25, 49, 0.05),
        color: const Color(0xff121931).withOpacity(0.05),
      ),
      height: 47,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xff863ED5),
            ),
            child: Text(
              '$number',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 170,
          ),
          Image.asset('assets/images/share.png'),
          Image.asset('assets/images/play.png'),
          Image.asset('assets/images/copy.png')
        ],
      ),
    );
  }

  _fetchData() async {
    setState(() => _isLoading = true);
    var client = http.Client();
    try {
      final result = await client.get(Uri.https(
          'equran.id', 'api/v2/surat/${widget.argument.surahNumber}'));
      _response = jsonDecode(result.body);
      debugPrint('HASIL RESPONSE:\n$_response');
    } catch (e) {
      debugPrint('error -> $e');
    } finally {
      debugPrint('finally is called');
      setState(() => _isLoading = false);
      client.close();
    }
  }
}
