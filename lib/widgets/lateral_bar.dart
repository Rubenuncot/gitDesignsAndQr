import 'package:flutter/material.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(20)),
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(226, 56, 56, 56),
                backgroundBlendMode: BlendMode.dstOut

              ),
              margin: const EdgeInsets.all(0) ,
              height: size.height * 0.8,
              width: size.width * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.construction_sharp, color: Colors.white,)),
                  Container(
                    width: 50,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1000)
                    ),
                  ),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.inventory, color: Colors.white,)),
                  IconButton(onPressed: () {
                    
                  }, icon:const  Icon(Icons.person_search_outlined, color: Colors.white,)),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.edit_document, color: Colors.white,)),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.comment, color: Colors.white,)),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: 50,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1000)
                    ),
                  ),
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.menu_open, color: Colors.white,)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
