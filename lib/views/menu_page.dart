import 'package:flutter/material.dart';
import '/models/item_model.dart';
import '/components/item_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Listas de productos (simulados)
  final List<ItemModel> sabritas = [
    ItemModel(title: "Sabritas Clásicas", image: "assets/sabritas.png", precio: 20.0),
    ItemModel(title: "Doritos", image: "assets/doritos.png", precio: 20.0),
    ItemModel(title: "Ruffles", image: "assets/ruffles.png", precio: 20.0),
    ItemModel(title: "Cheetos", image: "assets/cheetos.png", precio: 18.0),
  ];

  final List<ItemModel> refrescos = [
    ItemModel(title: "Coca-Cola", image: "assets/coca.png", precio: 20.0),
    ItemModel(title: "Pepsi", image: "assets/pepsi.png", precio: 18.0),
    ItemModel(title: "Fanta", image: "assets/fanta.png", precio: 18.0),
    ItemModel(title: "7 Up", image: "assets/7up.png", precio: 18.0),
  ];
  final List<ItemModel> galletas = [
    ItemModel(title: "Emperador Senzo", image: "assets/senzo.png", precio: 18.0),
    ItemModel(title: "Gamesa Maravillas", image: "assets/maravillas.png", precio: 20.0),
    ItemModel(title: "Gamesa Florentinas", image: "assets/florentinas.png", precio: 20.0),
    ItemModel(title: "Gamesa Barras de coco", image: "assets/bacoco.png", precio: 15.00),
  ];
  final List<ItemModel> comidas = [
    ItemModel(title: "Chilaquiles", image: "assets/chilaquiles.png", precio: 70.0),
    ItemModel(title: "Tacos de birria", image: "assets/tacosdebirria.png", precio: 25.0),
    ItemModel(title: "Burritos de asada", image: "assets/burritosdeasada.png", precio: 60.0),
    ItemModel(title: "Enchiladas", image: "assets/enchiladas.png", precio: 70.0),
    ItemModel(title: "Hamburguesa", image: "assets/hamburguesa.png", precio: 90.0),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }
  List<ItemModel> _filterList(List<ItemModel> items) {
    if (_searchText.isEmpty) return items;
    return items.where((item) => item.title.toLowerCase().contains(_searchText)).toList();
  }

  // Aquí puedes guardar los productos agregados al carrito
  final List<ItemModel> carrito = [];

  void agregarAlCarrito(ItemModel item) {
    setState(() {
      // Buscamos si ya está en carrito
      final index = carrito.indexWhere((p) => p.title == item.title);
      if (index == -1) {
        // Si no existe, lo agregamos
        carrito.add(
          ItemModel(
            title: item.title,
            image: item.image,
            precio: item.precio,
            quantity: item.quantity,
          ),
        );
      } else {
        // Si ya existe, sumamos cantidades
        carrito[index].quantity += item.quantity;
      }
    });
  }

@override Widget build(BuildContext context) {
  return Scaffold(
    body: SizedBox.expand( 
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/cesunfondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra de búsqueda
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Buscar productos...',
                      hintStyle: const TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue, 
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 86, 180),
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                // Categoría Sabritas
                if (_filterList(sabritas).isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white70, 
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Color.fromARGB(255, 41, 128, 226), 
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          "Sabritas", 
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 128, 226),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _filterList(sabritas).length,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          item: _filterList(sabritas)[index],
                          onAddToCart: agregarAlCarrito,
                        );
                      },
                    ),
                  ),
                ],
                // Categoría Refrescos
                if (_filterList(refrescos).isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: const Color.fromARGB(255, 41, 128, 226), 
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "Refrescos", 
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 41, 128, 226),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filterList(refrescos).length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        item: _filterList(refrescos)[index],
                        onAddToCart: agregarAlCarrito,
                      );
                    },
                  ),
                ),
                 ],
                // Categoría Galletas
                if (_filterList(galletas).isNotEmpty) ...[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Color.fromARGB(255, 41, 128, 226), 
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "Galletas", 
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 41, 128, 226),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filterList(galletas).length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        item: _filterList(galletas)[index],
                        onAddToCart: agregarAlCarrito,
                      );
                    },
                  ),
                ),
                 ],
                const SizedBox(height: 20),
                // Categoría Comidas
                if (_filterList(comidas).isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Color.fromARGB(255, 41, 128, 226), 
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          "Comidas", 
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 41, 128, 226),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _filterList(comidas).length,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          item: _filterList(comidas)[index],
                          onAddToCart: agregarAlCarrito,
                        );
                      },
                    ),
                  ),
              ],
             ],
          ),
          ),
        ],
      ),
    ),
  );
 }
}
