import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FocusNode focusNode = FocusNode();
  bool valid = true;
  bool require = true;
  bool isfocused = false;
  bool isempty = true;
  String myValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      focusNode.hasFocus ? isfocused = true : isfocused = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: isfocused ? 4 : 1,
                  color: valid ? Colors.black : Colors.red,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  focusNode: focusNode,
                  textAlignVertical: TextAlignVertical(y: -1),
                  onEditingComplete: () {
                    setState(() {
                      setState(() {
                        isfocused = false;
                      });
                    });
                  },
                  onTap: () {
                    setState(() {
                      focusNode.hasFocus ? isfocused = true : isfocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      focusNode.hasFocus ? isfocused = true : isfocused = false;
                      isempty = false;
                      require = false;
                      myValue = value;
                    });
                  },
                  textInputAction: TextInputAction.done,
                  style: valid
                      ? TextStyle(color: Colors.black, fontSize: 20)
                      : TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: isempty && !isfocused ? null : "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelStyle: TextStyle(
                        color: valid && isfocused ? Colors.amber : Colors.grey,
                        fontSize: 20),
                    suffixIcon: isempty
                        ? Text('*',
                            style: TextStyle(color: Colors.amber, fontSize: 20))
                        : null,
                    contentPadding: !isfocused ? EdgeInsets.all(20) : null,
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 20,
                        minHeight: 20,
                        minWidth: 20),
                    //errorText: valid ? null : null,
                    hintText: 'Enter Email ',
                    hintStyle: TextStyle(fontSize: 20),
                    // border: UnderlineInputBorder(),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: 0)),
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                myValue.contains('@') ? valid = true : valid = false;
              });
            },
            child: Text('Submit'),
            textColor: Colors.white,
            color: Colors.brown,
          ),
        ],
      )),
    );
  }
}
