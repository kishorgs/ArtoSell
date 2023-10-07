import '../models/product.dart';

class CartItem {
  final Product product;
  late int quantity;

  CartItem({required this.product, this.quantity=1, required id, required title, required price});
}
