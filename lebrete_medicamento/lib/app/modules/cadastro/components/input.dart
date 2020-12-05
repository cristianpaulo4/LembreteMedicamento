import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final TextInputType keyboardType;
  final String erro;
  final TextEditingController controller;
  const Input({
    Key key,
    this.hint,
    this.keyboardType,
    this.erro,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffEBF1FF),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          contentPadding: EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          color: Color(0xff264771),
        ),
        validator: (x) {
          if (x.isEmpty) {
            return erro;
          }
        },
      ),
    );
  }
}
