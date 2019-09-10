enum NoteState { READY, TAPPED, MISSED }
enum NoteType {WORKING,HIDDEN}
enum Tone {
  C3,
  C4,
  C5,
  C6,
  D3,
  D4,
  D5,
  D6,
  Db3,
  Db4,
  Db5,
  Db6,
  E3,
  E4,
  E5,
  E6,
  Eb3,
  Eb4,
  Eb5,
  Eb6,
  F3,
  F4,
  F5,
  F6,
  G3,
  G4,
  G5,
  G6,
  Gb3,
  Gb4,
  Gb5,
  Gb6,
  A3,
  A4,
  A5,
  A6,
  Ab3,
  Ab4,
  Ab5,
  Ab6,
  B3,
  B4,
  B5,
  B6,
  Bb3,
  Bb4,
  Bb5,
  Bb6
}

class Note {
  final int orderNumber;
  final int line;
  final Tone tone;
  final int length;
  final int offset;

  NoteState state = NoteState.READY;
  NoteType noteType = NoteType.WORKING;

  Note({this.orderNumber, this.line, this.tone,this.length,this.offset,this.noteType});
}
