import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new TestApp());

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => new _TestAppState();
}

class _TestAppState extends State<TestApp> with TickerProviderStateMixin {
  int _currentIndex = 0;

  TabController _controller;

  TabBarView _tabBarView;

  BottomNavigationBar _bottomNavigationBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 3, vsync: this);




  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _tabBarView = new TabBarView(

      children: [
        new HomeView(title: "Home"),
        new MessageView(title: "Message"),
        new MeView()
      ],
      controller: _controller,
      physics: new NeverScrollableScrollPhysics(),
    );


    _bottomNavigationBar = new BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
//                _controller.index = index;
            _controller.animateTo(
                index, duration: new Duration(milliseconds: 1),
                curve: Curves.ease);
          });
        },
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('home')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text('message')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle), title: new Text('me'))
        ]);

    return new DefaultTabController(
      length: 3,
      child: new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("keep state test"),
          ),
          bottomNavigationBar: _bottomNavigationBar,
          body: _tabBarView,
        ),

      ),
    );
  }

  Widget _buildContent() {
    if (_currentIndex == 0) {
      return new HomeView(title: "home");
    }

    return new MessageView(title: "message");
  }
}

class HomeView extends StatefulWidget {
  final String title;

  HomeView({@required this.title});

  @override
  _BodyViewState createState() => new _BodyViewState();
}

class _BodyViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 100,
        itemBuilder: (_, position) {
          return new ListTile(
            title: new Text('${widget.title} $position'),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('HomeView dispose');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('home view create');
  }
}

class MessageView extends StatefulWidget {
  final String title;

  MessageView({@required this.title});

  @override
  _MessageViewState createState() => new _MessageViewState();
}

class _MessageViewState extends State<MessageView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 100,
        itemBuilder: (_, position) {
          return new ListTile(
            title: new Text('${widget.title} $position'),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('message view dispose');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('message view create');
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}

class MeView extends StatefulWidget {
  @override
  _MeViewState createState() => new _MeViewState();
}

class _MeViewState extends State<MeView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
//    TabController tabController = new TabController(length: 3, vsync: this);

    return new ListView.builder(
        itemCount: 100,
        itemBuilder: (_, position) {
          return new ListTile(
            title: new Text('me $position'),
          );
        });

//    return  new DefaultTabController(
//      length: 3,
//      child: new Scaffold(
//        appBar: new AppBar(
//          title: new Column(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              new TabBar(
//                tabs: [
//                  new Tab(text: 'aaa',),
//                  new Tab(text: 'bbb',),
//                  new Tab(text: 'ccc',),
//                ],
//
//              ),
//            ],
//          ),
//          titleSpacing: .0,
//          elevation: 0.0,
//        ),
//        body: new TabBarView(
//          children: [
//            new Icon(Icons.directions_car),
//            new Icon(Icons.directions_transit),
//            new Icon(Icons.directions_bike),
//          ],
//        ),
//      ),
//    );

//  return new DefaultTabController(
//    length: 2,
//    child: new Scaffold(
//      appBar: new AppBar(
//        bottom: new TabBar(tabs: [
//          new Text('aaa'),
//          new Text('bbb'),
//          new Text('ccc')
//        ]),
//      ),
//    ),
//  );

//    return new DefaultTabController(
//
//
//      length: 3,
//      child: new Column(
//        children: <Widget>[
//          new TabBar(
//            tabs: [
//              new Text('aaa'),
//              new Text('bbb'),
//              new Text('ccc')
//            ],
//            labelColor: Colors.white,
//            labelStyle: Theme
//                .of(context)
//                .textTheme
//                .subhead,
////            indicatorPadding: new EdgeInsets.all(12.0),
//          ),
//          new Flexible(child: new TabBarView(children: [
//            new ListView.builder(
//                itemCount: 100,
//                itemBuilder: (_, position) {
//                  return new ListTile(
//                    title: new Text('me $position'),
//                  );
//                }),
//            new ListView.builder(
//                itemCount: 100,
//                itemBuilder: (_, position) {
//                  return new ListTile(
//                    title: new Text('me $position'),
//                  );
//                }),
//            new ListView.builder(
//                itemCount: 100,
//                itemBuilder: (_, position) {
//                  return new ListTile(
//                    title: new Text('me $position'),
//                  );
//                }),
//          ]))
//        ],
//      ),
//    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('me view create');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('me view dispose');
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}




