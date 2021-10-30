import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose<int>((ref) => 10);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final provider = watch(counterProvider); // state Controller
    // print("abc" + provider.state.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateProvider"),
      ),
      body: Center(
        child: Text(
          provider.state.toString(),
          style: const TextStyle(fontSize: 62),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // provider.state++; // no recommend
          final provider = context.read(counterProvider);
          provider.state++;
        },
      ),
    );
  }
}
