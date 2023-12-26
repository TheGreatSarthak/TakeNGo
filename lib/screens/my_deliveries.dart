import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:take_n_go/models/delivery.dart';
//import 'package:get/get_core/src/get_main.dart';

import '../controller/login_controller.dart';

class MyDeliveries extends StatelessWidget {
  MyDeliveries({super.key});

  final controller = Get.put(LoginController());

  Stream<List<Delivery>> readDeliveries() => FirebaseFirestore.instance
      .collection('deliveries')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Delivery.fromJson(doc.data())).toList());

  Widget buildDelivery(Delivery delivery)=> ListTile(
    leading: CircleAvatar(
      child: Text('${delivery.quantity}',
      ),
      ),
      title: Text(delivery.title),
      subtitle: Text(delivery.destination),
  );

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
        title: const Text('My deliveries'),
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
      body: StreamBuilder<List<Delivery>>(
        stream: readDeliveries(),
        builder: (context, snapshot){
          //final deliveries=snapshot.data!;
          //print(snapshot.isBlank);
          print(snapshot.hasError);
          if (snapshot.hasData) {
            print('yaha');
            final deliveries=snapshot.data!;
            return ListView(
              children: deliveries.map(buildDelivery).toList(),
            );
          }
          else {
            print('yaha mat aa');
            return const Center(child: CircularProgressIndicator());
          }
        },),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context, 'request');
        },
        child: const Icon(Icons.add),),
    );
  }
}
