import 'package:flutter/material.dart';

class Item {
  String image;
  String title;
  String description;
  int quantity = 0;
  UniqueKey key;

  Item(
      {required this.image,
      required this.title,
      required this.description,
      required this.key});
}

List<Item> items = [
  Item(
    key: UniqueKey(),
    image: 'assets/images/Air2.jpg',
    title: 'Item 1',
    description: 'This is item 1',
  ),
  Item(
    image: 'assets/images/AirJordan.jpg',
    title: 'Item 2',
    description: 'This is item 2',
    key: UniqueKey(),
  ),
  Item(
      image: 'assets/images/Airjordan2.jpg',
      title: 'Item 3',
      description: 'This is item 3',
      key: UniqueKey()),
  Item(
      image: 'assets/images/five.jpg',
      title: 'Item 4',
      description: 'This is item 4',
      key: UniqueKey()),
  Item(
      image: 'assets/images/nine.jpg',
      title: 'Item 5',
      description: 'This is item 5',
      key: UniqueKey()),
  Item(
      image: 'assets/images/seven.jpg',
      title: 'Item 6',
      description: 'This is item 6',
      key: UniqueKey()),
  Item(
      image: 'assets/images/six.jpg',
      title: 'Item 7',
      description: 'This is item 7',
      key: UniqueKey()),
  Item(
      image: 'assets/images/ten.jpg',
      title: 'Item 8',
      description: 'This is item 8',
      key: UniqueKey()),
  Item(
      image: 'assets/images/running2.jpg',
      title: 'Item 9',
      description: 'This is item 9',
      key: UniqueKey()),
  Item(
      image: 'assets/images/five.jpg',
      title: 'Item 10',
      description: 'This is item 10',
      key: UniqueKey()),
];
