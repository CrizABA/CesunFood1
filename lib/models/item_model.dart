class ItemModel {
  final String title;
  final String image; 
  final double precio;
  final descripcion; //Agregar cuando selecciones y veas el detalle del producto
  int quantity;

  ItemModel({
    required this.title,
    required this.image,
    required this.precio,
    this.descripcion,
    this.quantity = 0, // Cantidad por defecto en 0
  });
}
