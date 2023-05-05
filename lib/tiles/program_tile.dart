import 'package:flutter/material.dart';
import 'package:untitled1/main_screen.dart';
import 'package:untitled1/tiles/exercise_tile.dart';

class ProgramTile extends StatefulWidget {
  String program;
  final int index;
 VoidCallback callback;
  ProgramTile({required this.program, required this.callback, required this.index});

  @override
  State<ProgramTile> createState() => _ProgramTileState();
}

class _ProgramTileState extends State<ProgramTile> {
  TextEditingController textEditingController =
  TextEditingController();
  FocusNode focusNode= FocusNode();
  bool isEditing = false;
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.program;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isEditing
                      ? Expanded(
                    child: TextField(
                      autofocus: isEditing,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Open Sans',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                      : Text(
                    widget.program,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Open Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      isEditing
                          ? IconButton(
                        onPressed: () {
                          programs[widget.index].programName =
                              textEditingController.text;
                          widget.program = textEditingController.text;
                          isEditing = false;
                          setState(() {});
                        },
                        icon: Icon(Icons.check),
                      )
                          : IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          isEditing = true;
                          setState(() {});
                        },
                      ),
                      SizedBox(width: 16.0),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey[600]),
                        onPressed: () {
                          programs.removeAt(widget.index);
                          widget.callback();
                        },
                      ),
                      SizedBox(width: 16.0),
                      IconButton(
                        icon: Icon(
                          isExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          isExpanded = !isExpanded;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(
                     vertical: 8.0),
                child: Column(
                  children: [
                    for (var exercise in exercises)
                      ExerciseTile(exerciseName: exercise.exerciseName)
                  ],
                )
              ),
          ],
        ),
      ),
    );
  }
}
