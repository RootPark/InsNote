import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'intro_page.dart';
import 'my_page.dart';
import 'feed_page.dart';

void main() => runApp(Intro());
//late ScrollController _scrollController;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.amberAccent,
        ),
      ),
      home: const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

  @override
  void initState(){
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
    //_scrollController = ScrollController();
  }

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Inspiriation Note'),
      ),
      resizeToAvoidBottomInset: true,//keyboard control
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          itemIconColor: Colors.grey,
          itemTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.yellow,
            fontSize: 10.0,
          ),
        ),
        onSelectItem: (index) => _onItemTapped(index),
        sheetChild: Column(
          children: <Widget>[
            Padding(
              child:
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.lightbulb),
                    hintText: 'Key Word',
                    labelText: 'Key Word',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    )
                ),
                onSaved: (value){
                  print("Key world onSaved:$value");
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter some Key word";
                  }
                  return null;
                },
                onFieldSubmitted: (value){
                  print('submitted:$value');
                },
              ),
              padding: EdgeInsets.zero,
            ),
            Padding(
              child:
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.notes_outlined),
                    hintText: 'Detail Note',
                    labelText: 'Detail Note',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    )
                ),
                onSaved: (value){
                  print("Detail Note onSaved:$value");
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter some Detail note";
                  }
                  return null;
                },
                onFieldSubmitted: (value){
                  print('submitted:$value');
                },
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
          ],
        ),
        items: const [

          BottomBarWithSheetItem(icon: Icons.sticky_note_2_outlined),
          BottomBarWithSheetItem(icon: Icons.settings),

        ],
      ),
    );
  }
}
