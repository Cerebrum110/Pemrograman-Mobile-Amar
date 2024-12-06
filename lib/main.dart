import 'package:flutter/material.dart';
import 'login.dart';
import 'registration.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'login' ,
    routes: {
      'login' : (context)=>MyLogin(),
      'register' : (context)=> Register(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menampilkan Profile',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        // Change it to
        //primarySwatch: Color.blue,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(107, 42, 207, 53)),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: MapMethodExample(),
      home: OOPExample(),
    );
  }
}

class Person {
  //variable initialization
  String? fullname;
  String? birthdate;
  String? gender;

  //methode convert gender input to text
  String convertGender(String gender) {
    var result = "";

    //condition to convert gender code to text
    if (gender == 'L') {
      result = 'Laki-Laki';
    } else if (gender == 'P') {
      result = 'Perempuan';
    } else {
      result = 'Tidak diketahui';
    }

    return result;
  }

  //method convert birthdate to age
  String getAge(String birthdate) {
    //parse string to date
    var parseDate = DateTime.parse(birthdate);
    //set current date variable
    var today = DateTime.now();
    //set date diff
    final yy = today.year - parseDate.year;
    final mm = today.month - parseDate.month;
    final dd = (today.day - parseDate.day).abs();

    var result = '$yy tahun $mm bulan $dd hari';
    return result;
  }

  void display() {
    var age = getAge('$birthdate');
    var sex = convertGender('$gender');
    var message = '$fullname \n$sex\nUsia $age\n';

    message;
  }
}

class OOPExample extends StatelessWidget {
  // Define a list of maps containing
  // Country and capital information
  final List<Map<String, String>> profile = [
    {
      'fullname': 'Mahfood Ungway',
      'birthdate': '2003-08-16',
      'gender': 'L'
    },
    { 'fullname': 'Rian widodo', 
      'birthdate': '2002-07-29',
      'gender': 'L'},
    {
      'fullname': 'Alecksia cecepi',
      'birthdate': '2003-05-23',
      'gender': 'P'
    }
  ];

  Person person = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the app bar title
        title: Text('Daftar Profile'),
      ),
      body: ListView(
        children: profile.map((profileInfo) {
          person.fullname = profileInfo['fullname'];
          person.gender = profileInfo['gender'];
          person.birthdate = profileInfo['birthdate'];

          return ListTile(
            title: Text(person.fullname!),
            subtitle: Text(
                '${person.convertGender('${person.gender}')} \n${person.getAge('${person.birthdate}')}'),
          );
        }).toList(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _profile, arrHobby, listHobby;
  String _result = "";
  int _counter = 0;

  String _getAge(String birthdate) {
    var _parseDate = DateTime.parse(birthdate);
    var _today = DateTime.now();
    final _yy = _today.year - _parseDate.year;
    final _mm = _today.month - _parseDate.month;
    final _dd = _today.day - _parseDate.day;

    var _result = '$_yy tahun $_mm bulan $_dd hari';

    return _result;
  }

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  void _getProfile() {
    setState(() {
      String a = "", b = "", c = "", age = "", desc;

      _profile = [
        {
          'fullname': 'Mahfood Ungway',
          'birthdate': '2003-08-16',
          'gender': 'L',
          'age': '21 tahun, 3 bulan, 20 hari',
          'hobby': ['Menggambar', 'Olahraga', 'Main Game']
        },
        {
          'fullname': 'Rian Widodo',
          'birthdate': '2002-07-29',
          'gender': 'L',
          'age': '22 tahun, 3 bulan, 4 hari',
          'hobby': ['Olahraga', 'Nonton Film', 'Main Game']
        },
        {
          'fullname': 'Alecksia cecepi',
          'birthdate': '2003-05-23',
          'gender': 'P',
          'age': '21 tahun, 6 bulan, 13 hari',
          'hobby': ['Membaca Buku', 'Olahraga', 'Main Game']
        }
      ];

      a = _profile[_counter]['fullname'];
      b = _profile[_counter]['birthdate'];
      c = _profile[_counter]['gender'];
      age = _getAge(b);

      if (_profile[_counter]['gender'] == 'L') {
        c = 'Laki-laki';
      } else if (_profile[_counter]['gender'] == 'p') {
        c = 'perempuan';
      } else {
        c = 'Tidak Diketahui';
      }

      arrHobby = _profile[_counter]['hobby'];
      listHobby = "";
      for (int i = 0; i < arrHobby.length; i++) {
        listHobby = '$listHobby${i + 1}. ${arrHobby[i]} \n';
      }

      switch (_counter) {
        case 0:
          desc = '\nNo Urut 1\n';
          break;
        case 1:
          desc = '\nNo Urut 2\n';
          break;
        default:
          desc = '\nTidak Termasuk Pilihan\n';
      }

      _result = '$desc\n$a \n$c\nUsia $age\n\nHobi:\n$listHobby';
      _result = '$a \n$c\nUsia $age\n\nHobi:\n$listHobby';

      _result =
          'Nama $a dengan jenis kelamin $c dan tanggal lahir $b (usia $age)';
      _counter++;

      _result;
    });
  }

  void _testprint() {
    var a = 'Tes Pemrograman Mobile Flutter Dart';
    var b = 1000;
    var c = false;
    var d = '2023-10-10';

    print('$a dengan banyak pengguna = $b');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Profil Anggota'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getProfile,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //This trailling comma makes auto-formatting nicer for build methods.
    );
  }
}