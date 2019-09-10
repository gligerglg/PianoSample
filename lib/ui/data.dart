
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:piano_sample/model/note.dart';

List<Note> initNotes() {
  Random random = new Random();
  return [
    Note(orderNumber: 0, line: 0, tone: Tone.Eb4, length: 2, offset: 0),
    Note(orderNumber: 1, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 3, line: 2, tone: Tone.Bb4, length: 2, offset: 4),
    Note(orderNumber: 4, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 3, line: 2, tone: Tone.Bb4, length: 2, offset: 4),
    Note(orderNumber: 4, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 6, line: 2, tone: Tone.Gb4, length: 2, offset: 6),
    Note(orderNumber: 7, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 9, line: 1, tone: Tone.F4, length: 2, offset: 8),
    Note(orderNumber: 10, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 12, line: 3, tone: Tone.F4, length: 2, offset: 10),
    Note(orderNumber: 13, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 15, line: 2, tone: Tone.F4, length: 2, offset: 12),
    Note(orderNumber: 16, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 18, line: 1, tone: Tone.F4, length: 1, offset: 14),
    Note(orderNumber: 19, line: 2, tone: Tone.Gb4, length: 2, offset: 15),
    Note(orderNumber: 16, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 20, line: 3, tone: Tone.Eb4, length: 2, offset: 17),


    Note(orderNumber: 3, line: 2, tone: Tone.Bb4, length: 2, offset: 4),
    Note(orderNumber: 4, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 3, line: 2, tone: Tone.Bb4, length: 2, offset: 4),
    Note(orderNumber: 4, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 6, line: 2, tone: Tone.Gb4, length: 2, offset: 6),
    Note(orderNumber: 7, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 9, line: 1, tone: Tone.F4, length: 2, offset: 8),
    Note(orderNumber: 10, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 12, line: 3, tone: Tone.F4, length: 2, offset: 10),
    Note(orderNumber: 13, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 15, line: 2, tone: Tone.F4, length: 2, offset: 12),
    Note(orderNumber: 16, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 18, line: 1, tone: Tone.F4, length: 1, offset: 14),
    Note(orderNumber: 19, line: 2, tone: Tone.Gb4, length: 2, offset: 15),
    Note(orderNumber: 16, line: -1, tone: Tone.Gb4, length: 2, offset: 0,noteType: NoteType.HIDDEN),
    Note(orderNumber: 20, line: 3, tone: Tone.Eb4, length: 2, offset: 17),

    /*Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.F3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.G3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.A3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.A3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.A3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.F3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.G3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.A3, length: 2, offset: 4),

    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.F3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.F3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.C3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.C3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.C3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.Db3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.A3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.G3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.F3, length: 2, offset: 4),
    Note(orderNumber: 0, line: random.nextInt(3), tone: Tone.D3, length: 2, offset: 4),*/


    Note(orderNumber: 14, line: -1, tone: Tone.Gb4, length: 2, offset: 34),
    Note(orderNumber: 15, line: -1, tone: Tone.Gb4, length: 2, offset: 36),
    Note(orderNumber: 16, line: -1, tone: Tone.Gb4, length: 2, offset: 38),
    Note(orderNumber: 17, line: -1, tone: Tone.Gb4, length: 2, offset: 40),
  ];
}