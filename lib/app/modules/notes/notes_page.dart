import 'package:challenge65/app/models/notes_model.dart';
import 'package:challenge65/app/models/student_information_model.dart';
import 'package:challenge65/app/modules/components/Text.dart';
import 'package:challenge65/app/modules/reportCard/report_card_page.dart';
import 'package:flutter/material.dart';

import '../components/text_field.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.title});

  static const roteName = '/notes';
  final String title;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final ctrlSubject = TextEditingController();
  final ctrlFirstNote = TextEditingController();
  final ctrlSecondNote = TextEditingController();
  final ctrlThirdNote = TextEditingController();
  final ctrlFourthNote = TextEditingController();
  double average = 0;
  double necessaryNotes = 0;
  String situation = '';
  String classification = '';

  _calculateAverage() {
    setState(() {
      double firstNote = double.parse(ctrlFirstNote.text);
      double secondNote = double.parse(ctrlSecondNote.text);
      double thirdNote = double.parse(ctrlThirdNote.text);
      double fourthNote = double.parse(ctrlFourthNote.text);
      average = (firstNote + secondNote + thirdNote + fourthNote) / 4;

      if (average < 2) {
        classification = 'F';
      } else if (average < 4) {
        classification = 'E';
      } else if (average < 6) {
        classification = 'D';
      } else if (average < 8) {
        classification = 'C';
      } else if (average < 9) {
        classification = 'B';
      } else {
        classification = 'A';
      }

      if (average >= 6) {
        situation = 'Aprovado(a)';
        necessaryNotes = 0;
      } else {
        situation = 'Reprovado(a)';
        necessaryNotes = 10 - average;
      }
    });
  }

  cleanPageNotes() {
    setState(() {
      ctrlSubject.text = '';
      ctrlFirstNote.text = '';
      ctrlSecondNote.text = '';
      ctrlThirdNote.text = '';
      ctrlFourthNote.text = '';
      average = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as StudentInformationModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: cleanPageNotes,
            icon: const Icon(Icons.cleaning_services_outlined),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 560,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color.fromARGB(221, 194, 241, 204),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    newText('Aluno:'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      args.student,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                newText('Disciplina:'),
                newTextField('Digite a disciplina', Icons.subject,
                    TextInputType.name, ctrlSubject),
                const SizedBox(
                  height: 2,
                ),
                newText('1° Bim:'),
                newTextField('Digite a nota', Icons.note_add,
                    TextInputType.number, ctrlFirstNote),
                const SizedBox(
                  height: 2,
                ),
                newText('2° Bim:'),
                newTextField('Digite a nota', Icons.note_add,
                    TextInputType.number, ctrlSecondNote),
                const SizedBox(
                  height: 2,
                ),
                newText('3° Bim:'),
                newTextField('Digite a nota', Icons.note_add,
                    TextInputType.number, ctrlThirdNote),
                const SizedBox(
                  height: 2,
                ),
                newText('4° Bim:'),
                newTextField('Digite a nota', Icons.note_add,
                    TextInputType.number, ctrlFourthNote),
                Text(
                  'Média: $average',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: _calculateAverage,
                    child: const Text(
                      'Calcular média',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ReportCard.routeName,
                        arguments: NotesModel(args.student, ctrlSubject.text,
                            average, classification, situation, necessaryNotes),
                      );
                    },
                    elevation: 3.0,
                    fillColor: Colors.green,
                    padding: const EdgeInsets.all(6.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
