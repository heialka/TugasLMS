import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/food.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      style: TextStyle(fontSize: 16.0), // Ukuran teks
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon:
                            Icon(Icons.search), // Menambahkan icon search
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // menghapus border
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Katalog Resep Makanan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            width: 80.0, // Menyesuaikan lebar
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icon/allmenu.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Semua',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 95.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icon/makanan.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Makanan',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 80.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icon/buah.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Buah',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Colors.red, // Warna border merah
                              ),
                            ),
                            width: 105.0,
                            height: 35.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/icon/minuman.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Minuman',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.extent(
                maxCrossAxisExtent: 200,
                padding: EdgeInsets.all(20.0),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: [
                  Container(
                    height: 120, // Menyesuaikan ketinggian
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/nasigoreng.jpg', // Memanggil gambar
                            fit: BoxFit.cover,
                            height: 85, // emengatur tinggi gambar
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // spasi antara gambar dan teks
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Text(
                            'Nasi Goreng',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm, // Menampilkan icon alaram
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width:
                                    5, // Memberikan spasi antara icon dengan teks
                              ),
                              Text(
                                '20 Menit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                ' Deskripsi ',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Mengatur ketinggian
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/kwetiau.jpg', // Memanggil gambar
                            fit: BoxFit.cover,
                            height: 85, // Menyesuaikan ketinggian gambar
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Menambah spasi antara gambar dan teks
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Text(
                            'Kwetiau',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm, // Menampilkan icon alaram
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // menambah spasi antara teks dan icon
                              ),
                              Text(
                                '10 Menit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                ' Deskripsi ',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Menyesuaikan ketinggian
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/miegoreng.jpg', // Menampilkan gambar
                            fit: BoxFit.cover,
                            height: 85, // Menyesuaikan ketinggian gambar
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height:
                              10, // menambahkan spasi antara teks dan gambar
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // menambahkan padding ke teks
                          child: Text(
                            'Mie Goreng',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm, // Menampilkan icon alaram
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Menambah spasi antara icon dan teks
                              ),
                              Text(
                                '20 Menit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                ' Deskripsi ',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Menyesuaikan ketinggian
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/capcay.jpg', // Menampilkan gambar
                            fit: BoxFit.cover,
                            height: 85, // Menyesuaikan ketinggian gambar
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height:
                              10, // Menambahkan spasi antara gambar dan teks
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Menambahkan padding ke teks
                          child: Text(
                            'Capcay',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm, // Menampilkan icon alaram
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width:
                                    5, // Menambahkan spasi antara icon dan teks
                              ),
                              Text(
                                '10 Menit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                ' Deskripsi ',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120, // Menyesuaikan ketinggian
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'assets/img/sate.jpg', // Memanggil gambar
                            fit: BoxFit.cover,
                            height: 85, // Menyesuaikan tinggi gambar
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10, // Spasi Icon dan Teks
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Memberikan padding untuk teks
                          child: Text(
                            'Sate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              5.0), // Memberikan padding untuk teks
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_alarm, // Membuat icon timer
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5, // Spasi Icon dan Teks
                              ),
                              Text(
                                '10 Menit', //
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                ' Deskripsi ',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add), // Tombol add
        backgroundColor: Colors.red,
      ),
    );
  }
}
