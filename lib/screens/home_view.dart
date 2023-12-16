import 'package:flutter/material.dart';
import 'package:takehomeproject/data/api.dart';
import 'package:takehomeproject/screens/detail_view.dart';
import '../models/nobel_prizess.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<NobelPrize>>? _future;

  @override
  void initState() {
    super.initState();
    _future = Api.fetchNobelPrizes();
  }

  Future<void> _refreshData() async {
    setState(() {
      _future = Api.fetchNobelPrizes();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.workspace_premium, color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text(
            'Nobel Prizes',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _refreshData,
            icon: const Icon(Icons.refresh, color: Colors.black),
          )
        ],
      ),
      body: FutureBuilder<List<NobelPrize>>(
        future: _future,
        builder: (context, snapshot) {
          //error handling
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final nobelPrizes = snapshot.data!;
            //Builder widget
            return ListView.builder(
              itemCount: nobelPrizes.length,
              itemBuilder: (context, index) {
                final nobelPrize = nobelPrizes[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailView(nobelPrize: nobelPrize),
                      ),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.19,
                          padding: const EdgeInsets.all(2),
                          child: const CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  child: Text(
                                    '${nobelPrize.awardYear}-${nobelPrize.category}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 5,
                                  top: 0,
                                  child: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Date Awarded: ${nobelPrize.dateAwarded}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            for (var laureate in nobelPrize.laureates ?? [])
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Laureate: ${laureate.knownName}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.80,
                                    ),
                                    child: Text(
                                      'Motivation: ${laureate.motivation}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
