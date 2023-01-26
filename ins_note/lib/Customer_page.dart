import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_form_field.dart';

class CustomerContact extends StatefulWidget {
  const CustomerContact({Key? key}) : super(key: key);

  @override
  State<CustomerContact> createState() => _CustomerContactState();
}

class _CustomerContactState extends State<CustomerContact> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Inspiriation Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
             child : Text("고객 문의", style: Theme.of(context).textTheme.headline5),
            ),
            SizedBox(height: 32),
            Text("※ 작성하신 내용에 욕설, 성희롱 등의 내용이 포함된 경우 관련 법령에 따라 조치될 수 있습니다."),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("이메일", style: Theme.of(context).textTheme.subtitle1),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text("오류 제보", style: Theme.of(context).textTheme.subtitle1),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _errorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),

                    ), maxLines : 21
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child : ElevatedButton(
                onPressed: () { Navigator.of(context).pop(); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,

                    textStyle: TextStyle(
                       fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )
                ),
                child: Text("Submit"),
              )
            ),
          ],
        ),
      ),
    );
  }
}

