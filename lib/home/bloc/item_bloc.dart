import 'package:custom_container/home/bloc/item_event.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final List<Item> _deletedItems = [];
  ItemBloc() : super(ItemState.initial()) {
    on<AddItemEvent>((event, emit) {
      List<Item> items = state.items;
      items.add(event.item);
      emit(state.copyWith(items: items));
    });
    on<RemoveItemEvent>((event, emit) {
      List<Item> items = state.items;
      _deletedItems.add(event.item);
      items.remove(event.item);
      emit(state.copyWith(items: items));
    });
    on<RestoreItemsEvent>((event, emit) {
      List<Item> items = _deletedItems + state.items;
      _deletedItems.clear();
      emit(state.copyWith(items: items));
    });
    on<IncreaseQuantityEvent>((event, emit) {
      List<Item> items = state.items;
      int index = items.indexWhere((item) => item == event.item);
      if (index != -1) {
        items[index].quantity++;
        emit(state.copyWith(items: items));
      }
    });
    on<DecreaseQuantityEvent>((event, emit) {
      List<Item> items = state.items;
      int index = items.indexWhere((item) => item == event.item);
      if (index != -1) {
        items[index].quantity--;
        emit(state.copyWith(items: items));
      }
      if (items[index].quantity == -1) {
        _deletedItems.add(event.item);
        items.removeAt(index);
        emit(state.copyWith(items: items));
      }
    });
  }
}
