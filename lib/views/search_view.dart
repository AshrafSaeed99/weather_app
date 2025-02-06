import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
static const routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 10,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              Navigator.pop(context, value);
            },
            style: TextStyle(fontSize: 26, color: Colors.black),
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.black, fontSize: 24),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(color: Colors.black, fontSize: 24),
              
              suffixIcon: const Icon(Icons.search,size: 32,),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              )
            ),
          ),
        ),
      ),
    );
  }
}