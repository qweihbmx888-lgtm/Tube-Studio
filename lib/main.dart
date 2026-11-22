
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const TubeStudioApp());
}

class TubeStudioApp extends StatelessWidget {
  const TubeStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tube Studio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080D19),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF7865FF),
          secondary: Color(0xFF16C7B5),
          surface: Color(0xFF151D30),
        ),
        textTheme: GoogleFonts.cairoTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> titles = [
    'الرئيسية',
    'تحليل الفيديو',
    'تحسين المحتوى',
    'قناتي',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF080D19),
          title: Row(
            children: [
              const Icon(Icons.smart_display,
                  color: Color(0xFF7865FF), size: 30),
              const SizedBox(width: 10),
              const Text(
                'Tube Studio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً بك في Tube Studio',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'مركزك الذكي لفهم قناتك وتطوير محتواك.',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 24),
                _sectionTitle('نظرة عامة على القناة'),
                const SizedBox(height: 14),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.45,
                  children: const [
                    _StatCard(
                      title: 'المشاهدات',
                      value: '—',
                      icon: Icons.visibility_outlined,
                      color: Color(0xFF7865FF),
                    ),
                    _StatCard(
                      title: 'المشتركون',
                      value: '—',
                      icon: Icons.people_outline,
                      color: Color(0xFF16C7B5),
                    ),
                    _StatCard(
                      title: 'وقت المشاهدة',
                      value: '—',
                      icon: Icons.schedule,
                      color: Color(0xFFFFB454),
                    ),
                    _StatCard(
                      title: 'الأرباح',
                      value: '—',
                      icon: Icons.attach_money,
                      color: Color(0xFF55D98A),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                _sectionTitle('أدوات Tube Studio'),
                const SizedBox(height: 14),
                _FeatureCard(
                  icon: Icons.analytics_outlined,
                  title: 'تحليل الفيديو بالذكاء الاصطناعي',
                  subtitle: 'اكتشف نقاط القوة والضعف وفرص تحسين الفيديو.',
                  color: const Color(0xFF7865FF),
                  onTap: () => setState(() => selectedIndex = 1),
                ),
                _FeatureCard(
                  icon: Icons.auto_awesome,
                  title: 'تحسين المحتوى',
                  subtitle: 'طوّر العناوين والوصف والأفكار والصور المصغرة.',
                  color: const Color(0xFF16C7B5),
                  onTap: () => setState(() => selectedIndex = 2),
                ),
                _FeatureCard(
                  icon: Icons.video_library_outlined,
                  title: 'إدارة القناة',
                  subtitle: 'تابع أداء قناتك ونموها من مكان واحد.',
                  color: const Color(0xFFFFB454),
                  onTap: () => setState(() => selectedIndex = 3),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xFF11192A),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() => selectedIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.analytics_outlined),
              label: 'التحليل',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome),
              label: 'التحسين',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'قناتي',
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF151D30),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 25),
          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF151D30),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colors.white10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
