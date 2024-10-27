import 'package:custom_container/home/bloc/item_bloc.dart';
import 'package:custom_container/home/bloc/item_event.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          body: ListView.builder(
            itemCount: state.items.length,
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
                      child: Image.asset(state.items[index].image)),
                  title: Text(state.items[index].title),
                  subtitle: Text(state.items[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context
                              .read<ItemBloc>()
                              .add(IncreaseQuantityEvent(state.items[index]));
                        },
                      ),
                      Text(state.items[index].quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          context
                              .read<ItemBloc>()
                              .add(DecreaseQuantityEvent(state.items[index]));
                        },
                      ),
                      IconButton(
                        icon: const Icon(CupertinoIcons.delete_right),
                        onPressed: () {
                          context
                              .read<ItemBloc>()
                              .add(RemoveItemEvent(state.items[index]));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ItemBloc>().add(RestoreItemsEvent());
            },
            tooltip: 'Restore items',
            child: const Icon(Icons.restore),
          ),
        );
      },
    );
  }
}
