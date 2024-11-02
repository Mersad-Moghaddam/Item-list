import 'package:custom_container/data/data.dart';
import 'package:custom_container/home/bloc/item_bloc.dart';
import 'package:custom_container/home/bloc/item_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyItems extends StatelessWidget {
  const MyItems({
    super.key,
    required this.item,
  });

  final Item item;

  @override

  /// A widget that displays an item in the list of items.
  ///
  /// This widget contains a [ListTile] with a title, subtitle, and three buttons.
  /// The buttons are add, remove and delete. The buttons are connected to
  /// [ItemBloc] events.
  Widget build(BuildContext context) {
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
        key: ValueKey(item.key),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(item.image)),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<ItemBloc>().add(IncreaseQuantityEvent(item));
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                context.read<ItemBloc>().add(DecreaseQuantityEvent(item));
              },
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.delete_right),
              onPressed: () {
                context.read<ItemBloc>().add(RemoveItemEvent(item));
              },
            ),
          ],
        ),
      ),
    );
  }
}
