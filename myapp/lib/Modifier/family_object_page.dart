import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/Modifier/user_helper.dart';
import 'package:myapp/widget/user_widget.dart';

class UserRequest {
  final bool isFemale;
  final int minAge;

  UserRequest({
    required this.isFemale,
    required this.minAge,
  });

  UserRequest copyWith({
    bool? isFemale,
    int? minAge,
  }) {
    return UserRequest(
      isFemale: isFemale ?? this.isFemale,
      minAge: minAge ?? this.minAge,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRequest &&
        other.isFemale == isFemale &&
        other.minAge == minAge;
  }

  @override
  int get hashCode => isFemale.hashCode ^ minAge.hashCode;
}

Future<User> fetchUser(UserRequest request) async {
  await Future.delayed(const Duration(milliseconds: 400));
  final gender = request.isFemale ? "female" : "male";
  return users.firstWhere(
      (element) => element.gender == gender && element.age >= request.minAge);
}

final userProvider =
    FutureProvider.family<User, UserRequest>((ref, userRequest) async {
  return fetchUser(userRequest);
});

class FamilyObjectPage extends StatefulWidget {
  const FamilyObjectPage({Key? key}) : super(key: key);

  @override
  _FamilyObjectPageState createState() => _FamilyObjectPageState();
}

class _FamilyObjectPageState extends State<FamilyObjectPage> {
  static final ages = [18, 25, 30, 40];
  bool isFemale = true;
  int minAge = ages.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FamilyObjectPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Consumer(
                builder: (context, watch, child) {
                  final userRequest =
                      UserRequest(isFemale: isFemale, minAge: minAge);
                  final future = watch(userProvider(userRequest));
                  return future.when(
                    data: (value) => UserWidget(
                      user: value,
                    ),
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
            const SizedBox(
              height: 32,
            ),
            buildSearch()
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
            buildGenderSwitch(),
            const SizedBox(height: 16),
            buildAgeDropdown(),
          ],
        ),
      );

  Widget buildGenderSwitch() => Row(
        children: [
          const Text(
            'Female',
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          CupertinoSwitch(
            value: isFemale,
            onChanged: (value) => setState(() => isFemale = value),
          ),
        ],
      );

  Widget buildAgeDropdown() => Row(
        children: [
          const Text(
            'Age',
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          DropdownButton<int>(
            value: minAge,
            iconSize: 32,
            style: const TextStyle(fontSize: 24, color: Colors.black),
            onChanged: (value) => setState(() => minAge = value!),
            items: ages
                .map<DropdownMenuItem<int>>(
                    (int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value years old'),
                        ))
                .toList(),
          ),
        ],
      );
}
