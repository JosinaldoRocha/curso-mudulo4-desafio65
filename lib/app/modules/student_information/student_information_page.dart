import 'package:challenge65/app/components/text.dart';
import 'package:challenge65/app/models/student_information_model.dart';
import 'package:challenge65/app/components/text_field.dart';
import 'package:challenge65/app/modules/notes/notes_page.dart';
import 'package:flutter/material.dart';

class StudentInformation extends StatefulWidget {
  const StudentInformation({super.key});

  @override
  State<StudentInformation> createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
  @override
  Widget build(BuildContext context) {
    final ctrllStudent = TextEditingController();
    final ctrllShift = TextEditingController();
    final ctrllGang = TextEditingController();
    final ctrllYear = TextEditingController();
    final ctrllLevel = TextEditingController();

    cleanStudentInformation() {
      setState(() {
        ctrllStudent.text = '';
        ctrllLevel.text = '';
        ctrllYear.text = '';
        ctrllGang.text = '';
        ctrllShift.text = '';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do aluno(a)'),
        actions: [
          IconButton(
            onPressed: cleanStudentInformation,
            icon: const Icon(Icons.cleaning_services_outlined),
          ),
        ],
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                newText('Nome do aluno(a):'),
                newTextFormField('Digite o nome do aluno', Icons.person,
                    TextInputType.text, ctrllStudent),
                const SizedBox(
                  height: 5,
                ),
                newText('Nível de ensino:'),
                newTextFormField('Digite o nível de ensino', Icons.person,
                    TextInputType.text, ctrllLevel),
                const SizedBox(
                  height: 5,
                ),
                newText('Ano:'),
                newTextFormField('Digite o ano', Icons.person,
                    TextInputType.number, ctrllYear),
                const SizedBox(
                  height: 5,
                ),
                newText('Turma:'),
                newTextFormField('Digite a turma', Icons.person,
                    TextInputType.text, ctrllGang),
                const SizedBox(
                  height: 5,
                ),
                newText('Turno'),
                newTextFormField('Digite o turno', Icons.person,
                    TextInputType.text, ctrllShift),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        NotesPage.roteName,
                        arguments: StudentInformationModel(ctrllStudent.text),
                      );
                    },
                    child: const Text(
                      'Atribuir notas',
                      style: TextStyle(fontSize: 20),
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
