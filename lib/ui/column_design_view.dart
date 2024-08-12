import 'package:flutter/material.dart';
import 'package:flutter_responsive/ui/context_extension.dart';

class ColumnDesignView extends StatefulWidget {
  const ColumnDesignView({super.key});

  @override
  State<ColumnDesignView> createState() => _ColumnDesignViewState();
}

class _ColumnDesignViewState extends State<ColumnDesignView> {
  final sampleCharUrl = "https://picsum.photos/200/300";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: _bottomNavigationBarSample,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 15, child: Center(child: Image.network(sampleCharUrl))),
            Expanded(flex: 5, child: buildRowItems()),
            Expanded(
                flex: 5, child: Text("Accent", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 30))),
            Expanded(
                flex: 5,
                child:
                    Text("data" * 10, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red))),
            const Expanded(flex: 5, child: Placeholder()),
            Expanded(flex: 5, child: buildRowByButton())
          ],
        ),
      ),
    );
  }

  Row buildRowByButton() {
    return const Row(
      children: [
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
        IconButton(icon: Icon(Icons.favorite), onPressed: null),
      ],
    );
  }

  Row buildRowItems() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(radius: 5),
        CircleAvatar(radius: 5, backgroundColor: Colors.black26),
        CircleAvatar(radius: 5),
        CircleAvatar(radius: 5),
      ],
    );
  }

  AppBar buildAppBar() => AppBar(title: const Text("Hello"));

  BottomNavigationBar get _bottomNavigationBarSample {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.h_mobiledata), label: "ahah"),
      BottomNavigationBarItem(icon: Icon(Icons.face), label: "ahah"),
    ]);
  }
}
