import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Second Page')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backspace),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}