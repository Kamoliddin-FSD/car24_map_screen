import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPac extends StatelessWidget {
  const SearchPac({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Row(
          children: [
            // const Gap(10),
            // Icon(CupertinoIcons.search, color: color, size: 27,weight: 10,),
            // const Gap(8),
            // Text(text, style: TextStyle(color: Colors.black)),
            Expanded(
              child: TextField(
                readOnly: false,
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: GoogleFonts.montserrat(color: Colors.black),
                  prefixIcon: const Icon(CupertinoIcons.search,color: Colors.orange),
                  border: InputBorder.none,
                ),
                maxLines: 1,
              ),
            )
          ],
        )
    );
  }
}
