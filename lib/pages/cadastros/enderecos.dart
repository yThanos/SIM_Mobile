import 'package:flutter/material.dart';

class Enderecos extends StatefulWidget {
  const Enderecos({super.key});

  @override
  State<Enderecos> createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  final List<Map<String,dynamic>> _ends = [
    {
      "logradouro": "Rua Exemplo",
      "numero": "123",
      "complemento": "Apto 45",
      "bairro": "Bairro Teste",
      "cidade": "Cidade Modelo",
      "estado": "Estado de Exemplo",
      "cep": "12345-678",
      "pais": "País Fictício",
      "ind_corresp": true
    },
    {
      "logradouro": "Rua das Limoeiras",
      "numero": "123",
      "complemento": "Apto 45",
      "bairro": "Bairro Teste",
      "cidade": "Cidade Modelo",
      "estado": "Estado de Exemplo",
      "cep": "12345-678",
      "pais": "País Fictício",
      "ind_corresp": false
    },
    {
      "logradouro": "Rua Cinco de Março",
      "numero": "123",
      "complemento": "Apto 45",
      "bairro": "Bairro Teste",
      "cidade": "Cidade Modelo",
      "estado": "Estado de Exemplo",
      "cep": "12345-678",
      "pais": "País Fictício",
      "ind_corresp": false
    }
  ];

  List<String> estados = [
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
    'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
    'SP', 'SE', 'TO'
  ];

  bool _alterando = false;
  String? selectedEstado;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Stack(

          children: [
            const Text("Endereços", style: TextStyle(fontSize: 24)),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: _ends.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_ends[index]['logradouro']}, ${_ends[index]['numero']}"),
                            ElevatedButton(onPressed: (){
                              showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    insetPadding: const EdgeInsets.all(10),
                                    title: const Text('Alterar endereço'),
                                    content: StatefulBuilder(builder: (context, setState){
                                      return SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(dialogContext).size.width,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              suffixIcon: IconButton(
                                                                  onPressed: (){

                                                                  },
                                                                  icon: const Icon(Icons.search)
                                                              ),
                                                              labelText: "CEP"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.42,
                                                    height: MediaQuery.of(dialogContext).size.height * 0.11,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: DropdownButton<String>(
                                                          hint: const Text('Estado'),
                                                          value: selectedEstado,
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              selectedEstado = newValue;
                                                            });
                                                          },
                                                          items: estados.map<DropdownMenuItem<String>>((String value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value,
                                                              child: Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(dialogContext).size.width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          decoration: const InputDecoration(
                                                              labelText: "Cidade"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.42,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          decoration: const InputDecoration(
                                                              labelText: "Bairro"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            Card(
                                              elevation: 2,
                                              child: Container(
                                                padding: const EdgeInsets.all(5),
                                                child: TextFormField(
                                                  decoration: const InputDecoration(
                                                      labelText: "Logradouro"
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(dialogContext).size.width,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          decoration: const InputDecoration(
                                                              labelText: "Numero"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.42,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          decoration: const InputDecoration(
                                                              labelText: "Complemento"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            (_alterando)
                                                ?SizedBox(
                                              width: MediaQuery.of(dialogContext).size.width,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.3,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                                                      ),
                                                      onPressed: (){
                                                        setState((){
                                                          _alterando = false;
                                                        });
                                                      },
                                                      child: const Text("Cancelar"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.3,
                                                    child: ElevatedButton(
                                                      onPressed: (){

                                                      },
                                                      child: const Text("Confirmar"),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                                :SizedBox(
                                              width: MediaQuery.of(dialogContext).size.width,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.3,
                                                    child: ElevatedButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          _alterando = true;
                                                        });
                                                      },
                                                      child: const Text("Alterar"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.3,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                                                      ),
                                                      onPressed: (){
                                                        Navigator.of(dialogContext).pop();
                                                      },
                                                      child: const Text("Fechar"),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                                  );
                                },
                              );
                            }, child: const Icon(Icons.edit))
                          ],
                        ),
                        leading: (_ends[index]['ind_corresp'])
                            ?const CircleAvatar(backgroundColor: Colors.green, radius: 10)
                            :const CircleAvatar(backgroundColor: Colors.grey, radius: 10),
                      );
                    }
                ),
              ),
            ),
            Positioned(
              left: 100,
              right: 100,
              bottom: 150,
              child: ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        insetPadding: const EdgeInsets.all(10),
                        title: const Text('Cadastro de Endereço'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(dialogContext).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.41,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  onPressed: (){

                                                  },
                                                  icon: const Icon(Icons.search)
                                              ),
                                                labelText: "CEP"
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.42,
                                      height: MediaQuery.of(dialogContext).size.height * 0.11,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: DropdownButton<String>(
                                            hint: const Text('Estado'),
                                            value: selectedEstado,
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedEstado = newValue;
                                              });
                                            },
                                            items: estados.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(dialogContext).size.width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.41,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                labelText: "Cidade"
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.42,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                labelText: "Bairro"
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Card(
                                elevation: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: "Logradouro"
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(dialogContext).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.41,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                labelText: "Numero"
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.42,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                labelText: "Complemento"
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(dialogContext).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.3,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                                        ),
                                        onPressed: (){
                                          Navigator.of(dialogContext).pop();
                                        },
                                        child: const Text("Cancelar"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(dialogContext).size.width * 0.3,
                                      child: ElevatedButton(
                                        onPressed: (){

                                        },
                                        child: const Text("Confirmar"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // actions: <Widget>[
                        //   TextButton(
                        //     child: const Text('Fechar'),
                        //     onPressed: () {
                        //       Navigator.of(dialogContext).pop();
                        //     },
                        //   ),
                        // ],
                      );
                    },
                  );
                },
                child: const Text("Adicionar novo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
