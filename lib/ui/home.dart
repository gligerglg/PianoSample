import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:piano_sample/model/note.dart';
import 'package:piano_sample/ui/line_view.dart';

import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AudioCache player = new AudioCache();

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
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && isPlaying) {
        if (noteList[currentNoteIndex].state != NoteState.TAPPED) {
          if (noteList[currentNoteIndex].noteType == NoteType.HIDDEN) {
            setState(() {
              currentNoteIndex++;
              animationController.forward(from: 0);
            });
          } else {
            setState(() {
              isPlaying = false;
              noteList[currentNoteIndex].state = NoteState.MISSED;
            });

            animationController.reverse().then((value) {
              _showFinishDialog();
            });
          }
        } else if (currentNoteIndex == noteList.length - 5) {
          //Song Finished
          _showFinishDialog();
        } else {
          setState(() {
            currentNoteIndex++;
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
    _playNote(note);
    bool areAllPreviousTapped = noteList
        .sublist(0, note.orderNumber)
        .every((n) => n.state == NoteState.TAPPED);

    if (!hasStarted) {
      animationController.forward();
      setState(() {
        hasStarted = true;
      });
    }

    /*if (areAllPreviousTapped) {
      setState(() {
        note.state = NoteState.TAPPED;
        ++points;
      });
    }*/

    setState(() {
      note.state = NoteState.TAPPED;
      ++points;
    });
  }

  _playNote(Note note) {
    switch (note.tone) {
      case Tone.C3:
        player.play('C3.wav');
        return;
      case Tone.C4:
        player.play('C4.wav');
        return;
      case Tone.C5:
        player.play('C5.wav');
        return;
      case Tone.C6:
        player.play('C6.wav');
        return;

      case Tone.D3:
        player.play('D3.wav');
        return;
      case Tone.D4:
        player.play('D4.wav');
        return;
      case Tone.D5:
        player.play('D5.wav');
        return;
      case Tone.D6:
        player.play('D6.wav');
        return;
      case Tone.Db3:
        player.play('Db3.wav');
        return;
      case Tone.Db4:
        player.play('Db4.wav');
        return;
      case Tone.Db5:
        player.play('Db5.wav');
        return;
      case Tone.Db6:
        player.play('Db6.wav');
        return;

      case Tone.E3:
        player.play('E3.wav');
        return;
      case Tone.E4:
        player.play('E4.wav');
        return;
      case Tone.E5:
        player.play('E5.wav');
        return;
      case Tone.E6:
        player.play('E6.wav');
        return;
      case Tone.Eb3:
        player.play('Eb3.wav');
        return;
      case Tone.Eb4:
        player.play('Eb4.wav');
        return;
      case Tone.Eb5:
        player.play('Eb5.wav');
        return;
      case Tone.Eb6:
        player.play('Eb6.wav');
        return;

      case Tone.F3:
        player.play('F3.wav');
        return;
      case Tone.F4:
        player.play('F4.wav');
        return;
      case Tone.F5:
        player.play('F5.wav');
        return;
      case Tone.F6:
        player.play('F6.wav');
        return;

      case Tone.G3:
        player.play('G3.wav');
        return;
      case Tone.G4:
        player.play('G4.wav');
        return;
      case Tone.G5:
        player.play('G5.wav');
        return;
      case Tone.G6:
        player.play('G6.wav');
        return;
      case Tone.Gb3:
        player.play('Gb3.wav');
        return;
      case Tone.Gb4:
        player.play('Gb4.wav');
        return;
      case Tone.Gb5:
        player.play('Gb5.wav');
        return;
      case Tone.Gb6:
        player.play('Gb6.wav');
        return;

      case Tone.A3:
        player.play('A3.wav');
        return;
      case Tone.A4:
        player.play('A4.wav');
        return;
      case Tone.A5:
        player.play('A5.wav');
        return;
      case Tone.A6:
        player.play('A6.wav');
        return;
      case Tone.Ab3:
        player.play('Ab3.wav');
        return;
      case Tone.Ab4:
        player.play('Ab4.wav');
        return;
      case Tone.Ab5:
        player.play('Ab5.wav');
        return;
      case Tone.Ab6:
        player.play('Ab6.wav');
        return;

      case Tone.B3:
        player.play('B3.wav');
        return;
      case Tone.B4:
        player.play('B4.wav');
        return;
      case Tone.B5:
        player.play('B5.wav');
        return;
      case Tone.B6:
        player.play('B6.wav');
        return;
      case Tone.Bb3:
        player.play('Bb3.wav');
        return;
      case Tone.Bb4:
        player.play('Bb4.wav');
        return;
      case Tone.Bb5:
        player.play('Bb5.wav');
        return;
      case Tone.Bb6:
        player.play('Bb6.wav');
        return;
    }
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
            'assets/piano_bg.jpg',
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
