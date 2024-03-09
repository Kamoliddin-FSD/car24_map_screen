import 'package:animations/animations.dart';
import 'package:car24_map_screen/settings/screens/service_about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: OpenContainer(
          closedElevation: 0,
          closedBuilder: (context, invoke) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      const Row(children: [Icon(CupertinoIcons.star_fill,color: Colors.amberAccent,),Gap(3),Text('5.0')]),
                      Center(
                        child: Image.network('https://img.freepik.com/premium-vector/service-logo-template-design-vector_20029-568.jpg',height: 60,width: 60),
                      ),
                      Text('Car Service',style: GoogleFonts.montserrat(color: Colors.black)),
                      const Divider(),
                      Row(
                        children: [
                          Icon(Icons.call),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text('+998777678757',style: GoogleFonts.montserrat(textStyle: TextStyle(overflow: TextOverflow.visible)))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          openBuilder: (context, invoke) => const ServiceAbout()
      ),
    );
  }
}
