import 'package:flutter/material.dart';
import 'package:piano_sample/model/note.dart';
import 'package:piano_sample/ui/tile_view.dart';

class Line extends AnimatedWidget {
  final int lineNumber;
  final List<Note> currentNotes;
  final Animation<double> animation;
  final Function(Note) onTapNote;

  Line({this.lineNumber, this.currentNotes, this.animation,this.onTapNote}):super(listenable:animation);

//  const Line(Key key, this.currentNotes, this.lineNumber,Animation<double> animation) : super(key: key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    //Get height
    double height = MediaQuery.of(context).size.height;
    double tileHeight = height / 4;

    //Get only notes for the current line
    List<Note> notes =
        currentNotes.where((note) => note.line == lineNumber).toList();

    //Map Notes to widgets
    List<Widget> tiles = notes.map((note) {
      int index = currentNotes.indexOf(note);
      double offset = (3 - index + animation.value) * tileHeight;

      return Transform.translate(
          offset: Offset(0, offset),
          child: Tile(
            height: tileHeight,
            noteState: note.state,
            onTap: ()=>onTapNote(note),
          ));
    }).toList();

    return SizedBox.expand(
      child: Stack(
        children: tiles,
      ),
    );
  }
}
