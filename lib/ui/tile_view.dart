import 'package:flutter/material.dart';
import 'package:piano_sample/model/note.dart';

class Tile extends StatelessWidget {
  final NoteState noteState;
  final double height;
  final VoidCallback onTap;

  Tile({this.noteState, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: GestureDetector(
        onTapDown: (_) => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Color get color {
    switch (noteState) {
      case NoteState.READY:
        return Colors.black;
      case NoteState.MISSED:
        return Colors.red;
      case NoteState.TAPPED:
        return Colors.transparent;
      default:
        return Colors.black;
    }
  }
}
