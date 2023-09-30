import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? pokemon1;
  void _changePokemon() {
    setState(() {
        pokemon1="ditto";
    });
  }
Pokemon? pokemon;

Future<Pokemon?> getPokemon() async {
  // Verifica si pokemon es nulo
  if (pokemon != null) {
    // Realiza la solicitud a la API
    final response = await pokemon?.get(
      'https://pokeapi.co/api/v2/pokemon/${pokemon1}',
    );

    // Si la respuesta es exitosa, devuelve el Pokémon
    if (response?.statusCode == 200) {
      return pokemon;
    } else {
      // Si la respuesta no es exitosa, devuelve nulo
      return null;
    }
  } else {
    // Si pokemon es nulo, devuelve nulo
    return null;
  }
}
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changePokemon,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
