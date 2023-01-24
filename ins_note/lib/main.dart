import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'intro_page.dart';
import 'my_page.dart';
import 'feed_page.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:flutter/services.dart';
// import 'package:filter_list/filter_list.dart';

bool isPressed1 = false;
bool isPressed2 = false;
bool isPressed3 = false;
String keyWord = '';
String detail = '';

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

//Bottom Bar 관련
class _MyHomePageState extends State<MyHomePage> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  final _formKey = GlobalKey<FormState>();
  List<User>? selectedUserList = [];

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();

    //_scrollController = ScrollController();
  }

  int _selectedIndex = 0;

  //자동으로 FeedPage()로 이동하는거같은데 default값으로
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
      resizeToAvoidBottomInset: false, //keyboard control
      body: Form(
        key: _formKey,
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
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            child: Text('test'),
                            onPressed: () =>
                                setState(() => isPressed1 = !isPressed1),
                            style: ElevatedButton.styleFrom(
                                primary: isPressed1
                                    ? Colors.lightGreen
                                    : Colors.green,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0))))),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          child: Text('test'),
                          onPressed: () =>
                              setState(() => isPressed2 = !isPressed2),
                          style: ElevatedButton.styleFrom(
                              primary:
                                  isPressed2 ? Colors.lightBlue : Colors.blue,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0))),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          child: Text('test'),
                          onPressed: () =>
                              setState(() => isPressed3 = !isPressed3),
                          style: ElevatedButton.styleFrom(
                              primary: isPressed3 ? Colors.grey : Colors.black,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0))),
                        )),
                  ],
                ),
                padding: EdgeInsets.zero),
            Padding(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                maxLines: 1,
                maxLength: 30,
                decoration: const InputDecoration(
                    icon: Icon(Icons.lightbulb),
                    hintText: 'Key Word',
                    labelText: 'Key Word',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    )),
                onSaved: (value) {
                  setState((){
                    keyWord = value as String;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter some Key word";
                  }
                  return null;
                },

                //value 가 key word 데이터
                onFieldSubmitted: (value) {
                  setState(() {
                    keyWord = value as String;
                  });
                },
              ),
              padding: EdgeInsets.zero,
            ),
            Padding(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                maxLines: 1,
                maxLength: 100,
                decoration: const InputDecoration(
                    icon: Icon(Icons.notes_outlined),
                    hintText: 'Detail Note',
                    labelText: 'Detail Note',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    )),
                onSaved: (value) {
                  print("Detail Note onSaved:$value");
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter some Detail note";
                  }
                  return null;
                },
                //value가 detail note 데이터
                onFieldSubmitted: (value){
                  setState(() {
                    detail = value as String;
                  });
                },
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: ElevatedButton(
                child: Text("Add"),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    print(isPressed1);
                    print(isPressed2);
                    print(isPressed3);
                    print(keyWord);
                    print(detail);
                  }
                },
                    //()=>onBtnClick(),
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            )
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
