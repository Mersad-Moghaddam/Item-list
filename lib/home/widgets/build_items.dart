import 'package:custom_container/data/data.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/home/widgets/my_items.dart';
import 'package:flutter/material.dart';

/// A widget that builds a list of items and optimizes rebuilding by using ValueListenableBuilder.
class BuildItem extends StatefulWidget {
  /// The state of the items to be built.
  final ItemState state;

  /// Creates a new instance of BuildItem.
  const BuildItem({
    required this.state,
    super.key,
  });

  @override
  _BuildItemState createState() => _BuildItemState();
}

/// The state of the BuildItem widget.
class _BuildItemState extends State<BuildItem> {
  final List<ValueNotifier<Item>> itemNotifiers = [];

  @override

  /// Initializes the state of the widget.
  ///
  /// This is called when the widget is inserted into the tree.
  /// It initializes the list of ValueNotifiers for the items
  /// to be built, and adds a ValueNotifier for each item
  /// in the state of the widget.
  void initState() {
    super.initState();
    for (var item in widget.state.items) {
      itemNotifiers.add(ValueNotifier(item));
    }
  }

  @override

  /// Builds a ListView of MyItems widgets.
  ///
  /// Each MyItems widget is wrapped in a ValueListenableBuilder that listens to a
  /// ValueNotifier for each item. This allows the MyItems widget to be rebuilt
  /// only when the item being displayed changes.
  ///
  /// The number of items in the list is determined by the number of items in the
  /// state passed to the constructor.
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.items.length,
      itemBuilder: (context, index) {
        final itemNotifier = itemNotifiers[index];
        return ValueListenableBuilder(
          valueListenable: itemNotifier,
          builder: (context, item, child) {
            return MyItems(item: item);
          },
        );
      },
    );
  }
}
