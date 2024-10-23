import 'package:flutter/material.dart';
import 'package:flutter_application_4/student.dart';

// ignore: must_be_immutable
class StudentInfo extends StatefulWidget {
  Student std;
  VoidCallback deleteStudent;
  StudentInfo({
    required this.deleteStudent,
    required this.std,
    super.key,
  });

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        widget.deleteStudent();
      },
      onTap: () {
        // print('you tapped ${std.name}');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Student Info'),
            content: Text(widget.std.toString()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok')),
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Name: ',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                      Text(
                        widget.std.name,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'ID: ',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                      Text(
                        widget.std.id,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {});
                      widget.std.fav = !widget.std.fav;
                    },
                    icon: widget.std.fav
                        ? Icon(Icons.star)
                        : Icon(Icons.star_border),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/person.jpg',
                width: 80,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
