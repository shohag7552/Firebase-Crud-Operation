import 'package:firebase_second/app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();

  Database? db;

  create() {
    db = Database();
    db!.initilize();
    print(nameTextController.text);
    print(codeTextController.text);
    db!.create(nameTextController.text, codeTextController.text);
  }
}
