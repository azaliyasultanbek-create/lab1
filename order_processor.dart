double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  double currentPrice = itemPrice;
  if (promoCode == 'SAVE10') {
    currentPrice = currentPrice * 0.9;
    print("Promo code 'SAVE10' applied: 10% discount.");
  }
  double finalDeliveryFee = deliveryFee ?? 500.0;
  double finalTotal = currentPrice + finalDeliveryFee;
  print("\norder summary");
  print("Order ID: $orderId");
  print("Item Price: ${itemPrice}₸");
  if (promoCode == 'SAVE10') {
    print("Price after discount: ${currentPrice.toStringAsFixed(2)}₸");
  }
  print("Delivery Fee: ${finalDeliveryFee}₸");
  print("Final Total: ${finalTotal.toStringAsFixed(2)}₸\n");
  return finalTotal;
}
void main() {
  processOrder(
    orderId: "ORD-9988",
    itemPrice: 15000.0,
    promoCode: 'SAVE10',
  );
}