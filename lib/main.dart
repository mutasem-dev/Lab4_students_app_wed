import 'package:flutter/material.dart';
import 'package:flutter_application_4/StudentInfo.dart';
import 'package:flutter_application_4/student.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController nameController = TextEditingController();
TextEditingController idController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();

List<Student> students = [
  Student(name: 'Mutasem', id: '03/0177', phone: '21544', address: 'hebron'),
  Student(name: 'Ahmad', id: '12/4545', phone: '245345', address: 'nablus'),
  Student(name: 'Ali', id: '13/1234', phone: '2434', address: 'hebron'),
  Student(name: 'Mariam', id: '14/3543', phone: '23424', address: 'ramallah'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StudentCard(),
    );
  }
}

class StudentCard extends StatefulWidget {
  const StudentCard({super.key});

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> options = [
      ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) => StudentInfo(
          std: students[index],
          deleteStudent: () {
            setState(() {
              students.removeAt(index);
            });
          },
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: idController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'id',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'phone',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'address',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  idController.text.isEmpty ||
                  phoneController.text.isEmpty ||
                  addressController.text.isEmpty) {
                SnackBar snackBar =
                    SnackBar(content: Text('please fill all fields'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }

              students.add(Student(
                  name: nameController.text,
                  id: idController.text,
                  phone: phoneController.text,
                  address: addressController.text));
              nameController.clear();
              idController.clear();
              phoneController.clear();
              addressController.clear();
            },
            child: Text('add'),
          ),
        ],
      )
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Select item below: ',
                style: TextStyle(fontSize: 25),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
              tileColor: Colors.blue,
              leading: Text('add student'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
              tileColor: Colors.blue,
              leading: Text('show all students'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('My info'),
      ),
      body: options[selectedIndex],
    );
  }
}
