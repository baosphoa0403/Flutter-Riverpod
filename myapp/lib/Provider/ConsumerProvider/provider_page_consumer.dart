import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/Provider/ProviderPage/provider_page.dart';

class ProviderPageConsumer extends ConsumerWidget {
  const ProviderPageConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final number = watch(numberProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Page Consumer"),
      ),
      body: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 62),
        ),
      ),
    );
  }
}
