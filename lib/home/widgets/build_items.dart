import 'package:custom_container/data/data.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/home/widgets/my_items.dart';
import 'package:flutter/material.dart';

class BuildItems extends StatelessWidget {
  final ItemState state;
  final Map<String, ValueNotifier<Item>> _itemNotifiers = {};

  BuildItems({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        final itemNotifier =
            _itemNotifiers[item.key.toString()] ??= ValueNotifier(item);
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
