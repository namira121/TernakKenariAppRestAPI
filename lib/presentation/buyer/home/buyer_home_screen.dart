import 'package:canary_project/core/core.dart';
import 'package:canary_project/presentation/auth/bloc/login_screen.dart';
import 'package:canary_project/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_bloc.dart';
import 'package:canary_project/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_event.dart';
import 'package:canary_project/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_state.dart';
import 'package:canary_project/presentation/buyer/profile/buyer_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetBurungTersediaBloc>().add(GetAllBurungTersediaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Text("Profil User"),
                  const SizedBox(height: 10),
                  Text("Silahkan masuk pada menu bawah"),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile User'),
              onTap: () {
                context.push(const BuyerProfileScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                context.pushAndRemoveUntil(
                  const LoginScreen(),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: "Cari Burung",
                        hintText: "Masukkan nama burung",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        // bisa untuk search if needed
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<GetBurungTersediaBloc, GetBurungTersediaState>(
                builder: (context, state) {
                  if (state is GetBurungTersediaLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is GetBurungTersediaLoaded) {
                    if (state.burungTersedia.isEmpty) {
                      return const Center(
                        child: Text("Tidak ada burung tersedia"),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.burungTersedia.length,
                      itemBuilder: (context, index) {
                        final burung = state.burungTersedia[index];

                        return GestureDetector(
                          onTap: () {
                            context.push(
                              BuyerDetailBirdScreen(
                                idBurung: burung.id ?? "",
                                namaBurung: burung.nama ?? "",
                                deskripsiBurung: burung.deskripsi ?? "Tidak ada deskripsi",
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    burung.image ?? "",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          burung.nama ?? "",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        Text(
                                          "Harga: ${burung.harga ?? ""}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          "Stok: ${burung.ketersediaan ?? ""}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          "Deskripsi: ${burung.deskripsi ?? ""}",
                                          style: Theme.of(context).textTheme.bodySmall,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox(); // default kosong
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
