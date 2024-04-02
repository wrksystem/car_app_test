import 'package:flutter/material.dart';

class RoundedTextWidget extends StatelessWidget {
  final String text;
  final String description;

  const RoundedTextWidget({
    Key? key,
    required this.text,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue,
        ),
        child: Row(
          children: [
            Text(
             '$description:',
              style: TextStyle(
                fontSize: height * 0.020,
                color: Colors.white,
              ),
            ),
            SizedBox(width: width * 0.008),
            Text(
              text,
              style: TextStyle(
                fontSize: height * 0.020,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}