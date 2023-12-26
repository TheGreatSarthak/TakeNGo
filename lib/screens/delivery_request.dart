import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_n_go/models/delivery.dart';
//import 'package:get/get_core/src/get_main.dart';

import '../controller/login_controller.dart';

class DeliveryRequest extends StatelessWidget {
  DeliveryRequest({super.key});

  final controller = Get.put(LoginController());

  final _controllerTitle = TextEditingController();
  final _controllerWeight = TextEditingController();
  final _controllerQuantity = TextEditingController();
  final _controllerPickup = TextEditingController();
  final _controllerDestination = TextEditingController();

  Future createRequest(Delivery request) async {
    final docDelivery =
        FirebaseFirestore.instance.collection('deliveries').doc();

    request.id = docDelivery.id;
    final json = request.toJson();
    await docDelivery.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              // decoration: const BoxDecoration(
              //   color: Colors.red,
              // ),
              child: AspectRatio(
                aspectRatio: 1,
                child: CircleAvatar(
                  foregroundImage: Image.network(
                    controller.googleAccount.value?.photoUrl ?? '',
                    //fit: BoxFit.cover,
                    //scale: ,
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                  ).image,
                  //radius: 150,
                ),
              ),
            ),
            Text(
              controller.googleAccount.value?.displayName ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.googleAccount.value?.email ?? '',
              style: Get.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ActionChip(
              label: const Text('Logout'),
              avatar: const Icon(Icons.logout),
              onPressed: () {
                controller.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
            ),
            // ListTile(
            //   title: const Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
            // ListTile(
            //   title: const Text('Item 2'),
            //   onTap: () {
            //   },
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Request delivery'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, bottom: 80, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                controller: _controllerTitle,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter product title',
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Weight',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                controller: _controllerWeight,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Product weight in kg',
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                controller: _controllerQuantity,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter number of products',
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Pickup address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                controller: _controllerPickup,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter pickup address in detail',
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Destination address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextField(
                controller: _controllerDestination,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter deliver adress in detail',
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final request = Delivery(
            title: _controllerTitle.text,
            weight: int.parse(_controllerWeight.text),
            quantity: int.parse(_controllerQuantity.text),
            pickup: _controllerPickup.text,
            destination: _controllerDestination.text,
          );
          createRequest(request);
          Navigator.pushNamedAndRemoveUntil(context, 'my', (route) => false);
        },
        label: const Text('Confirm Request'),
      ),
    );
  }
}
