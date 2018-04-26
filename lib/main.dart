import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
          //body: CustomScrollViewComponent(),
          body: DesignComponents()
        //body: ListViewWidget(),
        //body: DrawerDemo(),


      ),
    );
  }
}

class DesignComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView.builder(itemCount: 1,

        itemBuilder: (context, rowNumber) {
          return new Container(
            padding: EdgeInsets.all(16.0),
            child: new Column(children: <Widget>[

              new Image.network(
                  "https://flutter.io/images/flutter-mark-square-100.png"),
              new SizedBox(height: 16.0,),
              new Text("Fun with Flutter",
                  style: new TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0
                  )
              ),

              new SizedBox(height: 16.0,),
              /*new Radio(key: Key("radio"),),
              new SizedBox(height: 16.0,),
              new Checkbox(value: true,
                onChanged: null,
                key: Key("checkbox"),),
              new SizedBox(height: 16.0,),*/
              new MaterialButton(
                  child:const Text('SHOW CUSTOM SCROLLVIEW'),
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new CustomScrollViewComponent()),
                    );

                  }),
              new SizedBox(height: 16.0,),
              new MaterialButton(
                  child:const Text('SHOW DRAWER'),
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new DrawerDemo()),
                    );
                  }),
              new SizedBox(height: 16.0,),
              new MaterialButton(
                  child:const Text('SHOW LIST'),
                  color: Colors.blue,
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new ListViewDemo()),
                    );
                  }),
              new SizedBox(height: 16.0,),
              new MaterialButton(
                  child:const Text('SHOW SNACKBAR'),
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text('You pressed Material button', style: new TextStyle(fontSize: 16.0),),
                      backgroundColor: Colors.blue,
                    ));
                  }),
              new SizedBox(height: 16.0,),
              new MaterialButton(
                  child:const Text('SHOW TABS'),
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new TabsDemo()),
                    );
                  }),
              new SizedBox(height: 16.0,),
              new MaterialButton(
                  child: const Text('SHOW BOTTOM SHEET'),
                  elevation: 5.0,
                  height: 48.0,
                  minWidth: 250.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                      return new Container(
                          padding: const EdgeInsets.all(16.0),
                          height: 300.0,
                          color: Colors.white,
                          child: new Column(children: <Widget>[
                            new Text('Avengers are here!!!',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    color: Colors.blue,
                                    fontSize: 24.0
                                )
                            ),
                            new SizedBox(height: 16.0,),
                            new Image.network("http://cdn.wegotthiscovered.com/wp-content/uploads/2018/02/Avengers-Infinity-War-Comic-Con-1.jpg")
                          ])
                      );
                    });
                  }
              ),
            ],),
          );
        }
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
            maxCrossAxisExtent: 300.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * ((index+1) % 21)],
                child: new Text('grid item $index',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,

                ),

              );
            },
            childCount: 8,
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * ((index+1) % 21)],
                child: new Text('list item $index',
                  style: TextStyle(fontSize: 16.0),
                ),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }

}

class ListViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List Demo',
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text('List Demo'),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              alignment: Alignment.centerLeft,
              tooltip: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ),
        body: ListViewWidget(),
      ),
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

const String _kAsset0 = 'shrine/vendors/zach.jpg';
const String _kAsset1 = 'shrine/vendors/16c477b.jpg';
const String _kAsset2 = 'shrine/vendors/sandra-adams.jpg';
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class DrawerDemo extends StatefulWidget {
  static const String routeName = '/material/drawer';

  @override
  _DrawerDemoState createState() => new _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const List<String> _drawerContents = const <String>[
    'A', 'B', 'C', 'D', 'E',
  ];

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = new CurvedAnimation(
      parent: new ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = new Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: const Text("The drawer's items don't do anything")
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(_backIcon()),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Navigation drawer'),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text('Chetan Bhalerao'),
              accountEmail: const Text('chetan.bhalerao@go-jek.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: const AssetImage(
                  _kAsset0,
                  package: _kGalleryAssetsPackage,
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () {
                    _onOtherAccountsTap(context);
                  },
                  child: new Semantics(
                    label: 'Switch to Account B',
                    child: const CircleAvatar(
                      backgroundImage: const AssetImage(
                        _kAsset1,
                        package: _kGalleryAssetsPackage,
                      ),
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    _onOtherAccountsTap(context);
                  },
                  child: new Semantics(
                    label: 'Switch to Account C',
                    child: const CircleAvatar(
                      backgroundImage: const AssetImage(
                        _kAsset2,
                        package: _kGalleryAssetsPackage,
                      ),
                    ),
                  ),
                ),
              ],
              margin: EdgeInsets.zero,
              onDetailsPressed: () {
                _showDrawerContents = !_showDrawerContents;
                if (_showDrawerContents)
                  _controller.reverse();
                else
                  _controller.forward();
              },
            ),
            new MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: new Expanded(
                child: new ListView(
                  padding: const EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        // The initial contents of the drawer.
                        new FadeTransition(
                          opacity: _drawerContentsOpacity,
                          child: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: _drawerContents.map((String id) {
                              return new ListTile(
                                leading: new CircleAvatar(child: new Text(id)),
                                title: new Text('Drawer item $id'),
                                onTap: _showNotImplementedMessage,
                              );
                            }).toList(),
                          ),
                        ),
                        // The drawer's "details" view.
                        new SlideTransition(
                          position: _drawerDetailsPosition,
                          child: new FadeTransition(
                            opacity: new ReverseAnimation(_drawerContentsOpacity),
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                new ListTile(
                                  leading: const Icon(Icons.add),
                                  title: const Text('Add account'),
                                  onTap: _showNotImplementedMessage,
                                ),
                                new ListTile(
                                  leading: const Icon(Icons.settings),
                                  title: const Text('Manage accounts'),
                                  onTap: _showNotImplementedMessage,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: const AssetImage(
                      _kAsset0,
                      package: _kGalleryAssetsPackage,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text('Tap here to open the drawer',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onOtherAccountsTap(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('Account switching not implemented.'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class _Page {
  _Page({ this.label });
  final String label;
  String get id => label[0];
  @override
  String toString() => '$runtimeType("$label")';
}

class _CardData {
  const _CardData({ this.title, this.imageAsset, this.imageAssetPackage });
  final String title;
  final String imageAsset;
  final String imageAssetPackage;
}

final Map<_Page, List<_CardData>> _allPages = <_Page, List<_CardData>>{
  new _Page(label: 'LEFT'): <_CardData>[
    const _CardData(
      title: 'Captain America',
      imageAsset: 'shrine/products/radio.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Iron Man',
      imageAsset: 'shrine/products/sunnies.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Black Panther',
      imageAsset: 'shrine/products/clock.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Hulk',
      imageAsset: 'shrine/products/popsicle.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Thor',
      imageAsset: 'shrine/products/lawn_chair.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Hawkeye',
      imageAsset: 'shrine/products/chair.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Ant Man',
      imageAsset: 'shrine/products/binoculars.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Captain Marvel',
      imageAsset: 'shrine/products/teapot.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Spider man',
      imageAsset: 'shrine/products/chucks.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
  new _Page(label: 'RIGHT'): <_CardData>[
    const _CardData(
      title: 'Doctor Strange',
      imageAsset: 'shrine/products/beachball.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'Nick Fury',
      imageAsset: 'shrine/products/brush.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
    const _CardData(
      title: 'The Mighty Chetan',
      imageAsset: 'shrine/products/fish_bowl.png',
      imageAssetPackage: _kGalleryAssetsPackage,
    ),
  ],
};

class _CardDataItem extends StatelessWidget {
  const _CardDataItem({ this.page, this.data });

  static const double height = 272.0;
  final _Page page;
  final _CardData data;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Align(
              alignment: page.id == 'L'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: new CircleAvatar(child: new Text('${page.id}')),
            ),
            new SizedBox(
              width: 144.0,
              height: 144.0,
              child: new Image.asset(
                data.imageAsset,
                package: data.imageAssetPackage,
                fit: BoxFit.contain,
              ),
            ),
            new Center(
              child: new Text(
                data.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabsDemo extends StatelessWidget {
  static const String routeName = '/material/tabs';

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: _allPages.length,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: new SliverAppBar(
                  title: const Text('Tabs and scrolling'),
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: new TabBar(
                    tabs: _allPages.keys.map(
                          (_Page page) => new Tab(text: page.label),
                    ).toList(),
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: _allPages.keys.map((_Page page) {
              return new SafeArea(
                top: false,
                bottom: false,
                child: new Builder(
                  builder: (BuildContext context) {
                    return new CustomScrollView(
                      key: new PageStorageKey<_Page>(page),
                      slivers: <Widget>[
                        new SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          sliver: new SliverFixedExtentList(
                            itemExtent: _CardDataItem.height,
                            delegate: new SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                final _CardData data = _allPages[page][index];
                                return new Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: new _CardDataItem(
                                    page: page,
                                    data: data,
                                  ),
                                );
                              },
                              childCount: _allPages[page].length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}