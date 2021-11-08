import 'package:firebase_second/app/controllers/update_controller.dart';
import 'package:firebase_second/app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {
  Map? country;
  Database? db;
  UpdatePage({Key? key, this.country, this.db}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  // final UpdateController updateController = Get.put(UpdateController());

  TextEditingController nameTextController = TextEditingController();
  TextEditingController codeTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameTextController.text = widget.country!['name'];
    codeTextController.text = widget.country!['code'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: TextFormField(
                controller: nameTextController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'country name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: TextFormField(
                controller: codeTextController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'country code',
                  border: InputBorder.none,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                widget.db!.update(widget.country!['id'],
                    nameTextController.text, codeTextController.text);
                // widget.db!
                //     .create(nameTextController.text, codeTextController.text);
                Get.back();
              },
              child: Text('update'),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
