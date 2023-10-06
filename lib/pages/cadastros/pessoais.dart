import 'package:flutter/material.dart';

class Pessoais extends StatefulWidget {
  const Pessoais({super.key});

  @override
  State<Pessoais> createState() => _PessoaisState();
}

class _PessoaisState extends State<Pessoais> {
  final Map<String, dynamic> _pessoa = {
    "nome": "Vitor Fraporti",
    "social": "",
    "sexo": "M",//M false, F true
    "cpf": "03462629093",
    "data": "2023-02-05",
    "nis": "123456",
    "estado": "Solteiro",
    "pai": "Pai",
    "mae": "Mãe",
    "nacionalidade": "Brasileiro",
    "escolaridade": "Ensino Médio"
  };
  bool _alterando = false;
  DateTime _nascimento = DateTime(2023);
  bool _sex = false;
  String? _estado;
  String? _nacionalidade;
  String? _escolaridade;
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _social = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _nis = TextEditingController();
  final TextEditingController _pai = TextEditingController();
  final TextEditingController _mae = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init(){
    _nome.text = _pessoa['nome'];
    _social.text = _pessoa['social'];
    _cpf.text = _pessoa['cpf'];
    _nis.text = _pessoa['nis'];
    _pai.text = _pessoa['pai'];
    _mae.text = _pessoa['mae'];
    _sex = (_pessoa['sexo'] == "F");
    _estado = _pessoa['estado'];
    _nacionalidade = _pessoa['nacionalidade'];
    _escolaridade = _pessoa['escolaridade'];
    _nascimento = DateTime.parse(_pessoa['data']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.25,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pessoais", style: TextStyle(fontSize: 24)),
            Card(
              elevation: 2,
              child: Container(
                color: (_alterando)
                    ?Colors.white
                    :Colors.grey.shade300,
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: _nome,
                  readOnly: !_alterando,
                  decoration: const InputDecoration(
                      labelText: "Nome Completo"
                  ),
                ),
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
                  controller: _social,
                  readOnly: !_alterando,
                  decoration: const InputDecoration(
                      labelText: "Nome Social"
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.116,
              child: Card(
                elevation: 2,
                child: IgnorePointer(
                  ignoring: !_alterando,
                  child: Container(
                    color: (_alterando)
                        ?Colors.white
                        :Colors.grey.shade300,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sexo:"),
                        Row(
                          children: [
                            Radio<bool>(
                              groupValue: _sex,
                              value: false,
                              onChanged: (change){
                                setState(() {
                                  _sex = change!;
                                });
                              },
                            ),
                            const Text("Masculino"),
                            Radio<bool>(
                              groupValue: _sex,
                              value: true,
                              onChanged: (change){
                                setState(() {
                                  _sex = change!;
                                });
                              },
                            ),
                            const Text("Feminino"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    color: (_alterando)
                        ?Colors.white
                        :Colors.grey.shade300,
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: _cpf,
                      readOnly: !_alterando,
                      decoration: const InputDecoration(
                          labelText: "CPF"
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap:(_alterando)? () async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      var date = await showDatePicker(context: context, initialDate: _nascimento, firstDate: DateTime(1900), lastDate: DateTime(2100));
                      if (date != null){
                        _nascimento = date;
                      }
                    }: (){},
                    child: Card(
                      elevation: 2,
                      child: Container(
                          color: (_alterando)
                              ?Colors.white
                              :Colors.grey.shade300,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Data de nascimento:"),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${_nascimento.day.toString().padLeft(2, '0')}/${_nascimento.month.toString().padLeft(2, '0')}/${_nascimento.year}"),
                                    const Icon(Icons.calendar_month)
                                  ],
                                ),
                              ]
                          )
                      ),
                    )
                )
              ],
            ),
            Card(
              elevation: 2,
              child: Container(
                color: (_alterando)
                    ?Colors.white
                    :Colors.grey.shade300,
                padding: const EdgeInsets.all(5),
                child: TextFormField(
                  controller: _nis,
                  readOnly: !_alterando,
                  decoration: const InputDecoration(
                      labelText: "NIS (PIS/PASEP/NIT)"
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                  color: (_alterando)
                      ?Colors.white
                      :Colors.grey.shade300,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                child: IgnorePointer(
                  ignoring: !_alterando,
                  child: DropdownButton<String>(
                    hint: const Text('Estado Civil'),
                    value: _estado,
                    onChanged: (newValue) {
                      setState(() {
                        _estado = newValue;
                      });
                    },
                    items: <String>[
                      'Solteiro',
                      'Casado',
                      'Divorciado',
                      'Viúvo',
                      'União Estável',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
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
                  controller: _pai,
                  readOnly: !_alterando,
                  decoration: const InputDecoration(
                      labelText: "Nome do Pai"
                  ),
                ),
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
                  controller: _mae,
                  readOnly: !_alterando,
                  decoration: const InputDecoration(
                      labelText: "Nome da Mãe"
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                  color: (_alterando)
                      ?Colors.white
                      :Colors.grey.shade300,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(5),
                  child: IgnorePointer(
                    ignoring: !_alterando,
                    child: DropdownButton<String>(
                      hint: const Text('Nacionalidade'),
                      value: _nacionalidade,
                      onChanged: (newValue) {
                        setState(() {
                          _nacionalidade = newValue;
                        });
                      },
                      items: <String>[
                        'Brasileiro',
                        'Ingles',
                        'Alemão',
                        'Italiano',
                        'Argentino',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
              ),
            ),
            Card(
              elevation: 2,
              child: Container(
                  color: (_alterando)
                      ?Colors.white
                      :Colors.grey.shade300,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(5),
                  child: IgnorePointer(
                    ignoring: !_alterando,
                    child: DropdownButton<String>(
                      hint: const Text('Escolaridade'),
                      value: _escolaridade,
                      onChanged: (newValue) {
                        setState(() {
                          _escolaridade = newValue;
                        });
                      },
                      items: <String>[
                        'Ensino Fundamental',
                        'Ensino Médio',
                        'Ensino Superior',
                        'Pós Graduação',
                        'Analfabeto',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
              ),
            ),









            (_alterando)
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){
                    _init();
                    setState(() {
                      _alterando = false;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                  ),
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text("Tem certeza?"),
                        content: const Text("Você tem certeza que deseja alterar os dados?"),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                            ),
                            child: const Text("Cancelar"),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              _pessoa['nome'] = _nome.text;
                              _pessoa['social'] = _social.text;
                              _pessoa['cpf'] = _cpf.text;
                              _pessoa['nis'] = _nis.text;
                              _pessoa['pai'] = _pai.text;
                              _pessoa['mae'] = _mae.text;
                              _pessoa['sexo']=_sex?"F":"M";
                              _pessoa['estado'] = _estado;
                              _pessoa['nacionalidade'] = _nacionalidade;
                              _pessoa['escolaridade'] = _escolaridade;
                              _pessoa['data'] = "${_nascimento.year}-${_nascimento.month.toString().padLeft(2, '0')}-${_nascimento.day.toString().padLeft(2, '0')}";
                              setState(() {
                                _alterando = false;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text("Confirmar"),
                          )
                        ],
                      );
                    });
                  },
                  child: const Text("Confirmar"),
                )
              ],
            )
                : ElevatedButton(
              onPressed: (){
                setState(() {
                  _alterando = true;
                });
              },
              child: const Text("Alterar"),
            )
          ],
        ),
      ),
    );
  }
}
