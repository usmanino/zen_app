class Employee {
  // String? role;

  // Employee({this.role});

  void get({required String name, required String role}) {
    print("$name you are employed as a $role in the company");
  }
}
