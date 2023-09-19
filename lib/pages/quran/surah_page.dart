import 'package:belajar_flutter_dari_nol/pages/quran/surah_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                    final int number = item['nomor'];
                    final name = item['nama'];
                    final latinName = item['namaLatin'];
                    final place = item['tempatTurun'];
                    final amount = item['jumlahAyat'];
                    final meaning = item['arti'];
                    return GestureDetector(
                      onTap: () {
                        final argument = SurahDetailArgument(
                          surahNumber: number,
                          surahName: name,
                          latinName: latinName,
                          meaning: meaning,
                          place: place,
                          amount: amount,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return SurahDetailPage(argument: argument);
                            },
                          ),
                        );

                        Navigator.pushNamed(context, SurahDetailPage.route,
                            arguments: argument);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Text(number.toString()),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  latinName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$place - $amount Ayat'.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                name,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff863ED5),
                                ),
                              ),
                            ),
                          ],
                        ),
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
