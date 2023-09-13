import 'dart:convert';

import 'package:belajar_flutter_dari_nol/models/daftar_surat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
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
      body: _response == null
          ? Visibility(
              visible: _isLoading,
              child: const Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
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
                                '$tempatTurun - $jumlahAyat Ayat'.toUpperCase(),
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
