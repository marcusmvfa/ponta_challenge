import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/farm_controller.dart';

class FarmInfoDialog extends StatelessWidget {
  FarmInfoDialog({super.key});
  final controller = GetIt.instance<FarmController>();
  final TextEditingController farmNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: double.maxFinite,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "Adicionar fazenda",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ]),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Nome da fazenda",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: farmNameController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 8, right: 8),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA3C72E)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA3C72E)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintText: "Fazenda Ponta...",
          ),
        ),
      ]),
      actions: [
        ElevatedButton(
          onPressed: () {
            controller.addFarm(farmNameController.text);
            Navigator.of(context).pop();
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
