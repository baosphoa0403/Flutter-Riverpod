import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 5;
});

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Page"),
      ),
      body: Center(
        child: Consumer(
          // phần này sẽ rebuild
          builder: (context, watch, child) {
            final number = watch(numberProvider).toString();
            return Text(
              number,
              style: const TextStyle(fontSize: 62),
            );
          },
        ),
      ),
    );
  }
}
