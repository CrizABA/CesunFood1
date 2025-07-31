import 'package:flutter/material.dart';
import '/models/item_model.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;
  final void Function(ItemModel) onAddToCart; 

  const ItemCard({super.key, required this.item, required this.onAddToCart});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  void increment() {
    setState(() {
      widget.item.quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (widget.item.quantity > 0) widget.item.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(widget.item.image, height: 100),
            const SizedBox(height: 1),
            Text(
              widget.item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '\$${widget.item.precio}',
              style: const TextStyle(color: Colors.green, fontSize: 16),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decrement,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '${widget.item.quantity}',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(onPressed: increment, icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed:
                  widget.item.quantity > 0
                      ? () {
                        widget.onAddToCart(widget.item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.item.quantity} ${widget.item.title} agregado(s) al carrito',
                            ),
                          ),
                        );
                        setState(() {
                          widget.item.quantity =
                              0; // reset cantidad después de agregar
                        });
                      }
                      : null,
              child: const Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
