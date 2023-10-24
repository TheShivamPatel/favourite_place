import 'package:uuid/uuid.dart';

var uuid = Uuid();

class PlaceModel{
  PlaceModel({required this.title}) : id = uuid.v4() ;

  final String id;
  final String title;
}