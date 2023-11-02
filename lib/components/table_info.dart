import 'package:flutter/material.dart';
import 'package:dashboard/const/constants.dart';

class TypeBean {
  const TypeBean({required this.name});

  final String name;
}

class StudentGradesBean {
  String name;
  int studentId;
  int language;
  int math;
  int english;
  int physical;
  int chemistry;
  int biological;
  int geography;
  int political;
  int history;
  bool isSelected;

  StudentGradesBean(
    this.name,
    this.studentId,
    this.language,
    this.math,
    this.english,
    this.physical,
    this.chemistry,
    this.biological,
    this.geography,
    this.political,
    this.history, {
    this.isSelected = false,
  });
}

var _typeList = [
  TypeBean(name: '姓名'),
  TypeBean(name: '学号'),
  TypeBean(name: '语文'),
  TypeBean(name: '数学'),
  TypeBean(name: '英语'),
  TypeBean(name: '物理'),
  TypeBean(name: '化学'),
  TypeBean(name: '生物'),
  TypeBean(name: '地理'),
  TypeBean(name: '政治'),
  TypeBean(name: '历史'),
];

List<DataColumn> _dataColumnList = [];

var _studentGradesList = [
  StudentGradesBean('张三', 1, 89, 88, 100, 76, 81, 77, 95, 85, 80),
  StudentGradesBean('李四', 2, 95, 100, 90, 72, 65, 88, 66, 79, 96),
  StudentGradesBean('王二', 3, 100, 67, 87, 96, 89, 69, 79, 78, 73),
  StudentGradesBean('麻子', 4, 85, 75, 86, 91, 100, 66, 100, 90, 83),
  StudentGradesBean('王五', 5, 89, 88, 100, 76, 81, 77, 95, 85, 80),
  StudentGradesBean('赵四', 6, 95, 100, 90, 72, 65, 88, 66, 79, 96),
  StudentGradesBean('陈二', 7, 100, 67, 87, 96, 89, 69, 79, 78, 73),
  StudentGradesBean('李世民', 8, 85, 75, 86, 91, 100, 66, 100, 90, 83),
  StudentGradesBean('王老六', 9, 89, 88, 100, 76, 81, 77, 95, 85, 80),
  StudentGradesBean('狗子', 10, 95, 100, 90, 72, 65, 88, 66, 79, 96),
  StudentGradesBean('丑娃', 11, 100, 67, 87, 96, 89, 69, 79, 78, 73),
  StudentGradesBean('石头', 12, 85, 75, 86, 91, 100, 66, 100, 90, 83),
  StudentGradesBean('二妞', 13, 89, 88, 100, 76, 81, 77, 95, 85, 80),
  StudentGradesBean('大妞', 14, 95, 100, 90, 72, 65, 88, 66, 79, 96),
  StudentGradesBean('黑皮', 15, 100, 67, 87, 96, 89, 69, 79, 78, 73),
  StudentGradesBean('大胆儿', 16, 85, 75, 86, 91, 100, 66, 100, 90, 83),
  StudentGradesBean('阿里', 16, 85, 75, 86, 91, 100, 66, 100, 90, 83),
];

List<DataRow> _dataRowList = [];
_myDataTable() {
  return DataTable(
    columns: _myDataColumnList(),
    rows: _myDataRowList(),
    dataRowHeight: 40,
    headingRowHeight: 55,
    horizontalMargin: 20,
    columnSpacing: 50,
    dividerThickness: 2,
  );
}

_myDataColumn(TypeBean bean) {
  return DataColumn(
    label: Text(
      bean.name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    tooltip: '${bean.name}',
    numeric: false,
  );
}

_myDataColumnList() {
  if (_dataColumnList.length > 0) {
    _dataColumnList.clear();
  }
  _typeList.forEach((element) {
    _dataColumnList.add(_myDataColumn(element));
  });
  return _dataColumnList;
}

_myDataCell(String s) {
  return DataCell(
    Text(s),
  );
}

_myDataRow(StudentGradesBean bean) {
  return DataRow(
    cells: [
      _myDataCell(bean.name),
      _myDataCell(bean.studentId.toString()),
      _myDataCell(bean.language.toString()),
      _myDataCell(bean.math.toString()),
      _myDataCell(bean.english.toString()),
      _myDataCell(bean.physical.toString()),
      _myDataCell(bean.chemistry.toString()),
      _myDataCell(bean.biological.toString()),
      _myDataCell(bean.geography.toString()),
      _myDataCell(bean.political.toString()),
      _myDataCell(bean.history.toString()),
    ],
  );
}

_myDataRowList() {
  if (_dataRowList.length > 0) {
    _dataRowList.clear();
  }
  _studentGradesList.forEach((element) {
    _dataRowList.add(_myDataRow(element));
  });
  return _dataRowList;
}

class TableInfo extends StatelessWidget {
  const TableInfo({
    Key? key,
  }) : super(key: key);
  // @override
  // void initState() {
  //   _myDataColumnList();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: _myDataTable(),
    );
  }
}
