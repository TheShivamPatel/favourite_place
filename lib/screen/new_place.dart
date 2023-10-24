import 'package:favourite_place/models/place_model.dart';
import 'package:favourite_place/providers/add_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlace extends ConsumerWidget {
  const AddNewPlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String _title = '';

    void _addPlace(WidgetRef ref, String title) {
      ref.read(placeProvider.notifier).addPlace(title);
      Navigator.of(context).pop();
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                onChanged: (value) {
                  _title = value.toString();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _addPlace(
                    ref,
                    _title,
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add Place',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
