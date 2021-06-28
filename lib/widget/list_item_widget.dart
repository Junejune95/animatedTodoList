import 'package:animatedTodoList/model/list_item.dart';
import 'package:flutter/material.dart';

class RotateListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const RotateListItemWidget({
    Key key,
    @required this.item,
    @required this.animation,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      key: ValueKey(item.urlImage),
      turns: animation,
      child: buildItem(),
    );
  }

  // SlideTransition(
  //     key: ValueKey(item.urlImage),
  //     position: Tween<Offset>(
  //       begin: const Offset(-1, 0),
  //       end: Offset(0, 0),
  //     ).animate(CurvedAnimation(
  //         parent: animation,
  //         curve: Curves.bounceIn,
  //         reverseCurve: Curves.bounceOut)),
  //     child: buildItem(),
  //   );

  // SlideTransition(
  //     key: ValueKey(item.urlImage),
  //     position: Tween<Offset>(
  //       begin: const Offset(-1, 0),
  //       end: Offset(0, 0),
  //     ).animate(animation),
  //     child: buildItem(),
  //   );

  Widget buildItem() => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
          ),
          title: Text(
            item.title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            onPressed: onClicked,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      );
}

class SideListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const SideListItemWidget({
    Key key,
    @required this.item,
    @required this.animation,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      key: ValueKey(item.urlImage),
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut)),
      child: buildItem(),
    );
  }

  Widget buildItem() => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
          ),
          title: Text(
            item.title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            onPressed: onClicked,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      );
}

class SizeListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const SizeListItemWidget({
    Key key,
    @required this.item,
    @required this.animation,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(item.urlImage),
      sizeFactor: animation,
      child: buildItem(),
    );
  }

  Widget buildItem() => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(item.urlImage),
          ),
          title: Text(
            item.title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            onPressed: onClicked,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      );
}
