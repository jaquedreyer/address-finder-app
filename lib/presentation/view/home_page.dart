import 'package:cep_finder/presentation/widget/custom_cep_input.dart';
import 'package:cep_finder/utils/constants/images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Busca endereço'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    AppImages.logo,
                    width: 100,
                    height: 100,
                  ),
                ),
                CustomCepInputWidget(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Consultar'))
              ],
            ),
          ),
        ));
  }
}
