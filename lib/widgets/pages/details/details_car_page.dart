import 'package:car_app_test/widgets/pages/details/widgets/rounded_image_widget.dart';
import 'package:car_app_test/widgets/pages/details/widgets/rounded_text_widget.dart';
import 'package:car_app_test/widgets/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/card/card_model.dart';

class DetailsCarPage extends StatefulWidget {
  const DetailsCarPage({super.key, required this.car});

  final CarModel car;

  @override
  State<DetailsCarPage> createState() => _DetailsCarPageState();
}

class _DetailsCarPageState extends State<DetailsCarPage> {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Valor: R\$ ${widget.car.value.toStringAsFixed(3)}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             RoundedImageWidget(
              imagePath: widget.car.image.toString(),
              borderRadius: 20.0,
            ),
             SizedBox(height: height * 0.020),
             RoundedTextWidget(
              text: widget.car.nameModel.toString(),
              description: 'Nome',
            ),
             RoundedTextWidget(
              text: widget.car.year.toString(),
              description: 'Ano',
            ),
             RoundedTextWidget(
              text: widget.car.fuel.toString(),
              description: 'Combustivel',
            ),
             RoundedTextWidget(
               text: widget.car.numDoors.toString(),
              description: 'Numero de portas',
            ),
             RoundedTextWidget(
              text: widget.car.color.toString(),
              description: 'Cor',
            ),
             RoundedTextWidget(
              text: 'R\$ ${widget.car.value.toStringAsFixed(3)}',
              description: 'Valor do veiculo',
            ),
              SizedBox(
                width: width * 0.9,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage()
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Comprar'),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}
