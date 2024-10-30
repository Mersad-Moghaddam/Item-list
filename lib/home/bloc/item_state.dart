import 'package:custom_container/data/data.dart';

class ItemState {
  final List<Item> items;

  ItemState({required this.items});

  /// Returns a new instance of [ItemState] with the given properties
  /// replaced. If no properties are provided, the current properties
  /// are used.
  ///
  /// [items] - an optional list of [Item] objects to replace the current
  /// list of items in the state.
  ItemState copyWith({List<Item>? items}) {
    return ItemState(items: items ?? this.items);
  }
}
