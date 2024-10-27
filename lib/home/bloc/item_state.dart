import 'package:custom_container/data/data.dart';

class ItemState {
  final List<Item> items;

  ItemState({required this.items});

  factory ItemState.initial() => ItemState(items: [
        Item(
          image: 'assets/images/Air2.jpg',
          title: 'Item 1',
          description: 'This is item 1',
        ),
        Item(
          image: 'assets/images/AirJordan.jpg',
          title: 'Item 2',
          description: 'This is item 2',
        ),
        Item(
          image: 'assets/images/Airjordan2.jpg',
          title: 'Item 3',
          description: 'This is item 3',
        ),
        Item(
          image: 'assets/images/five.jpg',
          title: 'Item 4',
          description: 'This is item 4',
        ),
        Item(
          image: 'assets/images/nine.jpg',
          title: 'Item 5',
          description: 'This is item 5',
        ),
        Item(
          image: 'assets/images/seven.jpg',
          title: 'Item 6',
          description: 'This is item 6',
        ),
        Item(
          image: 'assets/images/six.jpg',
          title: 'Item 7',
          description: 'This is item 7',
        ),
        Item(
          image: 'assets/images/ten.jpg',
          title: 'Item 8',
          description: 'This is item 8',
        ),
        Item(
          image: 'assets/images/running2.jpg',
          title: 'Item 9',
          description: 'This is item 9',
        ),
        Item(
          image: 'assets/images/five.jpg',
          title: 'Item 10',
          description: 'This is item 10',
        ),
      ]);

  /// Creates a new [ItemState] with the given [items].
  ///
  /// If [items] is null, then the current [items] are used.
  ///
  /// This is useful for creating a new state that is a copy of the current state
  /// but with some changes. For example, if you want to add a new item:
  ///
  ///
  ItemState copyWith({List<Item>? items}) =>
      ItemState(items: items ?? this.items);
}
