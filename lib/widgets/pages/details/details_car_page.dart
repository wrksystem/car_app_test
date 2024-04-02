import 'package:car_app_test/widgets/pages/details/widgets/rounded_image_widget.dart';
import 'package:car_app_test/widgets/pages/details/widgets/rounded_text_widget.dart';
import 'package:car_app_test/widgets/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/card/card_model.dart';
import '../home/bloc/home_bloc.dart';

class DetailsCarPage extends StatefulWidget {
  const DetailsCarPage({super.key, required this.car, required this.image});

  final CarModel car;
  final String image;

  @override
  State<DetailsCarPage> createState() => _DetailsCarPageState();
}

class _DetailsCarPageState extends State<DetailsCarPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is CarError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        if (state is PostCardSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Valor: R\$ ${widget.car.valor.toStringAsFixed(3)}',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                RoundedImageWidget(
                  imagePath: widget.image.toString(),
                  borderRadius: 20.0,
                ),
                SizedBox(height: height * 0.020),
                RoundedTextWidget(
                  text: widget.car.nome_modelo.toString(),
                  description: 'Nome',
                ),
                RoundedTextWidget(
                  text: widget.car.ano.toString(),
                  description: 'Ano',
                ),
                RoundedTextWidget(
                  text: widget.car.combustivel.toString(),
                  description: 'Combustivel',
                ),
                RoundedTextWidget(
                  text: widget.car.num_portas.toString(),
                  description: 'Numero de portas',
                ),
                RoundedTextWidget(
                  text: widget.car.cor.toString(),
                  description: 'Cor',
                ),
                RoundedTextWidget(
                  text: 'R\$ ${widget.car.valor.toStringAsFixed(3)}',
                  description: 'Valor do veiculo',
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is CarLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      width: width * 0.9,
                      child: OutlinedButton(
                        onPressed: () {
                          CarModel car = widget.car.copyWith(
                            id: widget.car.id,
                            modelo_id: widget.car.modelo_id,
                            timestamp_cadastro: widget.car.timestamp_cadastro,
                            nome_modelo: widget.car.nome_modelo,
                            ano: widget.car.ano,
                            combustivel: widget.car.combustivel,
                            num_portas: widget.car.num_portas,
                            cor: widget.car.cor,
                              valor: double.parse(widget.car.valor.toStringAsFixed(3)),
                          );

                          context.read<HomeBloc>().add(PostLead(car));
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Eu quero'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
