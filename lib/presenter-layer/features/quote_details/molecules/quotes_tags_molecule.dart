import 'package:flutter/material.dart';

class QuotesTagsMolecule extends StatelessWidget {
  final String tags;

  const QuotesTagsMolecule({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Text(
            tags,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
