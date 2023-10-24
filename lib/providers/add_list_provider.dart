import 'package:favourite_place/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceNotifier extends StateNotifier<List<PlaceModel>> {
  PlaceNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = PlaceModel(title: title);
    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<PlaceNotifier, List<PlaceModel>>(
  (ref) {
    return PlaceNotifier();
  },
);
