import 'package:custom_container/data/data.dart';

abstract class ItemEvent {}

class IncreaseQuantityEvent extends ItemEvent {
  final Item item;

  IncreaseQuantityEvent(this.item);
}

class RemoveItemEvent extends ItemEvent {
  final Item item;

  RemoveItemEvent(this.item);
}

class DecreaseQuantityEvent extends ItemEvent {
  final Item item;

  DecreaseQuantityEvent(this.item);
}

class RestoreItemsEvent extends ItemEvent {}
