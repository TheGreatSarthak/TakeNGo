import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_n_go/models/profile.dart';

class CustomerProfile extends StatelessWidget {
  CustomerProfile({super.key});

  final _controllerName = TextEditingController();
  final _controllerMail = TextEditingController();
  final _controllerPhone = TextEditingController();

  Future createUser(Profile user) async {
    final docUser = FirebaseFirestore.instance.collection('profile').doc();

    user.id=docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, bottom: 80, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              controller: _controllerName,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5.0,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              controller: _controllerMail,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter your email id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5.0,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Mobile No',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextField(
              controller: _controllerPhone,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter your contact number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final user= Profile(
            name: _controllerName.text,
            mail: _controllerMail.text,
            mobile: int.parse(_controllerPhone.text),
          );
          createUser(user);
          Navigator.pushNamedAndRemoveUntil(context, 'request', (route) => false);
        },
        label: const Text('Create Profile'),
      ),
    );
  }
}
