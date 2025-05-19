// ===== ranking_view.dart =====
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ranking_controller.dart';

class RankingView extends GetView<RankingController> {
  const RankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peringkat Digital'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TOP 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _topCard('Choi Beomgyu', 2, 234),
                Column(
                  children: [
                    const Icon(Icons.emoji_events, color: Colors.amber, size: 36),
                    _topCard('Farah Salsabila', 1, 234, isFirst: true),
                  ],
                ),
                _topCard('Yoon Jeonghan', 3, 234),
              ],
            ),
            const SizedBox(height: 24),
            // OTHER RANKS
            Expanded(
              child: ListView(
                children: controller.rankings
    .where((e) => (e['rank'] as int) > 3 && (e['rank'] as int) != controller.userRank.value)
    .map((e) => _rankItem(
          e['rank'] as int,
          e['name'] as String,
          e['score'] as int,
        ))
    .toList(),
              ),
            ),
            // USER RANK
            _rankItem(
              controller.userRank.value,
              controller.userName,
              controller.userScore.value,
              isUser: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _topCard(String name, int rank, int score, {bool isFirst = false}) {
    return Column(
      children: [
        const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF1B263B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text('$rank', style: const TextStyle(color: Colors.white)),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text('234', style: TextStyle(color: Colors.white, fontSize: 12))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _rankItem(int rank, String name, int score, {bool isUser = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xFF1B263B) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isUser
            ? [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))]
            : [],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 14, backgroundColor: Colors.grey.shade800, child: Text('$rank', style: const TextStyle(color: Colors.white))),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: TextStyle(color: isUser ? Colors.white : Colors.black))),
          Text('$score', style: TextStyle(color: isUser ? Colors.amber : Colors.black)),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.amber, size: 16)
        ],
      ),
    );
  }
}