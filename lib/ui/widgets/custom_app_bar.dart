import 'package:flutter/material.dart';

AppBar appBar(IconButton? iconButton) {
  return AppBar(
    leading: iconButton,
    actions: [
      CircleAvatar(backgroundImage: AssetImage('images/person.jpeg')),
      SizedBox(width: 10),
    ],
  );
}
