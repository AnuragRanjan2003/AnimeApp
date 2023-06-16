import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String imageUrl;
  final String type;
  final String title;
  final String status;

  const ListCard({super.key,
    required this.imageUrl,
    required this.type,
    required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image(
                  image: NetworkImage(imageUrl),
                  height: 200,
                ),
              ),
              Positioned(
                top: 10,
                right: 20,
                child: Chip(
                  label: Text(
                    type, style: const TextStyle(color: Colors.black87),),
                  backgroundColor: Colors.white,
                  elevation: 8,
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,),
                  Text(status, style: const TextStyle(fontSize: 14,color: Colors.black54))
                ],
              )
          )
        ],
      ),
    );
  }
}
