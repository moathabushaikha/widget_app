import 'package:flutter/material.dart';
import 'package:widget_app/services/api_service.dart';

import '../../models/images_model.dart';

class ServerImagesPage extends StatefulWidget {
  const ServerImagesPage({Key? key}) : super(key: key);

  @override
  State<ServerImagesPage> createState() => _ServerImagesPageState();
}

class _ServerImagesPageState extends State<ServerImagesPage> {
  TextEditingController search_cont = TextEditingController();
  late List<ServerImage?> listOfImages;

  @override
  void initState() {
    getImages();
    super.initState();
  }

  void getImages() async {
    listOfImages = await ApiService().getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: search_cont,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orangeAccent.shade100,
              icon: const Icon(Icons.link),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              labelText: 'Photo Url',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            onChanged: searchImage,
          ),
          SizedBox(height: 15,),
          Expanded(
              child: ListView.builder(
            itemCount: listOfImages.length,
            itemBuilder: (context, index) {
              final ServerImage? image = listOfImages[index];
              return ListTile(
                leading: Image.network(
                  image?.url ?? 'https://via.placeholder.com/150/92c952',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
                title: Text(image?.title ?? 'loading title ...'),
              );
            },
          ))
        ],
      ),
    );
  }

  void searchImage(String value) {
    final subList = listOfImages.where((image) {
      final imageTitle = image?.title.toLowerCase();
      final imageId = image?.id;
      var result;
      final input = value.toLowerCase();
        result = imageTitle!.contains(input);
      return result;
    }).toList();
    setState(() => listOfImages = subList);
  }
}
