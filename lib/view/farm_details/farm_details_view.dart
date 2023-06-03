import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/animal_controller.dart';
import 'package:ponta_flutter_test/controller/farm_controller.dart';
import 'package:ponta_flutter_test/view/farm_details/widgets/animal_list_item.dart';
import 'package:ponta_flutter_test/view/farm_details/widgets/new_animal_card.dart';

class FarmDetailsView extends StatefulWidget {
  FarmDetailsView({super.key});

  @override
  State<FarmDetailsView> createState() => _FarmDetailsViewState();
}

class _FarmDetailsViewState extends State<FarmDetailsView> {
  final farmController = GetIt.instance<FarmController>();

  final animalController = GetIt.instance<AnimalController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    animalController.fetchAnimals();
    super.initState();
  }

  @override
  void dispose() {
    GetIt.instance.resetLazySingleton<AnimalController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(farmController.farmSelected?.name ?? "")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(children: [
          Column(
            children: [
              Row(
                children: [
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          const TextSpan(text: "Quantidade de animais: "),
                          TextSpan(text: animalController.animalList.length.toString(), style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("assets/icons/cow.png"),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: const NewAnimalCard(),
              ),
              Form(
                key: _formKey,
                child: Obx(
                  () => animalController.animalList.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Você não cadastrou nenhum animal até o momento!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff54595F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: animalController.animalList.length,
                          itemBuilder: (context, index) {
                            final animal = animalController.animalList[index];
                            return AnimalListItem(animal: animal);
                          },
                        ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await animalController.saveAllAnimal();
                    Get.back();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.save),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Salvar Alterações",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
