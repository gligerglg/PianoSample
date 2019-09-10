import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:piano_sample/model/note.dart';

enum Pitch { LOW, MEDIUM, HIGH }

class KeyBoard extends StatefulWidget {
  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  var height;
  AudioCache player = new AudioCache();
  double black_height = 70;
  String _pitch = "3";

  List<Color> whiteColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color> blackColors = [
    Colors.black26,
    Colors.black26,
    Colors.black26,
    Colors.black26,
    Colors.black26,
  ];

  @override
  Widget build(BuildContext context) {
    height = (MediaQuery.of(context).size.height / 8);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
//          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _whiteKey(height, "C" + _pitch, 0),
                _whiteKey(height, "D" + _pitch, 1),
                _whiteKey(height, "E" + _pitch, 2),
                _whiteKey(height, "F" + _pitch, 3),
                _whiteKey(height, "G" + _pitch, 4),
                _whiteKey(height, "A" + _pitch, 5),
                _whiteKey(height, "B" + _pitch, 6),
                settings()
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height - (black_height / 2),
                ),
                _blackKey(height, "C#" + _pitch, 0),
                SizedBox(
                  height: height - (black_height),
                ),
                _blackKey(height, "D#" + _pitch, 1),
                SizedBox(
                  height: height * 2 - (black_height),
                ),
                _blackKey(height, "F#" + _pitch, 2),
                SizedBox(
                  height: height - (black_height),
                ),
                _blackKey(height, "G#" + _pitch, 3),
                SizedBox(
                  height: height - (black_height),
                ),
                _blackKey(height, "A#" + _pitch, 4),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded settings() {
    return Expanded(
        child: Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _pitch = "3";
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: RotatedBox(
                        child: Text("LOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        quarterTurns: 1,
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _pitch = "4";
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: RotatedBox(
                        child: Text("MID",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        quarterTurns: 1,
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _pitch = "5";
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: RotatedBox(
                        child: Text("HIGH",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        quarterTurns: 1,
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        )
      ],
    ));
  }

  _whiteKey(var height, String note, int index) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: GestureDetector(
            child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: whiteColors[index],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "$note",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                )),
            onTapDown: (_) {
              _playNote(_mapToNote(note));
              setState(() {
                whiteColors[index] = Colors.white70;
              });
            },
            onTapUp: (_) {
              setState(() {
                whiteColors[index] = Colors.white;
              });
            },
          ),
        )
      ],
    );
  }

  Tone _mapToNote(String note) {
    if (note == "C3") return Tone.C3;
    if (note == "D3") return Tone.D3;
    if (note == "E3") return Tone.E3;
    if (note == "F3") return Tone.F3;
    if (note == "G3") return Tone.G3;
    if (note == "A3") return Tone.A3;
    if (note == "B3") return Tone.B3;

    if (note == "C#3") return Tone.Db3;
    if (note == "D#3") return Tone.Eb3;
    if (note == "F#3") return Tone.Gb3;
    if (note == "G#3") return Tone.Ab3;
    if (note == "A#3") return Tone.Bb3;

    if (note == "C4") return Tone.C4;
    if (note == "D4") return Tone.D4;
    if (note == "E4") return Tone.E4;
    if (note == "F4") return Tone.F4;
    if (note == "G4") return Tone.G4;
    if (note == "A4") return Tone.A4;
    if (note == "B4") return Tone.B4;

    if (note == "C#4") return Tone.Db4;
    if (note == "D#4") return Tone.Eb4;
    if (note == "F#4") return Tone.Gb4;
    if (note == "G#4") return Tone.Ab4;
    if (note == "A#4") return Tone.Bb4;

    if (note == "C5") return Tone.C5;
    if (note == "D5") return Tone.D5;
    if (note == "E5") return Tone.E5;
    if (note == "F5") return Tone.F5;
    if (note == "G5") return Tone.G5;
    if (note == "A5") return Tone.A5;
    if (note == "B5") return Tone.B5;

    if (note == "C#5") return Tone.Db5;
    if (note == "D#5") return Tone.Eb5;
    if (note == "F#5") return Tone.Gb5;
    if (note == "G#5") return Tone.Ab5;
    if (note == "A#5") return Tone.Bb5;
  }

  _blackKey(var height, String note, int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Container(
          height: black_height,
          width: (height) * 2,
          decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: blackColors[index],
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(
                    1.0, // horizontal, move right 10
                    8.0, // vertical, move down 10
                  ),
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "$note",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        onTapDown: (_) {
          _playNote(_mapToNote(note));
          setState(() {
            blackColors[index] = Colors.transparent;
          });
        },
        onTapUp: (_) {
          setState(() {
            blackColors[index] = Colors.black26;
          });
        },
      ),
    );
  }

  _playNote(Tone note) {

    switch (note) {
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
}
