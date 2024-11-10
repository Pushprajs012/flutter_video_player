import 'package:flutter/material.dart';

class UIHelper {
  static btn(String text, VoidCallback callback) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(text,style: TextStyle(color: Colors.white),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }

  static editText(TextEditingController _controller,String hint) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Enter Text',
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}
