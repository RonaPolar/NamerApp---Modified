import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyHomeState>(
      builder: (context, appState, child) {
        if (appState.favorites.isEmpty) {
          return const Center(
            child: Text('No favorites yet.'),
          );
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('You have ${appState.favorites.length} Favorites:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            for (var name in appState.favorites)
              ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(name),
                trailing: IconButton(
                  onPressed: () {
                    appState.removeFavorite(name);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            const Gap(20),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              child: ElevatedButton.icon(
                onPressed: () {
                  appState.clearFavorites();
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete All'),
              ),
            ),
          ],
        );
      },
    );
  }
}
