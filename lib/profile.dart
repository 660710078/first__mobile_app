import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 240, 255),
      //appBar: AppBar(title: Text('Profile'),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('cream.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            
            Positioned(
              top: 220,
              child: Text("Thitichaya Krueangphatee ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                )
              ),
            ),

            Positioned(
              top: 260,
              child: Text("ID: 660710078",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                )
              ),
            ),

  
            Positioned(
              bottom: 40,
              child: Text('" Seize the opportunity by the beard,for it is bald behind. "',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
                )
            ),

            // Positioned(
            //   bottom: 20, // ตัวอย่างการกำหนดตำแหน่ง
            //   left: 0,
            //   right: 0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ElevatedButton.icon(
            //         onPressed: () {
            //           // โค้ดที่ต้องการให้ทำงานเมื่อกดปุ่ม
            //         },
            //         icon: Image.asset('assets/images/my_image.png', width: 24, height: 24),
            //         label: Text('ปุ่มที่มีรูปภาพ'),
            //       ),
            //       SizedBox(width: 20,),
            //       FaIcon(FontAwesomeIcons.instagram, color: Colors.pink, size: 30),
            //       SizedBox(width: 20,),
            //       FaIcon(FontAwesomeIcons.github, color: Colors.black, size: 30),
            //       SizedBox(width: 20,),
            //     ],
            //   )
            // )
            
          ],
      ),
     )
    );
  }
}