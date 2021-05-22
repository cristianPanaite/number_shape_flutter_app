import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_shape/utils/utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShapeNumber(),
    );
  }
}

class ShapeNumber extends StatefulWidget {
  const ShapeNumber({Key? key}) : super(key: key);

  @override
  _ShapeNumberState createState() => _ShapeNumberState();
}

class _ShapeNumberState extends State<ShapeNumber> {
  TextEditingController _controller = new TextEditingController();
  String _inputValue = "";

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text(_inputValue),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number Shapes"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please input a number to see if it is square or triangular"),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(labelText: ""),
                onChanged: (String value) {
                  _inputValue = value;
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text(processNumber(_inputValue)),
                    title: const Text("Your number is"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Ok'),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                ),
            child: Icon(Icons.forward_outlined)),
      ),
    );
  }
}
