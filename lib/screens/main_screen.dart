import 'package:flutter/material.dart';
import 'package:flutter_projects/api/api_service.dart';
import 'package:flutter_projects/ui/list_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? _index = 1;
  ApiService api = ApiService.create();
  final List<String> _list = ["Anime", "Manga", "Manwha"];
  final String url =
      "https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1";

  @override
  Widget build(BuildContext context) {
    getResponse();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        foregroundImage: AssetImage('assets/images/man.png'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Text(
                            "name",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_list.length, (index) {
                  return ChoiceChip(
                    label: Text(
                      _list[index],
                      style: TextStyle(color: setTextColor(index, _index)),
                    ),
                    selected: index == _index,
                    selectedColor: Theme.of(context).primaryColor,
                    onSelected: (bool it) {
                      setState(() {
                        _index = it ? index : null;
                      });
                    },
                  );
                }),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListCard(
                        imageUrl: url,
                        type: "image",
                        title: "example",
                        status: "done");
                  },
                  shrinkWrap: true,
                  itemCount: _list.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color? setTextColor(int i, int? ind) {
    if (ind == null) return Colors.black45;
    if (i == ind) return Colors.white;
    return Colors.black45;
  }

  void getResponse() async {
    await api.getAllAnimes().then((value) => {
          if (value.isSuccessful ){
            print(" data len : ${value.body!.data!.length}\ndata val : ${value.body!.data![0].title}")

          }
          else
            print(value.error.toString())
        });
  }
}
