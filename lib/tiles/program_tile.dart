import 'package:flutter/material.dart';

class ProgramTile extends StatefulWidget {
  final String program;

  ProgramTile({required this.program});

  @override
  State<ProgramTile> createState() => _ProgramTileState();
}

class _ProgramTileState extends State<ProgramTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.program,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Open Sans', // Use custom font
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.edit_rounded, color: Colors.grey[600]),
                    SizedBox(width: 16.0),
                    Icon(Icons.delete, color: Colors.grey[600]),
                    SizedBox(width: 16.0),
                    Icon(Icons.expand_more, color: Colors.grey[600]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
