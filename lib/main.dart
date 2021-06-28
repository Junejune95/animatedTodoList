import 'package:animatedTodoList/data/list_item.dart';
import 'package:animatedTodoList/model/list_item.dart';
import 'package:animatedTodoList/widget/list_item_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _MainPage(),
    );
  }

  
}

class _MainPage extends StatelessWidget {
  final List<ListItem> items=List.from(listItems);

    @override
    Widget build(BuildContext context) {
      return AnimatedList(
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: (){},
        ),
      );
    }
  }
