import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isPasswordHidden = true; // Untuk mengatur visibilitas password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0), // Warna latar abu-abu terang
      body: Stack(
        children: [
          Positioned(
            top: 80, 
            left: MediaQuery.of(context).size.width * 0.26, // Posisi horizontal tengah
            child: const Text(
              'ℂ𝕖𝕣𝕖𝕓𝕣𝕦𝕞', // Font "Double Struck"
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Posisi Gambar SpadeKing di bawah Teks "Cerebrum"
          Positioned(
            top: 140, // Menyesuaikan posisi vertikal gambar lebih ke atas
            left: MediaQuery.of(context).size.width * 0.32, // Posisi horizontal tengah
            child: Image.asset(
              'assets/images/SpadeKing.png', // Jalur ke file gambar
              height: 150,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Gambar tidak ditemukan'); // Penanganan jika gambar tidak ditemukan
              },
            ),
          ),
          // Form Login
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.4,
                left: 35,
                right: 35,
              ),
              child: Column(
                children: [
                  // TextField untuk Email
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TextField untuk Password
                  TextField(
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Tombol Sign In
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In', 
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4c505b),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Tombol Sign Up dan Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          'Sign Up', 
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?', 
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Color(0xff6c757d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
