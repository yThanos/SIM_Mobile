import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:simobilekotlin/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    _meuInit();
    super.initState();
  }
  _meuInit() async{

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =  canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if(canAuthenticate){
      bool isAthenticated = await auth.authenticate(localizedReason: "Entre no app usando biometria");
      if (isAthenticated){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));
      }else{
        print("Não autenticou");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));
      }
    }else{
      print("Não tem biometria");
    }
  }

  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CMSP"),
        backgroundColor: Colors.blueAccent
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Icon(
                  Icons.logo_dev,
                  size: MediaQuery.of(context).size.width * 0.45,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "CPF",
                    ),
                  ),
                  TextFormField(
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      label: const Text("Senha"),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                        icon: Icon( _obscure ? Icons.visibility : Icons.visibility_off ),
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));
                          },
                          child: const Text("Logar")
                      ),
                      //ElevatedButton(onPressed: (){}, child: Text(""))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
