import 'package:flutter/material.dart';
import 'package:flutter_responsive/ui/context_extension.dart';

class ListViewDesign extends StatefulWidget {
  const ListViewDesign({super.key});

  @override
  State<ListViewDesign> createState() => _ListViewDesignState();
}

class _ListViewDesignState extends State<ListViewDesign> {
  final sampleCharUrl = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: BuildListViewCardItems(context),
    );
  }

  ListView BuildListViewCardItems(BuildContext context) {
    return ListView(children: [
      Text("Explore", style: context.theme.textTheme.displaySmall),
      SizedBox(
        height: context.dynamicHeight(0.2),
        child: Row(
          children: [
            Expanded(child: BuildCardItems()),
            Expanded(child: BuildCardItems()),
            Expanded(child: BuildCardItems()),
          ],
        ),
      ),
      SizedBox(
        height: context.dynamicHeight(0.1),
        child: BuildListViewCategory(),
      ),
      BuildGridView()
    ]);
  }

  ListView BuildListViewCategory() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: context.paddingLow,
        child: const Text('data'),
      ),
    );
  }

  GridView BuildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1, crossAxisSpacing: 10, mainAxisSpacing: 20, crossAxisCount: 2),
      itemBuilder: (context, index) => chairsCard(sampleCharUrl: sampleCharUrl),
    );
  }

  Card BuildCardItems() {
    return Card(
      child: ListTile(
        title: Image.network("https://picsum.photos/200/300"),
        subtitle: const Text("Sample Text"),
      ),
    );
  }
}

class chairsCard extends StatelessWidget {
  const chairsCard({
    super.key,
    required this.sampleCharUrl,
  });

  final String sampleCharUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Image.network(sampleCharUrl, fit: BoxFit.scaleDown),
        subtitle: Text("ad"),
      ),
    );
  }
}
