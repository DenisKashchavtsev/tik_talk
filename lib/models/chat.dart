class Chat {
  String name;
  int unreadCount;
  String lastMessage;

  Chat(
      {required this.name,
      required this.lastMessage,
      required this.unreadCount});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        name: json['name'] ?? '',
        unreadCount: json['unreadCount'] ?? 0,
        lastMessage: json['lastMessage'] ?? '');
  }
}
