import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>((ref) {
  return Stream.periodic(
      const Duration(milliseconds: 400), (count) => "$count");
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamProviderPage"),
      ),
      body: Center(
        child: buildStreamWhen(watch),
        // buildStreamBuilder(watch),
      ),
    );
  }

  Widget buildStreamWhen(watch) {
    final stream = watch(streamProvider);
    return stream.when(
      data: (value) => Text(value.toString()),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => const Text('Oops'),
    );
    // print(stream);
    // return StreamBuilder<String>(
    //   builder: (context, snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.waiting:
    //         return CircularProgressIndicator();
    //       default:
    //         if (snapshot.hasError) {
    //           return Text("Error: ${snapshot.error}");
    //         } else {
    //           return Text(snapshot.data.toString());
    //         }
    //     }
    //   },
    //   stream: stream,
    // );
  }
}
