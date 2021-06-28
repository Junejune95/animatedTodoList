import 'package:animatedTodoList/model/list_item.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const ListItemWidget({Key key,@required this.item, this.animation, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildItem();

  }

  Widget buildItem() => Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(12),
    ),
  );

}