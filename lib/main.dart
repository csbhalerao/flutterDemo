import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
        body: CustomScrollViewComponent(),
        //body: ListViewWidget(),

      ),
    );
  }
}

class CustomScrollViewComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return new CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: const Text('Demo'),
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.teal[100 * (index % 9)],
                  padding: new EdgeInsets.all(4.0),
                  child: new Text('grid item $index',
                      textAlign: TextAlign.left,
                    ),

                );
              },
              childCount: 20,
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 2)],
                  child: new Text('list item $index',
                      ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      );
  }

}

class ListViewWidget extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: 10,
      itemBuilder: (context, rowNumber){
        if (rowNumber % 2 == 0) {
          return new Container(
              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: new Column(
                children: <Widget>[

                  new Image.network(
                      "https://pbs.twimg.com/profile_images/840793600883548160/bQ-4CQqc_400x400.jpg", fit: BoxFit.fill),
                  new SizedBox(height: 16.0,),
                  new Text("Chetan Bhalerao",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  new SizedBox(height: 16.0,),
                  new Divider()
                ],
              ));
        } else {
          return new Container(
              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: new Column(
                children: <Widget>[

                  new Image.network(
                      "https://instagram.fblr2-1.fna.fbcdn.net/vp/3099dda540d7af971305706e648ecfcb/5B985151/t51.2885-15/s750x750/sh0.08/e35/17126544_1397557976967893_647530843165687808_n.jpg"
                  , fit: BoxFit.fill),
                  new SizedBox(height: 16.0,),
                  new Text("Chetan Bhalerao",
                    style: TextStyle(fontSize: 30.0)
                  ),
                  new SizedBox(height: 16.0,),
                  new Divider()
                ],
              ));
        }
      },);
  }

}