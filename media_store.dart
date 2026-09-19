mixin Downloadable {
  void download(String title) {
    print("Downloading digital item: '$title'...");
  }
}
abstract class MediaItem {
  String id;
  String title;
  double price;
  MediaItem({required this.id, required this.title, required this.price});
  String getDetails();
}
class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;
  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(id: id, title: title, price: price);
  @override
  String getDetails() {
    return "Audiobook: '$title' Narrator: $narrator Duration: ${durationHours}h Price: \$$price";
  }
}
class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;
  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(id: id, title: title, price: price);
  @override
  String getDetails() {
    return "EBook: '$title' Author: $author Size: ${fileSizeMB}MB Price: \$$price";
  }
}
class ShoppingCart {
  List<MediaItem> _items = [];
  void addItem(MediaItem item) {
    _items.add(item);
    print("Added to cart: ${item.title}");
  }
  double calculateTotalWithTax({double taxRate = 0.12}) {
    double subtotal = _items.fold(0.0, (sum, item) => sum + item.price);
    double totalWithTax = subtotal * (1 + taxRate);
    return totalWithTax;
  }
  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }
  void printReceipt() {
    print("\nDigital store receipt");
    for (var item in _items) {
      print(item.getDetails());
      if (item is Downloadable) {
        (item as Downloadable).download(item.title);
      }
    }
    double finalTotal = calculateTotalWithTax();
    print(" ");
    print("Total (including 12% tax): \$${finalTotal.toStringAsFixed(2)}\n");
  }
}
void main() {
  print("Digital e-commerce media store");
  ShoppingCart cart = ShoppingCart();
  Audiobook item1 = Audiobook(
    id: "A1",
    title: "Atomic Habits",
    price: 15.99,
    durationHours: 5.5,
    narrator: "John Smith",
  );
  EBook item2 = EBook(
    id: "E1",
    title: "Clean Code",
    price: 29.99,
    fileSizeMB: 4.5,
    author: "Anna Lee",
  );
  Audiobook item3 = Audiobook(
    id: "A2",
    title: "The Alchemist",
    price: 10.50,
    durationHours: 4.0,
    narrator: "David Miller",
  );
  cart.addItem(item1);
  cart.addItem(item2);
  cart.addItem(item3);
  cart.printReceipt();
  print("Filtered items (Max Price: \$20.00)");
  List<MediaItem> affordableItems = cart.filterByMaxPrice(20.0);
  for (var item in affordableItems) {
    print(" ${item.title} (\$${item.price})");
  }
}