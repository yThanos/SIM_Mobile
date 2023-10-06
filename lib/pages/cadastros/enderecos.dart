import 'dart:async';

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
      "estado": "RJ",
      "cep": "12345-678",
      "ind_corresp": true
    },
    {
      "logradouro": "Rua das Limoeiras",
      "numero": "123",
      "complemento": "Apto 45",
      "bairro": "Bairro Teste",
      "cidade": "Cidade Modelo",
      "estado": "RS",
      "cep": "12345-678",
      "ind_corresp": false
    },
    {
      "logradouro": "Rua Cinco de Março",
      "numero": "123",
      "complemento": "Apto 45",
      "bairro": "Bairro Teste",
      "cidade": "Cidade Modelo",
      "estado": "SP",
      "cep": "12345-678",
      "ind_corresp": false
    }
  ];

  List<String> estados = [
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
    'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
    'SP', 'SE', 'TO'
  ];

  bool _alterando = false;

  String? _selectedEstado;
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _cidade = TextEditingController();
  final TextEditingController _bairro = TextEditingController();
  final TextEditingController _rua = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  bool _indCorresp = false;


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
                      _ends.sort((a, b){
                        if(a['ind_corresp'] == true){
                          return -1;
                        } else if(b['ind_corresp'] == true){
                          return 1;
                        } else {
                          return 0;
                        }
                      });
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_ends[index]['logradouro']}, ${_ends[index]['numero']}"),
                            ElevatedButton(onPressed: () async{

                              _cep.text = _ends[index]['cep'];
                              _cidade.text = _ends[index]['cidade'];
                              _bairro.text = _ends[index]['bairro'];
                              _rua.text = _ends[index]['logradouro'];
                              _numero.text = _ends[index]['numero'];
                              _complemento.text = _ends[index]['complemento'];
                              _selectedEstado = _ends[index]['estado'];
                              _indCorresp = _ends[index]['ind_corresp'];

                              await showDialog<void>(
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
                                                        color: (_alterando)
                                                            ?Colors.white
                                                            :Colors.grey.shade300,
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          readOnly: !_alterando,
                                                          controller: _cep,
                                                          decoration: InputDecoration(
                                                              suffixIcon: IconButton(
                                                                  onPressed: (){

                                                                  },
                                                                  icon: const Icon(Icons.search)
                                                              ),
                                                              labelText: "CEP",
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                 IgnorePointer(
                                                   ignoring: !_alterando,
                                                   child:  SizedBox(
                                                     width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                     height: MediaQuery.of(dialogContext).size.height * 0.11,
                                                     child: Card(
                                                       elevation: 2,
                                                       child: Container(
                                                         color: (_alterando)
                                                             ?Colors.white
                                                             :Colors.grey.shade300,
                                                         padding: const EdgeInsets.all(5),
                                                         child: DropdownButton<String>(
                                                           hint: const Text('Estado'),
                                                           value: _selectedEstado,
                                                           onChanged: (newValue) {
                                                             setState(() {
                                                               _selectedEstado = newValue;
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
                                                        color: (_alterando)
                                                            ?Colors.white
                                                            :Colors.grey.shade300,
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          readOnly: !_alterando,
                                                          controller: _cidade,
                                                          decoration: const InputDecoration(
                                                              labelText: "Cidade"
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        color: (_alterando)
                                                            ?Colors.white
                                                            :Colors.grey.shade300,
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          readOnly: !_alterando,
                                                          controller: _bairro,
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
                                                color: (_alterando)
                                                    ?Colors.white
                                                    :Colors.grey.shade300,
                                                padding: const EdgeInsets.all(5),
                                                child: TextFormField(
                                                  readOnly: !_alterando,
                                                  decoration: const InputDecoration(
                                                      labelText: "Logradouro"
                                                  ),
                                                  controller: _rua,
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
                                                        color: (_alterando)
                                                            ?Colors.white
                                                            :Colors.grey.shade300,
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          readOnly: !_alterando,
                                                          decoration: const InputDecoration(
                                                              labelText: "Numero"
                                                          ),
                                                          controller: _numero,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(dialogContext).size.width * 0.41,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        color: (_alterando)
                                                            ?Colors.white
                                                            :Colors.grey.shade300,
                                                        padding: const EdgeInsets.all(5),
                                                        child: TextFormField(
                                                          readOnly: !_alterando,
                                                          decoration: const InputDecoration(
                                                              labelText: "Complemento"
                                                          ),
                                                          controller: _complemento,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            IgnorePointer(
                                              ignoring: (!_alterando || _ends[index]['ind_corresp'] == true),
                                              child: Card(
                                                elevation: 2,
                                                child: Container(
                                                  width: MediaQuery.of(dialogContext).size.width * 0.82,
                                                  color: (_alterando)
                                                      ?Colors.white
                                                      :Colors.grey.shade300,
                                                  padding: const EdgeInsets.all(5),
                                                  child: CheckboxListTile(
                                                    value: _indCorresp,
                                                    onChanged: (change){
                                                      setState((){
                                                        _indCorresp = change!;
                                                      });
                                                    },
                                                    title: const Text("Endereço de corresondencia"),
                                                    controlAffinity: ListTileControlAffinity.leading,
                                                  ),
                                                ),
                                              )
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
                                                        _cep.text = _ends[index]['cep'];
                                                        _cidade.text = _ends[index]['cidade'];
                                                        _bairro.text = _ends[index]['bairro'];
                                                        _rua.text = _ends[index]['logradouro'];
                                                        _numero.text = _ends[index]['numero'];
                                                        _complemento.text = _ends[index]['complemento'];
                                                        _selectedEstado = _ends[index]['estado'];
                                                        _indCorresp = _ends[index]['ind_corresp'];
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
                                                        _ends[index]['cep'] = _cep.text;
                                                        _ends[index]['cidade'] = _cidade.text;
                                                        _ends[index]['bairro'] = _bairro.text;
                                                        _ends[index]['logradouro'] = _rua.text;
                                                        _ends[index]['numero'] = _numero.text;
                                                        _ends[index]['complemento'] = _complemento.text;
                                                        _ends[index]['estado'] = _selectedEstado;
                                                        _ends[index]['ind_corresp'] = _indCorresp;
                                                        if(_indCorresp == true){
                                                          for(int i = 0; i< _ends.length; i++){
                                                            if(i != index){
                                                              _ends[i]['ind_corresp'] = false;
                                                            }
                                                          }
                                                        }
                                                        setState((){
                                                          _alterando = false;
                                                        });
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
                                                        _selectedEstado = null;
                                                        _cep.clear();
                                                        _cidade.clear();
                                                        _bairro.clear();
                                                        _rua.clear();
                                                        _numero.clear();
                                                        _complemento.clear();
                                                        _indCorresp = false;

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
                              setState(() {

                              });
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
                onPressed: () async{
                  await showDialog<void>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        insetPadding: const EdgeInsets.all(10),
                        title: const Text('Cadastro de Endereço'),
                        content: StatefulBuilder(builder: (dialogContext, setState){
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
                                              controller: _cep,
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
                                        width: MediaQuery.of(dialogContext).size.width * 0.41,
                                        height: MediaQuery.of(dialogContext).size.height * 0.11,
                                        child: Card(
                                          elevation: 2,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: DropdownButton<String>(
                                              hint: const Text('Estado'),
                                              value: _selectedEstado,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedEstado = newValue;
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
                                              controller: _cidade,
                                              decoration: const InputDecoration(
                                                  labelText: "Cidade"
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(dialogContext).size.width * 0.41,
                                        child: Card(
                                          elevation: 2,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: TextFormField(
                                              controller: _bairro,
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
                                      controller: _rua,
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
                                              controller: _numero,
                                              decoration: const InputDecoration(
                                                  labelText: "Numero"
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(dialogContext).size.width * 0.41,
                                        child: Card(
                                          elevation: 2,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: TextFormField(
                                              controller: _complemento,
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
                                CheckboxListTile(
                                  value: _indCorresp,
                                  onChanged: (change){
                                    setState((){
                                      _indCorresp = change!;
                                    });
                                  },
                                  title: const Text("Endereço de corresondencia"),
                                  controlAffinity: ListTileControlAffinity.leading,
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
                                            _selectedEstado = null;
                                            _cep.clear();
                                            _cidade.clear();
                                            _bairro.clear();
                                            _rua.clear();
                                            _numero.clear();
                                            _complemento.clear();
                                            _indCorresp = false;
                                            Navigator.of(dialogContext).pop();
                                          },
                                          child: const Text("Cancelar"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(dialogContext).size.width * 0.3,
                                        child: ElevatedButton(
                                          onPressed: (){
                                            if(_indCorresp == true){
                                              for(int i = 0; i < _ends.length; i++){
                                                _ends[i]['ind_corresp'] = false;
                                              }
                                            }
                                            setState(() {
                                              _ends.add({
                                                "logradouro": _rua.text,
                                                "numero": _numero.text,
                                                "complemento": _complemento.text,
                                                "bairro": _bairro.text,
                                                "cidade": _cidade.text,
                                                "estado": _selectedEstado,
                                                "cep": _cep.text,
                                                "ind_corresp": _indCorresp
                                              });
                                            });

                                            print(_ends);

                                            Navigator.of(dialogContext).pop();

                                          },
                                          child: const Text("Confirmar"),
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
                  setState(() {

                  });
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
