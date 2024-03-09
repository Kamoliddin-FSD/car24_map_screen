import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import 'go_service.dart';

class ServiceAbout extends StatefulWidget {
  const ServiceAbout({super.key});

  @override
  State<ServiceAbout> createState() => _ServiceAboutState();
}

class _ServiceAboutState extends State<ServiceAbout> {

  bool _isIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network('https://www.seat.ps/content/dam/public/seat-website/seat-cars/car-maintenance/article-single-image-maintenance/seat-services-and-repair-maintenance.jpg',fit: BoxFit.cover,),
                  Column(
                    children: [
                      Gap(35),
                      ListTile(
                        leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(CupertinoIcons.back),
                          ),
                        ),
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isIcon = !_isIcon;
                                });
                              },
                              child: Icon(_isIcon ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark)
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: TextButton(
                          onPressed: () {},
                          child: Text('Service car', style: GoogleFonts.montserrat(),)),
                      trailing: TextButton.icon(
                          onPressed: () {},
                          icon:  Icon(CupertinoIcons.star_fill,color: Colors.amberAccent,),
                          label:  Text('5.0', style: GoogleFonts.montserrat(),)),
                    ),
                    ListTile(
                      title: Text('Remont your car',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 28,fontWeight: FontWeight.w700))),
                      subtitle: Text('Uzbekistan, Tashkent, olmazor, Car service',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14))),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.deepOrange,
                                    Colors.red
                                  ]
                              )
                          ),
                          height: 50,
                          width: 200,
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const GoService()));
                              },
                              autofocus: true,
                              icon: const Icon(Icons.assistant_navigation,color: Colors.white,size: 28,),
                              label:  Text('Go to Service',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),)
                          ),
                        )
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandablePageView(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.deepOrange)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text('About',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),textAlign: TextAlign.center,),
                            Text(loremIpsum(), style: GoogleFonts.montserrat(),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text('Service',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),textAlign: TextAlign.center,),
                          const Gap(10),
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.deepOrange)
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white30
                                ),
                                child: const Icon(CupertinoIcons.car_detailed,color: Colors.deepOrange),
                              ),
                              title: Text('Exterior cleaning', style: GoogleFonts.montserrat(),),
                            ),
                          ),
                          const Gap(10),
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.deepOrange)
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white30
                                ),
                                child: const Icon(Icons.cleaning_services_outlined,color: Colors.deepOrange),
                              ),
                              title:  Text('Vacuum cleaning', style: GoogleFonts.montserrat(),),
                            ),
                          ),
                          const Gap(10),
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.deepOrange)
                            ),
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white30
                                ),
                                child: const Icon(Icons.cleaning_services_outlined,color: Colors.deepOrange),
                              ),
                              title: Text('Breaking system', style: GoogleFonts.montserrat(),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Colors.red
                      ]
                  )
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => GoService()));
                },
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.black,
                child: Center(child: Text('Book Service Now',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600)))),
              )
          ),
        )
    );
  }
}
