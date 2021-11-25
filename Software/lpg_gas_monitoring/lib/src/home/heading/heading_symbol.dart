import 'package:flutter/material.dart';

class HeadingSymbol extends StatelessWidget {
  const HeadingSymbol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 120),
          child: Image(
            image:
                ResizeImage(AssetImage("assets/images/header.png"), width: 100),
          ),
        ),
      ],
    );
  }
}
