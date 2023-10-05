import 'package:flutter/material.dart';
import 'package:simobilekotlin/login.dart';
import 'package:simobilekotlin/pages/cadastros/menuCadastros.dart';

import 'aniversariantes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool hasPfp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CMSP"),
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
      backgroundColor: Colors.lightBlueAccent,
      body:  Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text("Fulano da Silva", style: TextStyle(fontSize: 24)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: InkWell(
                              onTap: (){

                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(16),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Icon(
                                      Icons.punch_clock,
                                      size: 90,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10),
                                    Text("00:00 horas", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                    Text("trabalhadas hoje!", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: InkWell(
                              onTap: (){

                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(16),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Icon(
                                      Icons.list,
                                      size: 90,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10),
                                    Text("Menus", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                    //Text("do mês!", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuCadastros()));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.blue,
                                margin: const EdgeInsets.all(16),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Icon(
                                      Icons.settings,
                                      size: 90,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 10),
                                    Text("Dados", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                    Text("cadastrais", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Aniversariantes()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.blue,
                              margin: const EdgeInsets.all(16),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Icon(
                                    Icons.cake,
                                    size: 90,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Aniversariantes", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                  Text("do mês!", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.transparent,
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg"),
            ),
          )
        ],
      ),
    );
  }
}

/*
InkWell(
onTap: (){

},
child: Container(
padding: EdgeInsets.all(10),
child: Icon(Icons.account_box_outlined),
),
)
*/