import 'package:bloc_sample/models/product.dart';

class ProductService {
  static List<Product> products = <Product>[];

  static ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();
  static List<Product> getAll() {
    products.add(Product(0, "Asus", 14000));
    products.add(Product(1, "Samsung", 3000));
    products.add(Product(2, "Renault", 70000));

    return products;
  }
}
