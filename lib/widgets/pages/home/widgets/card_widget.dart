import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String year;
  final String image;
  final Function onTap;

  const CardWidget({
    super.key,
    required this.name,
    required this.year,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Ano: $year',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  width: width * 0.320,
                  height: height * 0.100,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return  Image.asset('assets/images/default_image.png');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
