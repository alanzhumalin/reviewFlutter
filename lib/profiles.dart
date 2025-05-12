import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/logic/profiles_bloc.dart';
import 'package:posts/logic/profiles_event.dart';
import 'package:posts/logic/profiles_state.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocConsumer<ProfilesBloc, ProfilesState>(
        listener: (context, state) {
          if (state is ProfilesError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfilesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfilesLoaded) {
            final profiles = state.profiles;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProfilesBloc>().add(LoadProfiles());
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: profiles.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final user = profiles[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              radius: 25,
                              child: Text(user.name[0]),
                            ),
                            title: Text(user.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            subtitle: Text(user.email),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              _InfoChip(
                                  icon: Icons.person, label: user.username),
                              _InfoChip(icon: Icons.phone, label: user.phone),
                              _InfoChip(
                                  icon: Icons.location_city,
                                  label: user.address.city),
                              _InfoChip(
                                  icon: Icons.home,
                                  label:
                                      '${user.address.street}, ${user.address.zipcode}'),
                              _InfoChip(
                                  icon: Icons.business,
                                  label: user.company.name),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '"${user.company.catchPhrase}"',
                            style: const TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const Center(child: Text('Nothing to show'));
        },
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontSize: 12)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
