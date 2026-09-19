void checkBalance({required String name, required double balance}) =>
    print("Client: $name | Available balance: \$${balance.toStringAsFixed(2)}");
double deposit({required double currentBalance, double? amount}) {
  double depositAmount = amount ?? 0.0;
  double updatedBalance = currentBalance + depositAmount;
  print("Successful deposit: +\$$depositAmount. New balance: \$${updatedBalance.toStringAsFixed(2)}");
  return updatedBalance;
}
double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  const int correctPin = 1234;
  int enteredPin = pinCode ?? 0000;
  if (enteredPin != correctPin) {
    print("Transaction declined for $name: Invalid PIN code!");
    return currentBalance;
  }
  double withdrawAmount = amount ?? 0.0;
  if (withdrawAmount > currentBalance) {
    print("Transaction declined for $name: Insufficient funds (Requested: \$$withdrawAmount, Balance: \$$currentBalance)");
    return currentBalance;
  }

  double updatedBalance = currentBalance - withdrawAmount;
  print("Successful withdrawal for $name: -\$$withdrawAmount. Remaining balance: \$${updatedBalance.toStringAsFixed(2)}");
  return updatedBalance;
}

void main() {
  print("Atm Banking terminal simulator");
  String clientName = "Azaliya";
  double myBalance = 60000.0;
  checkBalance(name: clientName, balance: myBalance);
  myBalance = deposit(currentBalance: myBalance, amount: 20000.0);
  myBalance = withdraw(
    name: clientName,
    currentBalance: myBalance,
    amount: 15000.0,
    pinCode: 1234,
  );
  myBalance = withdraw(
    name: clientName,
    currentBalance: myBalance,
    amount: 5000.0,
    pinCode: 1111,
  );
  myBalance = withdraw(
    name: clientName,
    currentBalance: myBalance,
    amount: 100000.0,
    pinCode: 1234,
  );
}