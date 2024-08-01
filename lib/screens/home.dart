import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:faker/faker.dart';
import '../widgets/bigcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class MyHomeState extends ChangeNotifier {
  var current = '${Faker().person.firstName()} ${Faker().person.lastName()}';
  var favorites = <String>[];

  void getNext() {
    current = '${Faker().person.firstName()} ${Faker().person.lastName()}';
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(String name) {
    favorites.remove(name);
    notifyListeners();
  }

  void clearFavorites() {
    favorites.clear();
    notifyListeners();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<MyHomeState>(
        builder: (context, appState, child) {
          final name = appState.current;
          IconData icon = appState.favorites.contains(name)
              ? Icons.favorite
              : Icons.favorite_border;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('A Random NAME',
                style: TextStyle(
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
              ),
              BigCard(pair: name),
              const Gap(10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: appState.getNext,
                    child: const Text('Change'),
                  ),
                  const Gap(10),
                  ElevatedButton.icon(
                    onPressed: appState.toggleFavorite,
                    icon: Icon(icon),
                    label: const Text('Like'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
