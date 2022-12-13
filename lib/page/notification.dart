import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  var faker = Faker();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return NotifItem("https://picsum.photos/id/$index/200/300",
              faker.person.name(), faker.lorem.sentence());
        });
  }
}

class NotifItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const NotifItem(this.imageUrl, this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Color.fromARGB(255, 173, 173, 173)),
      ),
      trailing: const Text(
        '18.00',
        style: TextStyle(color: Color.fromARGB(255, 173, 173, 173)),
      ),
    );
  }
}
