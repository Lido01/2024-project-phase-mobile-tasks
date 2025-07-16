import 'dart:io';

class Product {
  String _name;
  String _description;
  double _price;

  // Constructor to initialize the product fields
  Product(this._name, this._description, this._price);

    // Getter to get name, description, and price
  String get name => _name;   
  String get description => _description;   
  double get price => _price;  

    // Setter to update name, description, and price
  set name(String value) => _name = value;  
  set description(String value) => _description = value;   
  set price(double value) => _price = value;

  // Converts the product details into a readable string format
  @override
  String toString() {
    return '''
              Name: $_name
              Description: $_description
              Price: \$${_price.toStringAsFixed(2)}''';
  }
}
class ProductManager {
  final List<Product> _products = [];
   
  void addProduct(String name, String description, double price) {
    _products.add(Product(name, description, price));
    print(' Product added successfully.');
  }
  void viewAllProducts() {
    if (_products.isEmpty) {
      print(' No products available.');
      return;
    }
    for (int i = 0; i < _products.length; i++) {
      print('\n Product ID: $i');
      print(_products[i]);
    }
  } 
  void viewProduct(int index) {
    if (_isValidIndex(index)) {
      print('\n Product ID: $index');
      print(_products[index]);
    } else {
      print('Product not found.');
    }
  }
  void editProduct(int index, String name, String description, double price) {
    if (_isValidIndex(index)) {
      _products[index]
        ..name = name
        ..description = description
        ..price = price;
      print('🛠️ Product updated successfully.');
    } else {
      print('Product not found.');
    }
  }
  void deleteProduct(int index) {
    if (_isValidIndex(index)) {
      _products.removeAt(index);
      print('Product deleted successfully.');
    } else {
      print('Product not found.');
    }
  }
  // Helper method to validate product index
  bool _isValidIndex(int index) => index >= 0 && index < _products.length;
}
void main() {
  final manager = ProductManager();

  while (true) {
    print('\n Product Manager Menu');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Single Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');

    stdout.write('Enter your choice: ');
    final input = stdin.readLineSync();
    final choice = int.tryParse(input ?? '');

    switch (choice) {
      case 1:
        stdout.write('Enter name: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Enter description: ');
        String description = stdin.readLineSync() ?? '';
        stdout.write('Enter price: ');
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        manager.addProduct(name, description, price);
        break;
      case 2:
        manager.viewAllProducts();
        break;
      case 3:
        stdout.write('Enter product ID: ');
        int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        manager.viewProduct(index);
        break;
      case 4:
        stdout.write('Enter product ID: ');
        int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        stdout.write('Enter new name: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Enter new description: ');
        String description = stdin.readLineSync() ?? '';
        stdout.write('Enter new price: ');
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        manager.editProduct(index, name, description, price);
        break;
      case 5:
        stdout.write('Enter product ID: ');
        int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        manager.deleteProduct(index);
        break;
      case 6:
        print(' Exiting...');
        return;
      default:
        print('Invalid choice. Try again.');
    }
  }
}