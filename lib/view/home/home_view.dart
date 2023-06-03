import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ponta_flutter_test/view/home/widgets/dialogs/farm_info_dialog.dart';
import 'package:ponta_flutter_test/view/home/widgets/farm_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ponta Challenge")),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: Stack(children: [
          FarmList(),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    showDialog(context: context, builder: (context) => FarmInfoDialog());
                  },
                  child: const Text("Adicionar Fazenda"),
                ),
              )),
        ]),
      ),
    );
  }
}
