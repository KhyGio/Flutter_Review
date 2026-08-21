class BankAccount {
  final int id;
  final String user;
  double _balance;

  BankAccount({
    required this.id,
    required this.user,
    this._balance = 0,
  });

  double get balance => _balance;

  double getBalance() => _balance;

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be greater than 0!');
    }

    if (_balance < amount) {
      throw Exception('Insufficient balance for withdrawal!');
    }

    _balance -= amount;
  }

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be greater than 0!');
    }

    _balance += amount;
  }

  @override
  String toString() {
    return 'Balance: \$_balance';
  }
}

class Bank {
  final String name;
  final List<BankAccount> _bankAccount;

  Bank({
    required this.name,
    List<BankAccount>? bankAccount,
  }) : _bankAccount = bankAccount ?? [];

  List<BankAccount> get bankAccount => _bankAccount;

  BankAccount createAccount(int id, String user) {
    bool exists = _bankAccount.any((account) => account.id == id);

    if (exists) {
      throw Exception('Account with ID $id already exists!');
    }

    BankAccount newAccount = BankAccount(
      id: id,
      user: user,
    );

    _bankAccount.add(newAccount);

    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(100, 'ronan');

  print(ronanAccount.balance); // 0

  ronanAccount.credit(100);
  print(ronanAccount.balance); // 100

  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // 50

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
    // Exception: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy');
  } catch (e) {
    print(e);
    // Exception: Account with ID 100 already exists!
  }
}