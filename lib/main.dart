import 'package:animatedTodoList/data/list_item.dart';
import 'package:animatedTodoList/widget/list_item_widget.dart';
import 'package:flutter/material.dart';

import 'model/list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Animated List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
          item: items[index],
          animation: animation,
          onClicked: () {
            removeItem(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: insertItem,
      ),
    );
  }

  void insertItem() {
    int newIndex = 1;
    ListItem newItem = (List.of(listItems)..shuffle()).first;

    items.insert(newIndex, newItem);
    listKey.currentState.insertItem(newIndex,
        duration: Duration(
          milliseconds: 600,
        ));
  }

  void removeItem(index) {
    final removeItem = items[index];

    items.removeAt(index);
    listKey.currentState.removeItem(
      index,
      (context, animation) => ListItemWidget(
        item: removeItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(
        milliseconds: 600,
      ),
    );
  }
}
