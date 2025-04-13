abstract class Employee {
  final String id;
  final String name;

  Employee(this.id, this.name);

  void printInfo() {
    print('Mã số nhân viên: $id, Tên nhân viên: $name');
  }

  double calculateSalary();
}

abstract class Workable {
  void doWork();
}

class OfficeWorker extends Employee implements Workable {
  final String department;
  final double baseSalary;

  OfficeWorker(String id, String name, this.department, this.baseSalary)
    : super(id, name);

  @override
  void printInfo() {
    super.printInfo();
    print('Phòng ban làm việc: $department');
  }

  @override
  double calculateSalary() {
    return baseSalary;
  }

  @override
  void doWork() {
    print('Nhân viên $name đang làm việc tại phòng $department');
  }
}

class TechWorker extends Employee implements Workable {
  final String field;
  final double baseSalary;

  TechWorker(String id, String name, this.field, this.baseSalary)
    : super(id, name);

  @override
  void printInfo() {
    super.printInfo();
    print('Lĩnh vực kỹ thuật: $field');
  }

  @override
  double calculateSalary() {
    return baseSalary;
  }

  @override
  void doWork() {
    print('$name đang làm việc trong lĩnh vực $field');
  }
}

class Company {
  List<Employee> employees = [];

  void addEmployee(Employee employee) {
    employees.add(employee);
  }

  void printAllEmployees() {
    print('DANH SÁCH NHÂN VIÊN CỦA CÔNG TY:');
    for (var employee in employees) {
      employee.printInfo();
      print('----------------------------');
    }
  }

  double getTotalSalary() {
    double total = 0;
    for (var employee in employees) {
      total += employee.calculateSalary();
    }
    return total;
  }
}

void main() {
  var company = Company();

  company.addEmployee(OfficeWorker('001', 'Nguyễn Văn A', 'Kế toán', 10000000));

  company.addEmployee(OfficeWorker('OW002', 'Trần Thị B', 'Nhân sự', 12000000));

  company.addEmployee(
    TechWorker('TW001', 'Lê Văn C', 'Phát triển phần mềm', 15000000),
  );
  company.addEmployee(
    TechWorker('TW002', 'Phạm Thị D', 'Quản trị hệ thống', 14000000),
  );

  company.printAllEmployees();

  print('Tổng lương của công ty: ${company.getTotalSalary()} VND');
}
