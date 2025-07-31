import 'package:flutter/material.dart';

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  // Productos en el carrito (puedes cambiarlos más adelante)
  final List<Map<String, dynamic>> productos = [
    {
      'nombre': 'Sabritas Clásicas',
      'precio': 20.0,
      'cantidad': 1,
      'imagen': 'assets/sabritas.png',
    },
    {
      'nombre': 'Doritos',
      'precio': 20.0,
      'cantidad': 2,
      'imagen': 'assets/doritos.png',
    },
  ];

  void incrementarCantidad(int index) {
    setState(() {
      productos[index]['cantidad']++;
    });
  }

  void disminuirCantidad(int index) {
    setState(() {
      if (productos[index]['cantidad'] > 1) {
        productos[index]['cantidad']--;
      }
    });
  }

  double calcularTotal() {
    double total = 0;
    for (var producto in productos) {
      total += producto['precio'] * producto['cantidad'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading: Image.network(producto['imagen'], width: 50),
                      title: Text(producto['nombre']),
                      subtitle: Text('Precio: \$${producto['precio']}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => disminuirCantidad(index),
                              ),
                              Text('${producto['cantidad']}'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => incrementarCantidad(index),
                              ),
                            ],
                          ),
                          Text(
                            'Total: \$${(producto['precio'] * producto['cantidad']).toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${calcularTotal().toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Compra finalizada')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Finalizar Compra'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
