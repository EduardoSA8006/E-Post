import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              'assets/images/icon.png',
              width: 4110,
              height: 4110,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              "Crie sua conta.",
              style: GoogleFonts.inter(
                  color: const Color.fromRGBO(6, 45, 253, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 13),
            Text("E-mail",
                style: GoogleFonts.inter(color: Color.fromARGB(6, 45, 253, 1))),
            const TextField(
              cursorColor: Color.fromARGB(255, 64, 115, 255),
              decoration: InputDecoration(
                hintText: "Digite o seu e-mail",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(48, 122, 232, 0.4), fontSize: 14),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              cursorColor: Color.fromARGB(255, 64, 115, 255),
              decoration: InputDecoration(
                hintText: "Digite sua senha",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(48, 122, 232, 0.4), fontSize: 14),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(17),
                ),
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 0.8),
                  borderRadius: BorderRadius.circular(7)),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white70, width: 0.8),
                ),
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
