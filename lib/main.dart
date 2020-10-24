import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TextFieldState(),
      child: MaterialApp(
        home: Scaffold(
          body: Consumer<TextFieldState>(
            builder: (BuildContext context, myState, Widget child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: myState.isfocused ? 4 : 1,
                          color: myState.valid ? Colors.black : Colors.red,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          focusNode: myState.focusNode,
                          textAlignVertical: TextAlignVertical(y: -1),
                          onTap: () {
                            myState.onTap();
                          },
                          onChanged: (value) {
                            myState.onChanged(value);
                          },
                          textInputAction: TextInputAction.done,
                          style: myState.valid
                              ? TextStyle(color: Colors.black, fontSize: 20)
                              : TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: myState.isempty && !myState.isfocused
                                ? null
                                : "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelStyle: TextStyle(
                                color: myState.valid && myState.isfocused
                                    ? Colors.amber
                                    : Colors.grey,
                                fontSize: 20),
                            suffixIcon: myState.isempty
                                ? Text('*',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20))
                                : null,
                            contentPadding:
                                myState.isempty ? EdgeInsets.all(20) : null,
                            suffixIconConstraints: BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                                minHeight: 20,
                                minWidth: 20),
                            //errorText: valid ? null : null,
                            hintText: 'Enter Email ',
                            hintStyle: TextStyle(fontSize: 20),
                            // border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      myState.buttonOnPressed();
                    },
                    child: Text('Submit'),
                    textColor: Colors.white,
                    color: Colors.brown,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
