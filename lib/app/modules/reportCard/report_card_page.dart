import 'package:challenge65/app/models/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportCard extends StatefulWidget {
  const ReportCard({super.key});

  static const routeName = '/reportCard';

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NotesModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Boletim',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
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
        child: Column(
          children: [
            const Text(''),
            _padding('Aluno:', args.student),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            _padding('Disciplina', args.subject),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            _padding('Média:', '${args.average}'),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            _padding('Classificação:', args.classification),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            _padding('Situação:', args.situation),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            _padding('Notas p/ aprovação:', '${args.necessaryNotes}'),
            const Divider(
              thickness: 2,
              height: 3,
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Envia via whatsapp',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _text(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  _padding(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(text1),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(text2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
