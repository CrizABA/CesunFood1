import 'package:flutter/material.dart';
import '/views/home_page.dart'; //Importa la pantalla a la que se navegará

class LoadPages extends StatefulWidget {
  const LoadPages({super.key});

  @override
  State<LoadPages> createState() => _LoadPagesState();
}

class _LoadPagesState extends State<LoadPages> {
  @override
  void initState() {
    super
        .initState(); //Despues de 4 segundos, realiza la acción de navegar a la pantalla
    Future.delayed(const Duration(seconds: 4)).then((_) {
      //Verifica que el widget aun este para que no tenga error
      if (mounted) {
        //Reemplaza la pantalla actual por home_page.dart
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen arriba
              Image.asset(
                'assets/iconocesun.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),

              // Indicador de carga
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 6,
                ),
              ),

              const SizedBox(height: 20), // Espacio entre indicador y texto
              // Texto "Cargando..."
              const Text(
                "Cargando...",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
