import 'package:flutter/material.dart';
import 'package:piano_sample/model/note.dart';
import 'package:piano_sample/ui/line_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Note> noteList = initNotes();
  int currentNoteIndex = 0;
  AnimationController animationController;
  bool hasStarted = false;
  int points = 0;
  bool isPlaying = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && isPlaying) {
        if (noteList[currentNoteIndex].state != NoteState.TAPPED) {
          setState(() {
            isPlaying = false;
            noteList[currentNoteIndex].state = NoteState.MISSED;
          });

          animationController.reverse().then((value) {
            _showFinishDialog();
          });
        } else if (currentNoteIndex == noteList.length - 5) {
          //Song Finished
          _showFinishDialog();
        } else {
          setState(() {
            ++currentNoteIndex;
            animationController.forward(from: 0);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onTapNote(Note note) {
    /* bool areAllPreviousTapped = noteList
        .sublist(0, note.orderNumber)
        .every((n) => n.state == NoteState.TAPPED);*/

    if (!hasStarted) {
      animationController.forward();
      setState(() {
        hasStarted = true;
      });
    }

    /*if(areAllPreviousTapped) {

    }*/

    setState(() {
      note.state = NoteState.TAPPED;
      ++points;
    });
  }

  _drawLine(int lineNumber) {
    return Expanded(
      child: Line(
        lineNumber: lineNumber,
        currentNotes: noteList.sublist(currentNoteIndex, currentNoteIndex + 5),
        animation: animationController,
        onTapNote: _onTapNote,
      ),
    );
  }

  void _showFinishDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Score: $points"), //<--With number of points
          actions: <Widget>[
            FlatButton(
              //<-- and restart button
              onPressed: () {
                Navigator.of(context).pop();
                _restart();
              },
              child: Text("RESTART"),
            ),
          ],
        );
      },
    ).then((_) => _restart);
  }

  void _restart() {
    setState(() {
      hasStarted = false;
      isPlaying = true;
      noteList = initNotes();
      points = 0;
      currentNoteIndex = 0;
    });
    animationController.reset();
  }

  _drawPoints() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Text(
          "$points",
          style: TextStyle(
              color: Colors.red, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.asset(
            'images/piano_bg.jpg',
            fit: BoxFit.cover,
          ),
          Row(
            children: <Widget>[
              _drawLine(0),
              LineDivider(),
              _drawLine(1),
              LineDivider(),
              _drawLine(2),
              LineDivider(),
              _drawLine(3),
            ],
          ),
          _drawPoints()
        ],
      ),
    );
  }
}

List<Note> initNotes() {
  return [
    Note(0, 0),
    Note(1, 1),
    Note(2, 2),
    Note(3, 1),
    Note(4, 3),
    Note(5, 0),
    Note(6, 0),
    Note(7, 3),
    Note(8, 2),
    Note(9, 2),
    Note(10, 1),
    Note(11, 3),
    Note(12, 1),
    Note(13, 0),
    Note(14, 2),
    Note(15, 1),
    Note(16, 2),
    Note(17, 0),
    Note(18, 1),
    Note(19, 3),
    Note(20, -1),
    //Add 4 times -1 notes so that song will end after last normal note reaches end
    Note(21, -1),
    Note(22, -1),
    Note(23, -1),
    Note(24, -1),
  ];
}

class LineDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.white,
    );
  }
}
