import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: Stack(
        children: [
          // Container(
          //   margin: const EdgeInsets.only(
          //     left: 10,
          //   ),
          //   width: 38,
          //   decoration: BoxDecoration(
          //     color: const Color.fromARGB(
          //       255,
          //       250,
          //       45,
          //       108,
          //     ),
          //     borderRadius: BorderRadius.circular(7),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.only(
          //     right: 10,
          //   ),
          //   width: 38,
          //   decoration: BoxDecoration(
          //     color: const Color.fromARGB(
          //       255,
          //       32,
          //       211,
          //       234,
          //     ),
          //     borderRadius: BorderRadius.circular(7),
          //   ),
          // ),
          Center(
            child: Container(
              
              height: double.infinity,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: Image.asset(
                "assets/images/logo.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}

