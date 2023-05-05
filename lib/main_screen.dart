import 'package:flutter/material.dart';
import 'package:untitled1/tiles/program_tile.dart';

import 'classes.dart';
List <String>exercises = ['Crunch','Pull ups', 'Push ups'
];
List<Program>programs = [

];
class FitnessApp extends StatefulWidget {
  @override
  _FitnessAppState createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  TextEditingController programTextController = TextEditingController();
  TextEditingController exerciseTextController = TextEditingController();
 void callBack (){
   setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fitness App')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Create Program'),
                      content: TextField(
                        controller: programTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter your program here',
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            programs.add(Program(programName: programTextController.text, exercises: <String>[]));
                            programTextController.clear();
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                          child: Text('Create'),
                        ),
                      ],
                    );
                  },
                );
              }, child:Text('Create Program')),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Create Exercise'),
                      content: TextField(
                        controller: exerciseTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Exercise here',
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            exercises.add(exerciseTextController.text);
                            exerciseTextController.clear();
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                          child: Text('Create'),
                        ),
                      ],
                    );
                  },
                );
              },child:Text('Create Exercise')),
          ],),
         Expanded(child: ListView.builder(
           shrinkWrap: true,
             itemCount: programs.length,
             itemBuilder: (context, i){
           return ProgramTile(program: programs[i].programName, index:  i,callback: callBack,exercises: programs[i].exercises,);
         }))
        ],
      ),
    );
  }
}
