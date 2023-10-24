import 'package:favourite_place/models/place_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        if (places.isEmpty) {
          return const Center(
            child: Text(
              'No places added yet',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }
        return InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        );
      },
    );
  }
}
