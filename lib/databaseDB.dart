import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart ' as path;
import 'workhubPage.dart';

dynamic database;
Future<void> databaseFun() async {
  database = await openDatabase(
      path.join(await getDatabasesPath(), "employerDB.db"),
      version: 1, onCreate: (db, version) async {
    await db.execute('''Create table  EmployerInfo(
         name TEXT,
         work TEXT,
         budget TEXT ,
         location TEXT,
         empGender TEXT
         
        )''');

    await db.execute('''Create table  WorkerInfo(
         workername TEXT,
         workeradress TEXT,
         charges TEXT ,
         skills TEXT,
         workerGender TEXT
        
        )''');
  });
  getEmpData();
  getworkprofile();
}

//insert employer data
Future<void> insertdata(Employer obj) async {
  final localDB = await database;

  await localDB.insert('EmployerInfo', obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  // await getData();
}

//insert worker data
Future<void> insertworkerdata(Worker obj) async {
  final localDB = await database;

  await localDB.insert('WorkerInfo', obj.towMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  //  await getworkerData();
}

//get data
Future getEmpData() async {
  final localDB = await database;

  final List<Map<String, dynamic>> empList =
      await localDB.query('EmployerInfo');

  return List.generate(empList.length, (i) {
    // print(Employer(name: empList[i]['name'], work:empList[i]['work'] , budget: empList[i]['budget'], phoneNo:empList[i]['phoneNo'], location:empList[i]['location']));

    return Employer(
        name: empList[i]['name'] ?? '',
        work: empList[i]['work'] ?? '',
        budget: empList[i]['budget'] ?? '',
        empGender: empList[i]['empGender'] ?? '',
        location: empList[i]['location'] ?? '');
  });
}

//get worker data
//get data
Future getworkprofile() async {
  final localDB = await database;

  final List<Map<String, dynamic>> workList = await localDB.query('WorkerInfo');

  return List.generate(workList.length, (index) {
    return Worker(
        workername: workList[index]['workername'] ?? '',
        workeradress: workList[index]['workeradress'] ?? '',
        charges: workList[index]['charges'] ?? '',
        workerGender: workList[index]['workerGender'] ?? '',
        skills: workList[index]['skills'] ?? '');
  });
}
