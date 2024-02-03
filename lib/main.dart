import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        elevation: 3,
        shadowColor: Colors.grey,
        title: const Text("Google Classroom"),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "Google Classroom",
                  style: TextStyle(fontSize: 22, color: Colors.black54),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.black12,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    margin: const EdgeInsets.only(
                        left: 0, top: 10, right: 15, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: Colors.blue[800],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Kelas",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10),
          child: Column(
            children: [
              ClassCard(
                image: "assets/images/honors.jpg",
                className: "Mobile Programing",
                section: "Internship 8.0",
                owner: "Haulul",
              ),
              ClassCard(
                image: "assets/images/graduation.jpg",
                className: "Sertifikasi BNSP",
                section: "Digital Marketing",
                owner: "Karirjitu.id",
              ),
              ClassCard(
                image: "assets/images/code.jpg",
                className: "XI-IPA 5",
                section: "Matematika Peminatan",
                owner: "Idah Isnendawati",
              ),
              ClassCard(
                image: "assets/images/honors.jpg",
                className: "XI-IPA 5",
                section: "Fisika",
                owner: "Pipin",
              ),
              ClassCard(
                image: "assets/images/code.jpg",
                className: "PAI XI-IPA 5",
                section: "BAB 1",
                owner: "Deni Fuad Amin",
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.add,
          color: Colors.blue[800],
        ),
      ),
    );
  }
}

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  int index = 0;

  List pageBar = const [
    ClassForumBar(),
    ClassAssignmentBar(),
    ClassMemberBar(),
  ];

  List page = const [
    ClassForum(),
    ClassAssignment(),
    ClassMember(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: pageBar[index],
      ),
      drawer: const ClassDrawer(),
      body: page[index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
          ),
        ]),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          selectedItemColor: Colors.black87,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.forum_outlined), label: "Forum"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined), label: "Tugas Kelas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined), label: "Orang"),
          ],
        ),
      ),
    );
  }
}

class ClassForumBar extends StatelessWidget {
  const ClassForumBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black87,
      elevation: 3,
      shadowColor: Colors.grey,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}

class ClassAssignmentBar extends StatelessWidget {
  const ClassAssignmentBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black87,
      elevation: 3,
      shadowColor: Colors.grey,
      title: const Text("Mobile Programming Flutter"),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.assignment_ind_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}

class ClassMemberBar extends StatelessWidget {
  const ClassMemberBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black87,
      elevation: 3,
      shadowColor: Colors.grey,
      title: const Text("Mobile Programming Flutter"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}

class ClassDrawer extends StatelessWidget {
  const ClassDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Google Classroom",
                style: TextStyle(fontSize: 22, color: Colors.black54),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.black12,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const HomePage())),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    margin: const EdgeInsets.only(
                        left: 0, top: 10, right: 15, bottom: 5),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Kelas",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClassForum extends StatelessWidget {
  const ClassForum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/honors.jpg"),
                        fit: BoxFit.cover)),
                margin: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 10, right: 10),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Mobile Programming",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Internship 8.0",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 10, right: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/profile.png"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Umumkan sesuatu ke kelas anda",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const PostCard(
                image: "assets/images/profile.png",
                postTitle: "Tugas baru: Week 7 Assigment",
                date: "28 Jan",
              ),
              const PostCard(
                image: "assets/images/profile.png",
                postTitle: "Tugas baru: Week 5 Assignment (Firebase)",
                date: "28 Jan",
              ),
              const PostCard(
                image: "assets/images/profile.png",
                postTitle: "Tugas baru: Week 3 Assigment",
                date: "28 Jan",
              ),
              const PostCard(
                image: "assets/images/profile.png",
                postTitle: "Tugas baru: Week 1 Assignment (Slicing)",
                date: "10 Jan",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassAssignment extends StatelessWidget {
  const ClassAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AssignmentCard(
              assignmentTitle: "Week 7 Assignment (Firebase)",
              date: "28 Jan",
            ),
            AssignmentCard(
              assignmentTitle: "Week 5 Assignment (Firebase)",
              date: "28 Jan",
            ),
            AssignmentCard(
              assignmentTitle: "Week 3 Assignment",
              date: "28 Jan",
            ),
            AssignmentCard(
              assignmentTitle: "Week 1 Assignment (Slicing)",
              date: "10 Jan",
            ),
          ],
        ),
      ),
    );
  }
}

class ClassMember extends StatelessWidget {
  const ClassMember({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengajar",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            MemberCard(
              image: "assets/images/profile.png",
              name: "Haulul",
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Teman Sekelas",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            MemberCard(
              image: "assets/images/profile.png",
              name: "Fauzein",
            ),
            MemberCard(
              image: "assets/images/profile.png",
              name: "Iksan",
            ),
          ],
        ),
      ),
    );
  }
}

class AssigmentComment extends StatelessWidget {
  const AssigmentComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        elevation: 3,
        shadowColor: Colors.grey,
        title: const Text("Komentar Kelas"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CommentCard(
              image: "assets/images/profile.png",
              name: "Haulul",
              date: "28 Jan 2024",
              message: "Baik Bu",
            ),
            CommentCard(
              image: "assets/images/profile.png",
              name: "Iksan",
              date: "28 Jan 2024",
              message: "Mantap bu",
            ),
            CommentCard(
              image: "assets/images/profile.png",
              name: "Fauzein",
              date: "28 Jan 2024",
              message: "GG gaming",
            ),
            CommentCard(
              image: "assets/images/profile.png",
              name: "Haulul",
              date: "10 Jan 2024",
              message: "Waalaikumsalam bu....",
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String image;
  final String postTitle;
  final String date;
  const PostCard({
    super.key,
    required this.image,
    required this.postTitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(image),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  postTitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 26,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black12,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AssigmentComment())),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      "Tambahkan komentar kelas",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String image;
  final String className;
  final String section;
  final String owner;
  const ClassCard({
    super.key,
    required this.image,
    required this.className,
    required this.section,
    required this.owner,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ClassPage())),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        margin: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  className,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                Text(
                  section,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  owner,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final String assignmentTitle;
  final String date;

  const AssignmentCard({
    super.key,
    required this.assignmentTitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(25)),
              width: 42,
              height: 42,
              child: const Icon(
                Icons.assignment_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assignmentTitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String image;
  final String name;

  const MemberCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String message;

  const CommentCard({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
