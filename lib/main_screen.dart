import 'package:flutter/material.dart';
import 'package:untitled1/tiles/program_tile.dart';

import 'classes.dart';
List<Exercise>exercises = [Exercise(exerciseName: 'Crunch'),
  Exercise(exerciseName: 'Pull ups'),
  Exercise(exerciseName: 'Push ups')
];
List<Program>programs = [
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
  Program(programName: 'Day 1', exercises: exercises),
  Program(programName: 'Day 2', exercises: exercises),
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
                            programs.add(Program(programName: programTextController.text, exercises: []));
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
                            exercises.add(Exercise(exerciseName: exerciseTextController.text));
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
             String newProgram = '';
           return ProgramTile(program: programs[i].programName, index:  i,callback: callBack,);
         }))
        ],
      ),
    );
  }
}
