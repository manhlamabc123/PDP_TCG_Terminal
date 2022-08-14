import 'package:flutter/material.dart';

const userNameErr = "Invalid Username";
bool userInvalid = false;

Widget buildUsername(TextEditingController textEditingController) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username',
          style: TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18),
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            errorText: userInvalid ? userNameErr : null,
            hintText: 'Your username...',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue, width: 3),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
