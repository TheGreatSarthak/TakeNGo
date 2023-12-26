import 'package:flutter/material.dart';
import 'package:take_n_go/models/model_radiobutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _clicked = 1;

  final choices = [
    RadioList(
        //groupValue: 1,
        title: 'Customer',
        value: 1,
        selected: 'customer'),
    RadioList(
        //groupValue: 2,
        title: 'Organsisation',
        value: 2,
        selected: 'org'),
    RadioList(
        //groupValue: 3,
        title: 'Freelancer',
        value: 3,
        selected: 'freelance'),
  ];

  // RadioListTile buildchoicesTile(RadioList choices) {
  //   return RadioListTile(
  //     contentPadding: const EdgeInsets.all(10),
  //     value: choices.value,
  //     groupValue: _clicked,
  //     activeColor: Colors.red,
  //     title: Text(
  //       choices.title,
  //       style: const TextStyle(fontSize: 17),
  //     ),
  //     onChanged: (val) {
  //       setState(() {
  //         _clicked = val;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose an option',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/delivery_logo.png',
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Sign in as',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RadioListTile(
            toggleable: true,
            contentPadding: const EdgeInsets.all(10),
            value: choices[0].value,
            groupValue: _clicked,
            activeColor: Colors.red,
            title: Text(
              choices[0].title,
              style: const TextStyle(fontSize: 17),
            ),
            onChanged: (val) {
              setState(() {
                _clicked = val;
                Navigator.pushNamed(context, choices[0].selected);
              });
            },
          ),
          RadioListTile(
            toggleable: true,
            contentPadding: const EdgeInsets.all(10),
            value: choices[1].value,
            groupValue: _clicked,
            activeColor: Colors.red,
            title: Text(
              choices[1].title,
              style: const TextStyle(fontSize: 17),
            ),
            onChanged: (val) {
              setState(() {
                _clicked = val;
                Navigator.pushNamed(context, choices[1].selected);
              });
            },
          ),
          RadioListTile(
            toggleable: true,
            contentPadding: const EdgeInsets.all(10),
            value: choices[2].value,
            groupValue: _clicked,
            activeColor: Colors.red,
            title: Text(
              choices[2].title,
              style: const TextStyle(fontSize: 17),
            ),
            onChanged: (val) {
              setState(() {
                _clicked = val;
                Navigator.pushNamed(context, choices[2].selected);
              });
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: const Text('Continue'),
      // ),
    );
  }
}
