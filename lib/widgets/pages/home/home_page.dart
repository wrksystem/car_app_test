import 'package:car_app_test/widgets/pages/details/details_car_page.dart';
import 'package:car_app_test/widgets/pages/home/bloc/home_bloc.dart';
import 'package:car_app_test/widgets/pages/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/card/card_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CarModel> cars = [];

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is CarError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is CarLoading) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        } else if (state is CarLoaded) {
          cars = state.cars;
          return Scaffold(
            appBar: AppBar(title: const Text(
              "Lista de carros", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.blue,
            centerTitle: true,
            automaticallyImplyLeading: false,),
            body: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                String imagePath = 'assets/images/${cars[index].nameModel}.png';
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardWidget(
                    name: cars[index].nameModel.toString(),
                    year: cars[index].year.toString(),
                    image: imagePath,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsCarPage(
                                car: cars[index].copyWith(
                                  image: imagePath,
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else {
          return Container(); // Return an empty container for other states
        }
      },
    );
  }

  void loadCards() {
    context.read<HomeBloc>().add(FetchCars());
  }
}