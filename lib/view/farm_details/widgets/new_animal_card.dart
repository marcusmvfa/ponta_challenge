import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ponta_flutter_test/view/farm_details/widgets/dialogs/add_animal_dialog.dart';

class NewAnimalCard extends StatelessWidget {
  const NewAnimalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          side: BorderSide(
            width: 2,
            color: Colors.blueAccent,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              // Expanded(
              //   flex: 6,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "id: 12345",
              //         style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              //       ),
              //       Row(
              //         children: [
              //           const Text(
              //             "Tag: ",
              //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              //           ),
              //           Flexible(
              //             // width: 200,
              //             child: TextFormField(
              //               keyboardType: TextInputType.number,
              //               decoration: const InputDecoration(
              //                 contentPadding: EdgeInsets.zero,
              //                 hintText: "ex:123456789101112",
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              // Flexible(
              //   flex: 1,
              //   child:
              // InkWell(
              //   onTap: () {},
              //   child:
              // Center(
              //   child: Image.asset(
              //     'assets/icons/plus.png',
              //     color: Colors.blue,
              //     width: 32,
              //   ),
              // ),
              // ),
              // ),
              Icon(
                Icons.add_box_outlined,
                color: Colors.blue,
                size: 32,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Adicionar novo animal",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      onTap: () => showDialog(context: context, builder: (context) => AddAnimalDialog()),
    );
  }
}
