import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/animal_controller.dart';

class AddAnimalDialog extends StatelessWidget {
  AddAnimalDialog({super.key});
  final controller = GetIt.instance<AnimalController>();
  final tagController = TextEditingController();

  final GlobalKey<FormState> _animalDialogKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Novo animal"),
      content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Tag do animal",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Form(
          key: _animalDialogKey,
          child: TextFormField(
            controller: tagController,
            keyboardType: TextInputType.number,
            maxLength: 15,
            decoration: const InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.only(left: 8, right: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffA3C72E)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffA3C72E)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              hintText: "123456789101112",
            ),
            validator: (text) {
              if (text != null && (text.isEmpty || text.length < 15)) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
        ),
      ]),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (_animalDialogKey.currentState!.validate()) {
              await controller.addAnimal(tagController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            "Salvar",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
