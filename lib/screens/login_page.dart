import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:take_n_go/home.dart';
import 'package:take_n_go/controller/login_controller.dart';
import 'package:take_n_go/widgets/phone.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        controller.login();
      },
      label: const Text('Sign in with Google'),
      icon: Image.asset(
        'assets/images/google.png',
        height: 32,
        width: 32,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  // Column buildProfileView() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       CircleAvatar(
  //         backgroundImage:
  //             Image.network(controller.googleAccount.value?.photoUrl ?? '')
  //                 .image,
  //         radius: 100,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.displayName ?? '',
  //         style: Get.textTheme.headlineMedium,
  //       ),
  //       Text(
  //         controller.googleAccount.value?.email ?? '',
  //         style: Get.textTheme.bodyMedium,
  //       ),
  //       const SizedBox(
  //         height: 16,
  //       ),
  //       ActionChip(
  //         label: const Text('Logout'),
  //         avatar: const Icon(Icons.logout),
  //         onPressed: () {
  //           controller.logout();
  //         },
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/delivery_logo.png',
              height: 300,
            ),
            const Text(
              'TakeNGo',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyPhone(),
            const SizedBox(
              height: 20,
            ),
            const Row(children: [
              Expanded(
                  child: Divider(
                indent: 20,
                endIndent: 10,
              )),
              Text("OR"),
              Expanded(
                  child: Divider(
                indent: 10,
                endIndent: 20,
              )),
            ]),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Obx(() {
                if (controller.googleAccount.value == null) {
                  return buildLoginButton();
                } else {
                  return FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'home',
                        (route) => false,
                      );
                    },
                    label: const Text('Continue'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  );
                  // throw Navigator.pushNamedAndRemoveUntil(
                  //         context,
                  //         'home',
                  //         (route) => false,
                  //       );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
