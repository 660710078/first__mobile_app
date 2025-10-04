import 'package:flutter/material.dart';

class FormRegitration extends StatefulWidget {
  const FormRegitration({super.key});

  @override
  State<FormRegitration> createState() => _FormRegitrationState();
}

class _FormRegitrationState extends State<FormRegitration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? gender = 'Male';
  String? selectedProvice;
  bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(label: Text('Full Name')),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(label: Text('Email')),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Email";
                  }
                  return null;
                },
              ),
              Column(
                children: [
                  RadioListTile(
                    value: 'Male',
                    title: Text('Male'),
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  RadioListTile(
                    value: 'Female',
                    title: Text('Female'),
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value;
                      });
                    },
                  )
                ],
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Provice'),
                value: selectedProvice,
                items: ['Bangkok', 'Chiang Mai', 'Phuket']
                    .map((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedProvice = value;
                  });
                },
                validator: (String? value) {
                  if (value == null) {
                    return "Please select Provice";
                  }
                  return null;
                },
              ),

              //consent form
              CheckboxListTile(
                  title: const Text("Accept Term & Conditions"),
                  checkColor: Colors.blue,
                  value: isAccept,
                  onChanged: (bool? value) {
                    setState(() {
                      isAccept = value!;
                    });
                  }),

              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('sucess form');
                    }
                  },
                  child: Text('Submit'))
            ],
          )),
    );
  }
}
