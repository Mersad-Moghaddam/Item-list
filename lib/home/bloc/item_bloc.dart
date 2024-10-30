import 'package:custom_container/home/bloc/item_event.dart';
import 'package:custom_container/home/bloc/item_state.dart';
import 'package:custom_container/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final List<Item> _deletedItems = [];

  ItemBloc() : super(ItemState(items: items)) {
    _onEvent();
  }

  void _onEvent() {
    on<RemoveItemEvent>(_onRemoveItemEvent);
    on<RestoreItemsEvent>(_onRestoreItemsEvent);
    on<IncreaseQuantityEvent>(_onIncreaseQuantityEvent);
    on<DecreaseQuantityEvent>(_onDecreaseQuantityEvent);
  }

  /// Handles [RemoveItemEvent] by adding the item to the list of deleted items
  /// and removing it from the list of items in the state.
  void _onRemoveItemEvent(RemoveItemEvent event, Emitter<ItemState> emit) {
    List<Item> items = state.items;
    int index = items.indexWhere((item) => item == event.item);
    if (index != -1) {
      _deletedItems.add(event.item);
      items.remove(event.item);
      emit(state.copyWith(items: items));
    }
  }

  /// Handles [RestoreItemsEvent] by restoring all deleted items to the current
  /// list of items in the state and clearing the deleted items list.
  void _onRestoreItemsEvent(RestoreItemsEvent event, Emitter<ItemState> emit) {
    List<Item> items = _deletedItems + state.items;
    _deletedItems.clear();
    emit(state.copyWith(items: items));
  }

  /// Handles [IncreaseQuantityEvent] by increasing the quantity of the item
  /// in the state that matches the item in the event. If no matching item is
  /// found, the state is not changed.
  void _onIncreaseQuantityEvent(
      IncreaseQuantityEvent event, Emitter<ItemState> emit) {
    List<Item> items = state.items;
    int index = items.indexWhere((item) => item == event.item);
    if (index != -1) {
      items[index].quantity++;
      emit(state.copyWith(items: items));
    }
  }

  /// Handles [DecreaseQuantityEvent] by decreasing the quantity of the item
  /// in the state that matches the item in the event. If no matching item is
  /// found, the state is not changed.
  void _onDecreaseQuantityEvent(
      DecreaseQuantityEvent event, Emitter<ItemState> emit) {
    List<Item> items = state.items;
    int index = items.indexWhere((item) => item == event.item);
    if (index != -1) {
      items[index].quantity--;
      emit(state.copyWith(items: items));
    }
  }
}
