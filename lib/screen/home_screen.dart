import 'package:favourite_place/providers/add_list_provider.dart';
import 'package:favourite_place/screen/new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _addNewPlace() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewPlace(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(placeProvider);
    var len = list.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _addNewPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            len.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
