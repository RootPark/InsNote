import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'main.dart';
import 'dart:math';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: OnBoardingPage(),
    );
  }
}


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // textfieldtags widget
  late double _distanceToField;
  late TextfieldTagsController _controller;

  List<Color> colors = [Colors.redAccent, Colors.teal, Colors.green, Colors.grey];
  Random random = Random();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  List<String> _values =[];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MyApp()),
    );
  }


  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/ins_note_logo.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);


    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('ins_note_logo.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            '?????? ?????? ????????? ??????????',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "????????? ??????\n ????????? ????????? ????????? ????????????",
          body:
          "?????? ?????? ????????? ????????? ????????? ????????? ??? ???????????????.",
          image: _buildImage('ins_note_main.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "????????? ?????? ???????????? ???????????????",
          body:
          "???????????? ?????? ????????? ?????? ????????? ???????????? ?????? ??????????????? ?????? ??? ?????????.",
          image: _buildImage('jobs.png',150),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "??????, ?????????, ?????????",
          body:
          "??? ???????????? ???????????? ??????\n???????????? ????????? ?????????, ?????? ???????????? ??????, ????????? ???????????? ?????????.",
          image: _buildImage('ins_note_main.png'),
          decoration: pageDecoration,
        ),PageViewModel(
          title: "????????? ????????? ????????? ????????? ???????????????",
          body:
          "????????? ?????? ????????? ????????? ?????? ??? ??????, ????????? ????????? ????????? ??? ?????????.",
          image: _buildImage('ins_note_main.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
          "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "?????? ????????? ???????????????????",
          bodyWidget: Column(
            children: [
              TextFieldTags(
              textfieldTagsController: _controller,
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              // validator: (String tag) {
              //     if (tag == 'php') {
              //       return 'No, please just no';
              //     } else if (_controller.getTags.contains(tag)) {
              //       return 'you already entered that';
              //     }
              //     return null;
              // },
              inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                        controller: tec,
                        focusNode: fn,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 74, 137, 92),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amber,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          /*helperText: 'Enter language...',
                          helperStyle: const TextStyle(
                            color: Color.fromARGB(255, 74, 137, 92),
                          ),*/
                          hintText: _controller.hasTags ? '' : "????????? ???????????????...",
                          errorText: error,
                          prefixIconConstraints:
                              BoxConstraints(maxWidth: _distanceToField * 0.74),
                          prefixIcon: tags.isNotEmpty
                              ? SingleChildScrollView(
                                  controller: sc,
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: tags.map((String tag) {
                                        int cindex = random.nextInt(colors.length);
                                        Color tempcol = colors[cindex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                        //TODO ?????? ?????? ??????
                                        color: tempcol,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              '#$tag',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onTap: () {
                                              print("$tag selected");
                                            },
                                          ),
                                          const SizedBox(width: 4.0),
                                          InkWell(
                                            child: const Icon(
                                              Icons.cancel,
                                              size: 14.0,
                                              color: Color.fromARGB(
                                                  255, 33, 33, 33),
                                            ),
                                            onTap: () {
                                              onTagDelete(tag);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList()),
                                )
                              : null,
                        ),
                        onChanged: onChanged,
                        onSubmitted: onSubmitted,
                  ));

                });
              }
              ),
              ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 34, 34, 34),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),

                  )
                )
              ),
              onPressed: () {
                _controller.clearTags();
              },
              child: const Text('CLEAR TAGS',
              style: TextStyle(
                color: Colors.amber,
              ),),
            ),
            ],
          ),
          image: _buildImage('tags.png',150),

          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('ins_note_main.png'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}