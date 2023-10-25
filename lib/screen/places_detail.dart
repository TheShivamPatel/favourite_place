import 'package:favourite_place/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
        ),
      ),
      body: Image.file(
        place.image,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
