import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[ DataDiri(), const Triangle(), const Kite() ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Data Diri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond_rounded),
            label: 'Segitiga',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond_sharp),
            label: 'Layang-Layang',
          ),       
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DataDiri extends StatelessWidget {

  const DataDiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Diri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile.jpg',
              width: 200,
              height: 200,
            ),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                  child: Text('NIM', 
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                  child: Text('Nama',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                  child: Text('Kelas', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                  child: Text('Hobby', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            
              rows: const <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text('123200084')),
                  DataCell(Text('Rafli Irfansyah Kusumawardhana')),
                  DataCell(Text('IF-B')),
                  DataCell(Text('Olahraga, mendengarkan musik, dan bermain game'))
                ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Triangle extends StatefulWidget {
  const Triangle({super.key});

  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  final TextEditingController _alasController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _miring1Controller = TextEditingController();
  final TextEditingController _miring2Controller = TextEditingController();

  double _luasSegitiga = 0;
  double _kelilingSegitiga = 0;

  void _hitungLuasSegitiga() {
    double alas = double.parse(_alasController.text);
    double tinggi = double.parse(_tinggiController.text);

    setState(() {
      _luasSegitiga = alas * tinggi / 2;
    });
  }

  void _hitungKelilingSegitiga() {
    double alas = double.parse(_alasController.text);
    double miring1 = double.parse(_miring1Controller.text);
    double miring2 = double.parse(_miring2Controller.text);

    setState(() {
      _kelilingSegitiga = alas + miring1 + miring2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segitiga"),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _alasController,
              decoration: const InputDecoration(
                labelText: "Masukkan nilai alas",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tinggiController,
              decoration: const InputDecoration(
                labelText: "Masukkan nilai tinggi",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _miring1Controller,
              decoration: const InputDecoration(
                labelText: "Masukkan nilai sisi miring 1",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _miring2Controller,
              decoration: const InputDecoration(
                labelText: "Masukkan nilai sisi miring 2",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _hitungLuasSegitiga,
                  child: const Text("Hitung Luas"),
                ),
                ElevatedButton(
                  onPressed: _hitungKelilingSegitiga,
                  child: const Text("Hitung Keliling"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Luas Segitiga: $_luasSegitiga",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Keliling Segitiga: $_kelilingSegitiga",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Kite extends StatefulWidget {
  const Kite({super.key});

  @override
  _KiteState createState() => _KiteState();
}

class _KiteState extends State<Kite> {
  final TextEditingController _diagonal1Controller = TextEditingController();
  final TextEditingController _diagonal2Controller = TextEditingController();
  final TextEditingController _sisiPendekController = TextEditingController();
  final TextEditingController _sisiPanjangController = TextEditingController();

  double _luasLayang = 0;
  double _kelilingLayang = 0;
  double d1 = 0;
  double d2 = 0;
  double sisiPendek = 0;
  double sisiPanjang = 0;

  void _hitungLuasLayang() {
    double d1 = double.parse(_diagonal1Controller.text);
    double d2 = double.parse(_diagonal2Controller.text);


    setState(() {
      _luasLayang = d1 * d2 / 2;
    });
  }

  void _hitungKelilingLayang() {
    double sisiPendek = double.parse(_sisiPendekController.text);
    double sisiPanjang = double.parse(_sisiPanjangController.text);

    setState(() {
      _kelilingLayang = 2 * (sisiPendek + sisiPanjang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layang-Layang"),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Perhitungan Luas",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _diagonal1Controller,
              decoration: const InputDecoration(
                labelText: "Diagonal 1",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _diagonal2Controller,
              decoration: const InputDecoration(
                labelText: "Diagonal 2",
              ),
              keyboardType: TextInputType.number,
            ),
             const SizedBox(height: 16.0),
             Text(
              "Perhitungan Keliling",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             TextField(
              controller: _sisiPendekController,
              decoration: const InputDecoration(
                labelText: "Sisi Pendek",
              ),
              keyboardType: TextInputType.number,
            ),
             TextField(
              controller: _sisiPanjangController,
              decoration: const InputDecoration(
                labelText: "Sisi Panjang",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _hitungLuasLayang,
                  child: const Text("Hitung Luas"),
                ),
                ElevatedButton(
                  onPressed: _hitungKelilingLayang,
                  child: const Text("Hitung Keliling"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Luas Layang-Layang: $_luasLayang",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Keliling Layang-Layang: $_kelilingLayang",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

