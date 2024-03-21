import 'package:flutter/material.dart';
import 'databaseDB.dart';
import 'package:google_fonts/google_fonts.dart';
class WorkhubPage extends StatefulWidget {
  const WorkhubPage({super.key});
  @override
  State<WorkhubPage> createState() => _WorkhubPageState();
}

String genderValue = "Male";

class Employer {
  String name;
  String work;
  String budget;
  String location;
  String empGender;
  Employer({
    required this.name,
    required this.work,
    required this.budget,
    required this.location,
    required this.empGender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'work': work,
      'budget': budget,
      'empGender': empGender,
      'location': location,
    };
  }

  @override
  String toString() {
    return 'name:$name,work:$work,budget:$budget,empGender:$empGender,location:$location';
  }
}

class Worker {
  String workername;
  String workeradress;
  String charges;
  String skills;
  String workerGender;

  Worker({
    required this.workername,
    required this.workeradress,
    required this.charges,
    required this.skills,
    required this.workerGender,
  });

  Map<String, dynamic> towMap() {
    return {
      'workername': workername,
      'workeradress': workeradress,
      'charges': charges,
      'workerGender': workerGender,
      'skills': skills,
    };
  }

  @override
  String toString() {
    return 'workername:$workername,workadress:$workeradress,charges:$charges,workerGender:$workerGender,skills:$skills';
  }
}

class _WorkhubPageState extends State<WorkhubPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();
  TextEditingController budgetcontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController empGendercontroller = TextEditingController();

  TextEditingController workernamecontroller = TextEditingController();
  TextEditingController workeradresscontroller = TextEditingController();
  TextEditingController chargescontroller = TextEditingController();
  TextEditingController skillscontroller = TextEditingController();
  TextEditingController workerGendercontroller = TextEditingController();

//for employer image
  String empFun(String empGender) {
    if (empGender == genderValue) {
      return "assets/images/emp.jpeg";
    } else {
      return "assets/images/empfemale.jpeg";
    }
  }

//for worker Image
  String workerFun(String workerGender) {
    if (workerGender == genderValue) {
      return "assets/images/workermale.jpeg";
    } else {
      return "assets/images/femalew.jpeg";
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await databaseFun();
        await getData();
        await getworkerData();
      },
    );
  }

//convert db data into our list
  Future getData() async {
    List empList = await getEmpData();
    // print(empList);
    setState(() {
      employerlist = empList;
    });
  }

//convert worker db data into out list
  Future getworkerData() async {
    List workList = await getworkprofile();
    // print(workerList);
    setState(() {
      workerlist = workList;
    });
  }

  void submit() {
    if (namecontroller.text.trim().isNotEmpty &&
        workcontroller.text.trim().isNotEmpty &&
        budgetcontroller.text.trim().isNotEmpty &&
        empGendercontroller.text.trim().isNotEmpty &&
        locationcontroller.text.trim().isNotEmpty) {
      setState(() {
        insertdata(Employer(
            name: namecontroller.text,
            work: workcontroller.text,
            budget: budgetcontroller.text,
            empGender: empGendercontroller.text,
            location: locationcontroller.text));
      });
    }
  }

  void submitWorker() {
    if (workernamecontroller.text.trim().isNotEmpty &&
        workeradresscontroller.text.trim().isNotEmpty &&
        chargescontroller.text.trim().isNotEmpty &&
        workerGendercontroller.text.trim().isNotEmpty &&
        skillscontroller.text.trim().isNotEmpty) {
      setState(() {
        insertworkerdata(Worker(
            workername: workernamecontroller.text,
            workeradress: workeradresscontroller.text,
            workerGender: workerGendercontroller.text,
            charges: chargescontroller.text,
            skills: skillscontroller.text));
      });
    }
  }

  void clearData() {
    namecontroller.clear();
    workcontroller.clear();
    budgetcontroller.clear();
    locationcontroller.clear();
    empGendercontroller.clear();
  }

  void clearWorkerData() {
    workernamecontroller.clear();
    workcontroller.clear();
    chargescontroller.clear();
    workeradresscontroller.clear();
    skillscontroller.clear();
    workerGendercontroller.clear();
  }

  void showMyBottomsheet() {
    showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 10,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )),
        isDismissible: true,
        context: context,
        builder: ((BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                //MediaQuery.of(context).viewInsets.bottom,
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name:",
                        style: TextStyle(
                      color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                            hintText: 'Enter name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Available Work:",
                        style: TextStyle(
                      color: Color.fromRGBO(81, 36, 246, 0.776),

                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: workcontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Available Work:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Budget:",
                        style: TextStyle(
                      color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: budgetcontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Budget:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Location:",
                        style: TextStyle(
                      color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: locationcontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Location:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Gender:",
                        style: TextStyle(
                      color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: empGendercontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Gender:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                     
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                   Color.fromRGBO(81, 36, 246, 0.776),
                           ),
                      ),
                      onPressed: () {
                        submit();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }));
  }

  void showWorkerBottomSheet() {
    showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 10,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )),
        isDismissible: true,
        context: context,
        builder: ((BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                //MediaQuery.of(context).viewInsets.bottom,
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create Worker Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Worker Name:",
                        style: TextStyle(
                           color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: workernamecontroller,
                          decoration: const InputDecoration(
                            hintText: 'Enter name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Skills:",
                        style: TextStyle(
                          color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: skillscontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Skills:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Charges:",
                        style: TextStyle(
                         color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: chargescontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter your Charges:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Address:",
                        style: TextStyle(
                           color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: workeradresscontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Address:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Gender:",
                        style: TextStyle(
                          color: Color.fromRGBO(81, 36, 246, 0.776),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: workerGendercontroller,
                          decoration: const InputDecoration(
                              hintText: 'Enter Your Gender:',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),
                    
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                           Color.fromRGBO(81, 36, 246, 0.776),),
                      ),
                      onPressed: () {
                        submitWorker();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }));
  }

  List workerlist = [];
  List employerlist = [];
  @override
  Widget build(BuildContext context) {
    getData();
    getworkerData();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 15,
                bottom: 12,
              ),
              child: Row(
                children: [
                  Text(
                    "Workhub",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  //const SizedBox(width:4,),
                  const Text(
                    ".",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 35,
                      color: Color.fromRGBO(81, 36, 246, 0.776),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color:Color.fromRGBO(99, 97, 97, 1) ,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by filters',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  prefixIconColor: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 180,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blue,
                          //offset: Offset(10, 10),
                          blurRadius: 20,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/pic.jpeg",
                          width: 130,
                          height: 130,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Post Work",
                          style: GoogleFonts.enriqueta(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showMyBottomsheet();
                    clearData();
                  },
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 180,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blue,
                          //offset: Offset(10, 10),
                          blurRadius: 20,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/pic1.jpeg",
                          width: 130,
                          height: 130,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Add Worker",
                          style: GoogleFonts.enriqueta(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showWorkerBottomSheet();
                    clearWorkerData();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        "People Looking for worker",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              height: 160,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: employerlist.length,
                itemBuilder: (context, int index) {
                  return Expanded(
                      child: SizedBox(
                          height: 430,
                          child: Column(children: [
                            Container(
                              height: 120,
                              width: 250,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(99, 97, 97, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.only(top: 2, left: 12)),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Image.asset(empFun(
                                            employerlist[index].empGender)),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          SizedBox(
                                            width: 243,
                                            child: Text(
                                              employerlist[index].name,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 243,
                                            child: Text(
                                              employerlist[index].work,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 243,
                                            child: Text(
                                              employerlist[index].budget,
                                              style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                  // const SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 15, right: 10,bottom: 1),
                                      child: Row(
                                        children: [
                                           const SizedBox(
                                width: 2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Request Sent Succesfully",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                     
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                                child:const Row(
                                  children: [
                                    Icon(Icons.send,
                                      color: Color.fromRGBO(230, 221, 142, 1), size: 20),
                                       SizedBox(width: 4,),
                                      Text("Send Request",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color:Colors.grey,fontStyle:FontStyle.italic),)
                                  ],
                                ),
                              ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.location_on,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            employerlist[index].location,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])));
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 18,
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 12),
                  child: Row(
                    children: [
                      Text(
                        "People Looking for work",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              height: 160,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: workerlist.length,
                itemBuilder: (context, int index) {
                  return Expanded(
                    child: SizedBox(
                      height: 430,
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: 280,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(99, 97, 97, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 2, left: 12)),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Image.asset(workerFun(
                                          workerlist[index].workerGender)),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                          width: 243,
                                          child: Text(
                                            workerlist[index].workername,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: 243,
                                          child: Text(
                                            workerlist[index].skills,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: 243,
                                          child: Text(
                                            workerlist[index].charges,
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                                // const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 1, left: 15, right: 10),
                                    child: Row(
                                      children: [

                                           const SizedBox(
                                width: 2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Thanks for contacting me!",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                                child:const Row(
                                  children: [
                                 Icon(Icons.phone,
                                      color: Colors.green, size: 20),
                                      SizedBox(width: 4,),
                                      Text("Contact",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color:Colors.grey,fontStyle: FontStyle.italic),)
                                  ],
                                ),
                              ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.location_on,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          workerlist[index].workeradress,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 18,
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(99, 97, 97, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            label: 'home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: 'person',
          ),
        ],
      ),
    );
  }
}
