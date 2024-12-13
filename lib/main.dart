import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LottoApp(),
    );
  }
}

class LottoApp extends StatefulWidget {
  @override
  _LottoAppState createState() => _LottoAppState();
}

class _LottoAppState extends State<LottoApp> {
  List<List<int>> _lottoNumbers = [];

  void _generateLottoNumbers() {
    setState(() {
      _lottoNumbers = List.generate(5, (_) {
        var random = Random();
        var numbers = <int>{};
        while (numbers.length < 6) {
          numbers.add(random.nextInt(45) + 1);
        }
        return numbers.toList()..sort();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로또 번호 생성기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _generateLottoNumbers,
              child: const Text('로또 번호 생성'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _lottoNumbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '세트 ${index + 1}: ${_lottoNumbers[index].join(', ')}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
