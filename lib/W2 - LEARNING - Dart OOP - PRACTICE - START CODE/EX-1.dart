enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;

  Address({required this.city, required this.street, required this.zipCode});
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearofExperince;

  Employee({
    required this._name,
    required this._baseSalary,
    required this._skills,
    required this._address,
    required this._yearofExperince,
  });

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<dynamic> get skills => _skills;
  Address get address => _address;
  int get years => _yearofExperince;

  double getSalary() {
    double salary = 0;
    if (skills.contains(Skill.FLUTTER)) {
      salary += 5000;
    }
    if (skills.contains(Skill.DART)) {
      salary += 3000;
    }
    if (skills.contains(Skill.OTHER)) {
      salary += 1000;
    }
    return salary;
  }

  double totalSalary() => baseSalary + getSalary() + (2000 * years);

  void printDetails() {
    print('Employee: $name, Base Salary: \$$baseSalary, Total Salary: \$${totalSalary()}');
  }
}

void main() {
  var emp1 = Employee(name:'Sokea', baseSalary:40000, skills:[Skill.FLUTTER, Skill.DART], address: Address(city: 'Phnom Penh', street: '6A', zipCode: 120000), yearofExperince: 2);
  emp1.printDetails();

  var emp2 = Employee(name:'Ronan', baseSalary:45000, skills:[Skill.OTHER], address: Address(city: 'French', street: '???', zipCode: 100000), yearofExperince: 10);
  emp2.printDetails();
}
