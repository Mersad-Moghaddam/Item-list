import 'package:custom_container/data/data.dart';
import 'package:custom_container/home/bloc/item_bloc.dart';
import 'package:custom_container/home/bloc/item_event.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/home/widgets/my_items.dart';
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
          body: ShowItem(
            state: state,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Restore items',
            child: const Icon(Icons.restore),
          ),
        );
      },
    );
  }
}

class ShowItem extends StatelessWidget {
  final ItemState state;
  const ShowItem({
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
