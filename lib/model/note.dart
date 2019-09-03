
enum NoteState{READY,TAPPED,MISSED}
class Note{
  final int orderNumber;
  final int line;
  NoteState state = NoteState.READY;

  Note(this.orderNumber, this.line);
}