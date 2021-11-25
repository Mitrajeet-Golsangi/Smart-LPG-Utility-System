import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.statusCode}) : super(key: key);
  final String statusCode;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("OOPS! Server Responded with status : $statusCode"),
      ),
      const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Icon(Icons.error_outline_outlined)),
      const SizedBox(height: 30),
    ]);
  }
}
