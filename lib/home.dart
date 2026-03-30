import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomaState();
}

class _HomaState extends State<Home> {

  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final scoreController = TextEditingController();

  String output = '';
  String grade = '';

  @override
  void dispose() {
    nameController.dispose();
    courseController.dispose();
    scoreController.dispose();
    super.dispose();
  }

  void snackBar(String s) {
    ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content:Text(s)));
  }

  void submit() {
    String name = nameController.text.trim();
    String course = courseController.text.trim();
    int? score = int.tryParse(scoreController.text);


    if(name.isEmpty) {
      snackBar('Enter Name');
      return;
    }
    if(course.isEmpty) {
      snackBar('Enter Course');
      return;
    }
    if(score == null) {
      snackBar('Enter Score');
      return;
    }
    if(score<0||score>100) {
      snackBar('Invalid Score');
      return;
    }

    if(score>=90) {
      grade='A+';
    }
    else if(score>=80) {
      grade='A';
    }
    else if(score>=75) {
      grade = 'A-';
    }
    else if(score>=70) {
      grade = 'B+';
    }
    else if(score>=65) {
      grade = 'B';
    }
    else if(score>=60) {
      grade = 'B-';
    }
    else if(score>=55) {
      grade = 'C+';
    }
    else if(score>=50) {
      grade = 'C';
    }
    else {
      grade = 'F';
    }

    setState(() {
      output='''
       Name: $name
       Course: $course
       Score: ${score.toStringAsFixed(2)}
       Grade: $grade
      ''';
    });
  }

  void reset() {
    nameController.clear();
    courseController.clear();
    scoreController.clear();
    setState(() {
      output='';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Chan Wei Song'),
        backgroundColor: Colors.red,
      ),
      body:Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            controller: nameController,
            keyboardType: TextInputType.name,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Course',
            ),
            controller: courseController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Score',
            ),
            controller: scoreController,
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: submit, child: Text('Submit')),
              ElevatedButton(onPressed: reset, child: Text('Reset')),
            ],
          ),
          Text(output),
        ],
      )
    );
  }
}