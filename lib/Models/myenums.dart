import 'package:flutter/material.dart';

enum Roles {
  admin,
  packing,
  cutting,
  agent,
  ranchOwner,
  supervisor,
  truck,
  boss,
  workers,
  bathPeople,
}

enum OrderStatus { pending, delivered, cancelled }

List<DropdownMenuItem<String>> getUserRoleItemsForSingup() {
  List<DropdownMenuItem<String>> dropDownItems = [];

  for (var item in Roles.values) {
    var newDropdown = DropdownMenuItem(
      child: Text(item.name.toString()),
      value: item.name.toString(),
    );

    dropDownItems.add(newDropdown);
  }
  return dropDownItems;
}
