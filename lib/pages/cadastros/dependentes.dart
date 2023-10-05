import 'package:flutter/material.dart';

class Dependentes extends StatefulWidget {
  const Dependentes({super.key});

  @override
  State<Dependentes> createState() => _DependentesState();
}

class _DependentesState extends State<Dependentes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Dpendentes", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
