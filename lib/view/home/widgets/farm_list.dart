import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/farm_controller.dart';
import 'package:ponta_flutter_test/view/home/widgets/farm_list_item.dart';

class FarmList extends StatefulWidget {
  FarmList({super.key});

  @override
  State<FarmList> createState() => _FarmListState();
}

class _FarmListState extends State<FarmList> {
  final controller = GetIt.instance<FarmController>();
  @override
  void initState() {
    controller.fetchFarms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.farmList.isEmpty
          ? const Center(
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
            )
          : ListView.builder(
              itemCount: controller.farmList.length,
              itemBuilder: (context, index) {
                final farm = controller.farmList[index];
                return FarmListItem(farm: farm);
              },
            ),
    );
  }
}
