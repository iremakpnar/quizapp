import 'package:flutter/material.dart';
import 'package:ygkdemo/Pages/atikquiz.dart';
import 'package:ygkdemo/Pages/bilim.dart';
import 'package:ygkdemo/Pages/carbonquiz.dart';
import 'package:ygkdemo/Pages/iklimquiz.dart';
import 'package:ygkdemo/Pages/kulturquiz.dart';
import 'package:ygkdemo/Pages/sukullanimiquiz.dart';
class HomePage extends StatefulWidget {
  final VoidCallback onMenuTap;

  const HomePage({super.key, required this.onMenuTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xoffset = 0;
  double yoffset= 0;
  bool isDrawerOpen= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFedf3f6),
      body: SingleChildScrollView(
        child: AnimatedContainer(
          transform: Matrix4.translationValues(xoffset, yoffset, 0)
            ..scale(isDrawerOpen ? 0.85: 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          duration: Duration(milliseconds: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 20,top: 30),
                   child: Row(
                     children: [
                       isDrawerOpen ?
                       GestureDetector(
                         child: Icon(Icons.arrow_back_ios, size: 20,),
                         onTap: (){
                           setState(() {
                             xoffset = 0;
                             yoffset = 0;
                             isDrawerOpen = false;
                           });

                         },
                       )
                       :GestureDetector(
                         child: Image.asset("icons/list.png", height: 32, width: 32),
                         onTap: widget.onMenuTap, // `MainScreen`'den gelen fonksiyon çağrılıyor
                       ),
                       Padding(
                         padding: const EdgeInsets.all(25.0),
                         child: Image.asset("images/üst.png",height: 100,width: 300,fit: BoxFit.cover,),
                       )
                     ],
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(30)
                   ),
                   margin: EdgeInsets.only(top: 150.0,left: 20,right: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Image.asset("images/soru.png",width: 200,height: 300,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("PLAY &\n WİN ", style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),),
                           Text("Play Quiz by  \nguessing the image ", style: TextStyle(color: Color(0xFFa4a4a4), fontSize: 15.0, fontWeight: FontWeight.w500),)
                         ],
                       ),

                     ],
                   ),
                 ),
               ]
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Top Quiz Categories", style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                    borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                        width:150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                          child:
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IklimQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/iklim.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("İklim", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          GestureDetector(
                            onTap: () {
                              // İklim sayfasına yönlendirme
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AtikQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/garbage.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("Atık", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          GestureDetector(
                            onTap: () {
                              // İklim sayfasına yönlendirme
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CarbonquizQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/carbon.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("Ayak İzi", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          GestureDetector(
                            onTap: () {
                              // İklim sayfasına yönlendirme
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SuKullanimiQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/sukul.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("Su Kullanımı", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          GestureDetector(
                            onTap: () {
                              // İklim sayfasına yönlendirme
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GenelKulturQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/kultur.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("Genel Kültür", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 6.0,
                      child: Container(
                          width:150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          GestureDetector(
                            onTap: () {
                              // İklim sayfasına yönlendirme
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BilimQuestion()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset("icons/bilim.png",height: 80,width: 80,fit: BoxFit.cover,),
                                SizedBox(height: 20.0,),
                                Text("Bilim", style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
