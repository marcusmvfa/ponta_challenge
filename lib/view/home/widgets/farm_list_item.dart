import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/animal_controller.dart';
import 'package:ponta_flutter_test/controller/farm_controller.dart';
import 'package:ponta_flutter_test/model/farm.dart';
import 'package:ponta_flutter_test/view/farm_details/farm_details_view.dart';

class FarmListItem extends StatelessWidget {
  FarmListItem({super.key, required this.farm});
  final Farm farm;
  final controller = GetIt.instance<FarmController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          side: BorderSide(
            color: Color(0xffA3C72E),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(
                Icons.gite_rounded,
                size: 36,
                color: Color(0xff54595F),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farm.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PopupMenuButton<String>(
                child: const Icon(
                  Icons.more_vert,
                  color: Color(0xffA3C72E),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Deletar",
                    child: const Text('Deletar'),
                    onTap: () => controller.deleteFarm(farm.id),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        controller.farmSelected = farm;
        Get.to(() => FarmDetailsView(), arguments: {'farmId': farm.id});
      },
    );
  }
}
