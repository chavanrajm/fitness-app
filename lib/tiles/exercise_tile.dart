import 'package:flutter/material.dart';
import 'package:untitled1/main_screen.dart';

class ExerciseTile extends StatefulWidget {
  String exerciseName;
  int index;
  VoidCallback deleteExercise;
   ExerciseTile({required this.exerciseName, required this.index, required this.deleteExercise});
  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.exerciseName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              SizedBox(width: 3.0),
            IconButton(onPressed: (){
              widget.deleteExercise();
            }, icon: Icon(Icons.delete)),
          ],)
        ],
      ),
    );
  }
}
