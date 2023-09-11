import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Image.asset('assets/images/line.png'),
          actions: [Image.asset('assets/images/search-line 1.png')],
          title: const Text('Quran App',
              style: TextStyle(color: Color(0xFF672CBC), fontSize: 20)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Assalamualaikum',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8789A3),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Lukman',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8789A3),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: 325,
                child: Stack(
                  children: [
                    Image.asset('assets/images/bg2.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/read.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Last Read',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Al-Fatiah',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
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
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Expanded(
                    child: TabBar(
                      indicatorColor: Color(0xff672CBC),
                      labelColor: Color(0xff672CBC),
                      unselectedLabelColor: Color(0xff8789A3),
                      tabs: [
                        Tab(
                          text: 'Surah',
                        ),
                        Tab(
                          text: 'Para',
                        ),
                        Tab(
                          text: 'Page',
                        ),
                        Tab(
                          text: 'Hijb',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/nb1.png', width: 32, height: 32),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/nb2.png', width: 32, height: 32),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/nb3.png', width: 32, height: 32),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/nb5.png', width: 32, height: 32),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/nb6.png', width: 32, height: 32),
          ),
        ], currentIndex: 0, onTap: (int index) {}),
      ),
    );
  }

  //
  // _response == null
  // ? Visibility(
  // visible: _isLoading,
  // child: const Center(child: CircularProgressIndicator()),
  // )
  //     : ListView.builder(
  // itemCount:
  // _response == null ? 0 : _response!['data'].length,
  // itemBuilder: (_, i) {
  // if (_response != null) {
  // Map<String, dynamic> item = _response!['data'][i];
  // final nomor = item['nomor'];
  // final nama = item['nama'];
  // final namaLatin = item['namaLatin'];
  // final tempatTurun = item['tempatTurun'];
  // final jumlahAyat = item['jumlahAyat'];
  // return Padding(
  // padding: const EdgeInsets.only(bottom: 16),
  // child: Row(
  // children: [
  // Text(nomor.toString()),
  // const SizedBox(width: 16),
  // Column(
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // Text(
  // namaLatin,
  // style: const TextStyle(
  // fontWeight: FontWeight.w500,
  // color: Colors.black,
  // ),
  // ),
  // const SizedBox(height: 4),
  // Text(
  // '$tempatTurun - $jumlahAyat Ayat'
  //     .toUpperCase(),
  // style: const TextStyle(
  // fontWeight: FontWeight.w500,
  // color: Colors.grey,
  // ),
  // ),
  // ],
  // ),
  // Expanded(
  // child: Text(
  // nama,
  // textAlign: TextAlign.end,
  // style: const TextStyle(
  // fontSize: 16,
  // color: Color(0xff863ED5),
  // ),
  // ),
  // ),
  // ],
  // ),
  // );
  // }
  // return const SizedBox.shrink();
  // },
  // ),

  _fetchData() async {
    setState(() => _isLoading = true);
    var client = http.Client();
    try {
      final result = await client.get(Uri.https('equran.id', 'api/v2/surat'));
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

/*
class HomePage extends StatefulWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? _response;
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Surat'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _fetchData,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.green,
                child: const Text(
                  'AmbilData',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: _response != null,
              child: Expanded(
                child: ListView.builder(
                  itemCount: _response == null ? 0 : _response!['data'].length,
                  itemBuilder: (_, i) {
                    if (_response != null) {
                      Map<String, dynamic> item = _response!['data'][i];
                      final nomor = item['nomor'];
                      final nama = item['nama'];
                      final namaLatin = item['namaLatin'];
                      final tempatTurun = item['tempatTurun'];
                      final jumlahAyat = item['jumlahAyat'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Text(nomor.toString()),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  namaLatin,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$tempatTurun - $jumlahAyat Ayat'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                nama,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff863ED5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  _fetchData() async {
    setState(() => _isLoading = true);
    var client = http.Client();
    try {
      final result = await client.get(Uri.https('equran.id', 'api/v2/surat'));
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
*/
