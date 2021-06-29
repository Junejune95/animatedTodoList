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
      
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Animation List'),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Rotate'),
                ),
                Tab(
                  child: Text('Slide'),
                ),
                Tab(
                  child: Text('Size'),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              RotatePage(),
              SlidePage(),
              SizePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class RotatePage extends StatefulWidget {
  RotatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RotatePage> {
  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => RotateListItemWidget(
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
      (context, animation) => RotateListItemWidget(
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

class SlidePage extends StatefulWidget {
  SlidePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => SideListItemWidget(
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
      (context, animation) => SideListItemWidget(
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

class SizePage extends StatefulWidget {
  SizePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SizePageState createState() => _SizePageState();
}

class _SizePageState extends State<SizePage> {
  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<ListItem> items = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => SizeListItemWidget(
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
      (context, animation) => SizeListItemWidget(
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
