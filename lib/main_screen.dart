import 'package:flutter/material.dart';
import 'package:untitled1/tiles/program_tile.dart';

import 'classes.dart';
List<Exercise>exercises = [Exercise(exerciseName: 'Crunch'),
  Exercise(exerciseName: 'Pull ups'),
  Exercise(exerciseName: 'Push ups')
];
class FitnessApp extends StatefulWidget {
  @override
  _FitnessAppState createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fitness App')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ElevatedButton(onPressed: (){}, child:Text('Create Program')),
            ElevatedButton(onPressed: (){}, child:Text('Create Exercise')),
          ],),
         Expanded(child: ListView.builder(
           shrinkWrap: true,
             itemCount: programs.length,
             itemBuilder: (context, i){
           return ProgramTile(program: programs[i].programName);
         }))
        ],
      ),
    );
  }
}
