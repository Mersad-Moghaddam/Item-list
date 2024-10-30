import 'package:custom_container/data/data.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/home/widgets/my_items.dart';
import 'package:flutter/material.dart';

class BuildItems extends StatelessWidget {
  final ItemState state;
  const BuildItems({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final itemNotifiers = state.items
        .map((item) => ValueNotifier(item))
        .toList(); // Create a separate ValueNotifier for each item

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final itemNotifier = itemNotifiers[index];
        return ValueListenableBuilder<Item>(
          valueListenable: itemNotifier,
          builder: (context, item, child) {
            return MyItems(item: item);
          },
        );
      },
    );
  }
}
