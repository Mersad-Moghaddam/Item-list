import 'package:custom_container/data/data.dart';

class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final Item item;

  AddItemEvent(this.item);
}

class RemoveItemEvent extends ItemEvent {
  final Item item;

  RemoveItemEvent(this.item);
}

class RestoreItemsEvent extends ItemEvent {}

class IncreaseQuantityEvent extends ItemEvent {
  final Item item;

  IncreaseQuantityEvent(this.item);
}

class DecreaseQuantityEvent extends ItemEvent {
  final Item item;

  DecreaseQuantityEvent(this.item);
}
