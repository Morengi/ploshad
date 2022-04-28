import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());


class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площадей',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FormPage(),
    );
  }
}



class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final heightContr = TextEditingController();
  final widthContr = TextEditingController();
  String MessageText = 'Задайте параметры';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор площади'),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: widthContr,
                decoration: const InputDecoration(labelText: 'Ширина (мм): '),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) => value!.isEmpty ? 'Задайте ширину' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: heightContr,
                decoration: const InputDecoration(labelText: 'Высота (мм): '),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) => value!.isEmpty ? 'Задайте высоту' : null,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _resultForm(),
                child: const Text('Вычислить'),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  MessageText,
                  style: const TextStyle(fontSize: 30),
                ),
              )
            ],
          )),
    );
  }

  void _resultForm() {
    if (_formKey.currentState!.validate()) {
      int S = int.parse(heightContr.text) * int.parse(widthContr.text);
      setState(() {
        MessageText = 'S = ${widthContr.text} * ${heightContr.text} = $S';
      });
    } else {
      setState(() {
        MessageText = 'Задайте параметры';
      });
    }
  }
}
