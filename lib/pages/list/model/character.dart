class Character {
  final String avatar;
  final String title;
  final String description;
  final int color;

  Character({
    required this.avatar,
    required this.title,
    required this.description,
    required this.color,
  });

  Character copyWith({
    String? avatar,
    String? title,
    String? description,
    int? color,
  }) {
    return Character(
      avatar: avatar ?? this.avatar,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }
}

final List<Character> characters = [
  Character(
    title: 'Android 13',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155228-untitled_1.png',
    color: 0xFFE83835,
  ),
  Character(
    title: 'Android 14',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538740-a_14.jpg',
    color: 0xFF11A01D,
  ),
  Character(
    title: 'Android 15',
    description:
        'Twin brother of Android 18 (technically Cyborgs in this case) Android 17 was created by Dr. Gero, but rebelled and killed him. 17 is absorbed by Cell and dies with him, but is later wished back to life with Cell&#039;s victims. He becomes a Park Ranger and starts a family.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538746-a15.png',
    color: 0xFAB1C308,
  ),
  Character(
    title: 'Android 16',
    description:
        'Android 16 is an android created by Dr. Gero to kill Goku.  He was considered a failure and remained deactivated until Android 17 killed Gero and activated him.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/34651/1224189-016.jpg',
    color: 0xFF6E0FAD,
  ),
  Character(
    title: 'Android 17',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/5457/330298-android172.jpg',
    color: 0xFF0BAFE0,
  ),
  Character(
    title: 'Android 18',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155589-untitled_1.png',
    color: 0xFF2CC7A5,
  ),
  Character(
    title: 'Babidi',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155211-untitled_1.png',
    color: 0xFFB80C84,
  ),
  Character(
    title: 'Badrock',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/31/11745-bardock.jpg',
    color: 0xFFE0740E,
  ),
  Character(
    title: 'Beerus',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/16/164924/2418767-bills.png',
    color: 0xFF0D9ADB,
  ),
  Character(
    title: 'Bido',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/33873/1679705-bido.png',
    color: 0xFF0B2EC8,
  ),
  Character(
    title: 'Android 13',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155228-untitled_1.png',
    color: 0xFFE83835,
  ),
  Character(
    title: 'Android 14',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538740-a_14.jpg',
    color: 0xFF11A01D,
  ),
  Character(
    title: 'Android 15',
    description:
        'Twin brother of Android 18 (technically Cyborgs in this case) Android 17 was created by Dr. Gero, but rebelled and killed him. 17 is absorbed by Cell and dies with him, but is later wished back to life with Cell&#039;s victims. He becomes a Park Ranger and starts a family.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538746-a15.png',
    color: 0xFAB1C308,
  ),
  Character(
    title: 'Android 16',
    description:
        'Android 16 is an android created by Dr. Gero to kill Goku.  He was considered a failure and remained deactivated until Android 17 killed Gero and activated him.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/34651/1224189-016.jpg',
    color: 0xFF6E0FAD,
  ),
  Character(
    title: 'Android 17',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/5457/330298-android172.jpg',
    color: 0xFF0BAFE0,
  ),
  Character(
    title: 'Android 18',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155589-untitled_1.png',
    color: 0xFF2CC7A5,
  ),
  Character(
    title: 'Babidi',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155211-untitled_1.png',
    color: 0xFFB80C84,
  ),
  Character(
    title: 'Badrock',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/31/11745-bardock.jpg',
    color: 0xFFE0740E,
  ),
  Character(
    title: 'Beerus',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/16/164924/2418767-bills.png',
    color: 0xFF0D9ADB,
  ),
  Character(
    title: 'Bido',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/33873/1679705-bido.png',
    color: 0xFF0B2EC8,
  ),
  Character(
    title: 'Android 13',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155228-untitled_1.png',
    color: 0xFFE83835,
  ),
  Character(
    title: 'Android 14',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538740-a_14.jpg',
    color: 0xFF11A01D,
  ),
  Character(
    title: 'Android 15',
    description:
        'Twin brother of Android 18 (technically Cyborgs in this case) Android 17 was created by Dr. Gero, but rebelled and killed him. 17 is absorbed by Cell and dies with him, but is later wished back to life with Cell&#039;s victims. He becomes a Park Ranger and starts a family.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/8/89459/1538746-a15.png',
    color: 0xFAB1C308,
  ),
  Character(
    title: 'Android 16',
    description:
        'Android 16 is an android created by Dr. Gero to kill Goku.  He was considered a failure and remained deactivated until Android 17 killed Gero and activated him.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/34651/1224189-016.jpg',
    color: 0xFF6E0FAD,
  ),
  Character(
    title: 'Android 17',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/5457/330298-android172.jpg',
    color: 0xFF0BAFE0,
  ),
  Character(
    title: 'Android 18',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155589-untitled_1.png',
    color: 0xFF2CC7A5,
  ),
  Character(
    title: 'Babidi',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/39164/1155211-untitled_1.png',
    color: 0xFFB80C84,
  ),
  Character(
    title: 'Badrock',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/0/31/11745-bardock.jpg',
    color: 0xFFE0740E,
  ),
  Character(
    title: 'Beerus',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/16/164924/2418767-bills.png',
    color: 0xFF0D9ADB,
  ),
  Character(
    title: 'Bido',
    description:
        'Finished long after Dr. Gero&#039;s death by his self-aware supercomputer, Android 13 is specifically designed to destroy Goku. He can obtain a greater form once absorbing components from #14 and #15.',
    avatar:
        'https://www.giantbomb.com/a/uploads/square_small/3/33873/1679705-bido.png',
    color: 0xFF0B2EC8,
  ),
];
