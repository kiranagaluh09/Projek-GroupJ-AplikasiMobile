import 'package:flutter/material.dart';
import 'package:managment/data/model/add_date.dart';
import 'dart:io';

class DetailScreen extends StatelessWidget {
  final Add_data history;

  const DetailScreen({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E232C),
      appBar: AppBar(
    backgroundColor: Color(0xFF1E232C), // Warna background App Bar
    title: Text(
      'Transaction Detail',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white, // Ubah warna ikon menjadi putih
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ), // Menempatkan teks di tengah App Bar
  ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailTile('Transaction Name:', history.name),
                  _buildDetailTile('Amount:', history.amount),
                  _buildDetailTile('Date:', history.datetime.toString()),
                  _buildDetailTile('Category:', history.IN),
                  _buildDetailTile('Explanation:', history.explain),
                  SizedBox(height: 20),
                  if (history.imagePath != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ImageScreen(
                              imagePath: history.imagePath!,
                            ),
                          ),
                        );
                      },child: Center(
                      child: Hero(
                        tag: 'imageHero',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(history.imagePath!),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),)
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String imagePath;

  const ImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E232C),
      body: InteractiveViewer(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.file(
              File(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
