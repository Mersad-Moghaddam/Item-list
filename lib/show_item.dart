import 'package:custom_container/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Without Using Bloc
class ShowItem extends StatefulWidget {
  const ShowItem({super.key});

  @override
  State<ShowItem> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  final List<Item> _items = [
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
  ];
  final List<Item> _removedItems = [];

  @override

  /// Builds the home screen of the application.
  ///
  /// This widget is a [Scaffold] with a white background and a [ListView] of
  /// custom items. Each item is a [Container] with a drop shadow and a
  /// [ListTile] with a title, subtitle, and three buttons: add, remove and
  /// delete. The buttons are connected to [ItemBloc] events.
  ///
  /// There is also a [FloatingActionButton] at the bottom which, when pressed,
  /// triggers a [RestoreItemsEvent] to restore the items to their original
  /// state.
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                _items[index].image,
              ),
            ),
            title: Text(_items[index].title),
            subtitle: Text(_items[index].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _items[index].quantity++;
                    });
                  },
                ),
                Text(_items[index].quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_items[index].quantity > 0) {
                        _items[index].quantity--;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.delete,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      _removedItems.add(_items[index]);
                      _items.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
