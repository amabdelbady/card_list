import 'package:firebase_database/firebase_database.dart';

class Employee {
  int rn;
  int id;
  String employeeName;
  int employeeSalary;
  String employeeJob;
  int employeeManager;
  var heridate;
  int employeeComm;
  int employeeDepart;

  Employee(
      {
        this.rn,
        this.id,
        this.employeeName,
        this.employeeSalary,
        this.employeeComm,
        this.employeeDepart,
        this.employeeJob,
        this.employeeManager,
        this.heridate
      });

  Employee.fromJson(Map<String, dynamic> json) {
    rn = json['rn'];
    id = json['empno'];
    employeeName = json['ename'];
    employeeJob = json['job'];
    employeeManager = json['mgr'];
    heridate = json['hiredate'];
    employeeSalary = json['sal'];
    employeeComm = json['comm'];
    employeeDepart=json['deptno'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rn'] = this.rn;
    data['empno'] = this.id;
    data['ename'] = this.employeeName;
    data['job'] = this.employeeJob ;
    data['mgr'] = this.employeeManager;
    data['hiredate'] = this.heridate;
    data['sal'] = this.employeeSalary;
    data['comm'] = this.employeeComm ;
    data['deptno'] = this.employeeDepart;

    return data;
  }
}

