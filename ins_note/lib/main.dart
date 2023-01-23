import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'intro_page.dart';
import 'my_page.dart';
import 'feed_page.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:flutter/services.dart';
import 'package:filter_list/filter_list.dart';


void main() => runApp(Intro());
//late ScrollController _scrollController;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RIDIBatang',
        iconTheme: const IconThemeData(
          color: Colors.amber,
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

  List<User>? selectedUserList = [];

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
      resizeToAvoidBottomInset: false,//keyboard control
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
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
              //TODO fix taglist error
                padding:EdgeInsets.zero

            ),
            Padding(
              child:
              TextFormField(
                maxLines: 1,
                maxLength: 30,
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
                maxLines: 5,
                maxLength: 100,
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

class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}

List<User> userList = [
  User(name: "사업"),
  User(name: "공부"),
];