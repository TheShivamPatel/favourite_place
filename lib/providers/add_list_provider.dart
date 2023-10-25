import 'dart:io';

import 'package:favourite_place/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceNotifier extends StateNotifier<List<PlaceModel>> {
  PlaceNotifier() : super([]);

  void addPlace(String title, File image, String location) {
    final newPlace = PlaceModel(title: title, image: image, location: location);
    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<PlaceNotifier, List<PlaceModel>>(
  (ref) {
    return PlaceNotifier();
  },
);
