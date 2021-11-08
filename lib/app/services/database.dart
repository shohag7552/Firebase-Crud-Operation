import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore? firestore;
  initilize() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> readData() async {
    QuerySnapshot querySnapshot;
    List dataList = [];

    try {
      querySnapshot =
          await firestore!.collection('countries').orderBy('timestamp').get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {'id': doc.id, 'name': doc['name'], 'code': doc['code']};
          dataList.add(a);
        }
        return dataList;
      }
    } catch (e) {
      log(e.toString());
    }
    return dataList;
  }

  void update(String id, String name, String code) async {
    try {
      await firestore!
          .collection('countries')
          .doc(id)
          .update({'name': name, 'code': code});
    } catch (e) {
      print(e);
    }
  }

  void create(String name, String code) async {
    try {
      await firestore!.collection('countries').add(
        {'name': name, 'code': code, 'timestamp': FieldValue.serverTimestamp()},
      );
    } catch (e) {
      print(e);
    }
  }

  void delete(String id) async {
    try {
      await firestore!.collection('countries').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
