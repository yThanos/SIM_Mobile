import 'package:flutter/material.dart';
import 'package:simobilekotlin/pages/cadastros/dadosPessoais.dart';

class MenuCadastros extends StatefulWidget {
  const MenuCadastros({super.key});

  @override
  State<MenuCadastros> createState() => _MenuCadastrosState();
}

class _MenuCadastrosState extends State<MenuCadastros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastros"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20,5,20,5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Dados Pessoais"),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DadosPessoais()));
                        },
                        child: const Text("Ver"),
                      )
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
