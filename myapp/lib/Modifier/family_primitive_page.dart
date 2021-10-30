import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/Modifier/user_helper.dart';
import 'package:myapp/widget/user_widget.dart';

Future<User> fetchUser(String username) async {
  await Future.delayed(const Duration(milliseconds: 400));
  return users.firstWhere((element) => element.name == username);
}

final userProvider =
    FutureProvider.autoDispose.family<User, String>((ref, username) async {
  return fetchUser(username);
});

class FamilyPrimitivePage extends StatefulWidget {
  const FamilyPrimitivePage({Key? key}) : super(key: key);

  @override
  _FamilyPrimitivePageState createState() => _FamilyPrimitivePageState();
}

class _FamilyPrimitivePageState extends State<FamilyPrimitivePage> {
  String username = users.first.name; // user name thằng đầu tiên
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FamilyPrimitivePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              child: Consumer(
                builder: (context, watch, child) {
                  final future = watch(userProvider(username));
                  return future.when(
                    data: (user) => UserWidget(user: user),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text("error $error"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            buildSearch(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildUsernameDropdown(),
          ],
        ),
      );

  Widget buildUsernameDropdown() => Row(
        children: [
          const Text(
            'Username',
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          DropdownButton<String>(
            value: username,
            iconSize: 32,
            style: const TextStyle(fontSize: 24, color: Colors.black),
            onChanged: (value) => setState(() => username = value!),
            items: users
                .map((user) => user.name)
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          ),
        ],
      );
}
