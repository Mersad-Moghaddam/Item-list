import 'package:custom_container/home/bloc/item_bloc.dart';
import 'package:custom_container/home/bloc/item_event.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/home/widgets/build_items.dart';
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
          body: BuildItems(state: state),
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
