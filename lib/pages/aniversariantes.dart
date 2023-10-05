import 'package:flutter/material.dart';

import '../login.dart';

class Aniversariantes extends StatelessWidget {
  const Aniversariantes({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> aniversarios = [
      {"nome": "Vitor Fraporti", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "05/02"},
      {"nome": "Rhaun Sassi", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "27/03"},
      {"nome": "Angelo Marramon", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "06/11"},
      {"nome": "André Miranda", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "28/05"},
      {"nome": "Crisitna Ribeiro", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "18/01"},
      {"nome": "Carla Fonseca", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "05/01"},
      {"nome": "Carla Brum", "img": "https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg", "data": "15/03"},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aniversariantes"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: aniversarios.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(aniversarios[index]['nome']),
              subtitle: Text(aniversarios[index]['data']),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(aniversarios[index]['img']),
              ),
            );
          },
        ),
      ),
    );
  }
}
