import 'dart:io';

import 'package:uuid/uuid.dart';

var uuid = Uuid();

class PlaceModel{
  PlaceModel({required this.title, required this.image, required this.location}) : id = uuid.v4() ;

  final String id;
  final String title;
  final File image;
  final String location;
}