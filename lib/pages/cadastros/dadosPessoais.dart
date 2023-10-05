import 'package:flutter/material.dart';
import 'package:simobilekotlin/pages/cadastros/dependentes.dart';
import 'package:simobilekotlin/pages/cadastros/documentos.dart';
import 'package:simobilekotlin/pages/cadastros/enderecos.dart';
import 'package:simobilekotlin/pages/cadastros/pessoais.dart';

class DadosPessoais extends StatefulWidget {
  const DadosPessoais({super.key});

  @override
  State<DadosPessoais> createState() => _DadosPessoaisState();
}

class _DadosPessoaisState extends State<DadosPessoais> {
  int _selectedIndex = 0;

  final List<Widget> _telas = [
    const Pessoais(),
    const Documentos(),
    const Enderecos(),
    const Dependentes()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Pessoais"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Pessoais", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "Documentos", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.signpost),label: "Endereços", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom),label: "Dependentes", backgroundColor: Colors.blue),
        ],
        iconSize: 40,
        currentIndex: _selectedIndex,
        onTap: (selected){
          setState(() {
            _selectedIndex = selected;
          });
        },
      ),
      body: _telas[_selectedIndex],
    );
  }
}
