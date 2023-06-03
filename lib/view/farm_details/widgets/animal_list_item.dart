import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/animal_controller.dart';
import 'package:ponta_flutter_test/model/animal.dart';

class AnimalListItem extends StatelessWidget {
  AnimalListItem({super.key, required this.animal});
  final Animal animal;
  final tagController = TextEditingController();
  final controller = GetIt.instance<AnimalController>();
  @override
  Widget build(BuildContext context) {
    tagController.text = animal.tagId;
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        side: BorderSide(
          color: Color(0xffA3C72E),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "id: ${animal.id}",
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Tag: ",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Flexible(
                          // width: 200,
                          child: TextFormField(
                            controller: tagController,
                            onChanged: (text) => animal.tagId = text,
                            maxLength: 15,
                            validator: (text) {
                              if (text != null && (text.isEmpty || text.length < 15)) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: "ex:123456789101112",
                              counterText: "",
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.deleteAnimal(animal.id);
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    size: 32,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
