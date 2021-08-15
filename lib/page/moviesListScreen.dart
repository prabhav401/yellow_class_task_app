import 'package:flutter/material.dart';
import 'package:google_signin_example/Models/movie.dart';
import 'package:google_signin_example/provider/addedMoviesData.dart';
import 'package:google_signin_example/widget/listRefactoringMovies.dart';

class WatchList extends StatelessWidget {
  final String title = 'AnimatedList';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.addedMovies);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: buildInsertButton(),
            ),
          ],
        ),
      );

  Widget buildItem(item, int index, Animation<double> animation) =>
      ShoppingItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );

  // ignore: deprecated_member_use
  Widget buildInsertButton() => RaisedButton(
        child: Text(
          'Insert item',
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.white,
        onPressed: () => insertItem(3, Data.addedMovies.first),
      );

  void insertItem(int index, Movie item) {
    items.insert(index, item);
    key.currentState.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }
}