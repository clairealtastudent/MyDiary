import 'package:flutter/material.dart';

void main() {
  runApp(const MyDiaryApp());
}

// MY DIARY color palette
const Color primaryPurple = Color(0xFFA68FA9); // for buttons
const Color textPurple = Color(0xFF7A5C85); // text or icons
const Color dividerPurple = Color(0xFFEADBEE); // line divider color
const Color bgLightPurple = Color(0xFFE2CBE6); // bg besides white
const Color darkButton = Color(0xFF2A2431); // button

class DiaryEntry {
  final String title;
  final String content;
  final DateTime date;

  DiaryEntry({required this.title, required this.content, required this.date});
}

// ============================================================================
// SECTION 1: APP SETUP (My Diary App)
// ============================================================================
class MyDiaryApp extends StatelessWidget {
  const MyDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}

// ============================================================================
// SECTION 2: LANDING SCREEN
// ============================================================================
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    print('DEBUG LOG: LandingScreen initialized via initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLightPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle, color: textPurple, size: 40),
              const SizedBox(height: 20),
              const Text(
                'MY DIARY',
                style: TextStyle(
                  fontFamily: 'sans-serif-condensed',
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              const Icon(
                Icons.menu_book_outlined,
                color: textPurple,
                size: 120,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UnlockScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Open',
                  style: TextStyle(color: textPurple, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkButton,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SECTION 3: LOGIN SCREEN
// ============================================================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('DEBUG LOG: LoginScreen initialized via initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'MY DIARY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'sans-serif-condensed',
                  color: primaryPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: primaryPurple,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'e.g. claire@altaglobalsch.com',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email is required';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password is required';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkButton,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Forgot password?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// ============================================================================
// SECTION 4: UNLOCK SCREEN
// ============================================================================
class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    print('DEBUG LOG: UnlockScreen initialized via initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Icon(Icons.settings, color: textPurple),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, size: 60, color: textPurple),
              const SizedBox(height: 30),
              TextFormField(
                controller: _passwordController,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: dividerPurple,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please enter your password';
                  if (value.length < 6)
                    return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Forgot your password?',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  minimumSize: const Size(120, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Access Granted!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Enter',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}

// ============================================================================
// SECTION 5: HOME SCREEN & NAVIGATION MENU
// ============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //diaries saved starts completely empty
  final List<DiaryEntry> _savedEntries = [];

  @override
  void initState() {
    super.initState();
    print('DEBUG LOG: HomeScreen initialized via initState()');
    print('DEBUG LOG: Initial diary entries count: ${_savedEntries.length}');
  }

  void _addNewEntry(DiaryEntry entry) {
    setState(() {
      _savedEntries.add(entry);
    });
    print('DEBUG LOG: New entry added! Total entries: ${_savedEntries.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: bgLightPurple,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'MY DIARY',
                  style: TextStyle(
                    fontFamily: 'sans-serif-condensed',
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                  ),
                ),
              ),
             const SizedBox(height: 40),
              
              _buildDrawerItem(Icons.folder_outlined, 'Schedule', () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScheduleScreen()),
                );
              }),
              
              const SizedBox(height: 4),
              _buildDrawerItem(Icons.add_circle_outline, 'New Task', () {}),
              const SizedBox(height: 4),
              _buildDrawerItem(
                Icons.settings_outlined,
                'Security Setting',
                () {},
              ),
              const SizedBox(height: 4),
              _buildDrawerItem(Icons.alarm, 'Alarm', () {}),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            'MY DIARY',
            style: TextStyle(
              fontFamily: 'sans-serif-condensed',
              color: textPurple,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: textPurple,
              decorationThickness: 1.5,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: textPurple,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NotificationScreen(entries: _savedEntries),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 4.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFFF1E6F5),
              radius: 18,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.person_outline,
                  color: textPurple,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AccountSettingScreen(entries: _savedEntries),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: dividerPurple, height: 1.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello [User],',
                style: TextStyle(
                  fontFamily: 'sans-serif-condensed',
                  color: textPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'How are you feeling today?',
                style: TextStyle(
                  fontFamily: 'sans-serif-condensed',
                  color: textPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Saved Entries: ${_savedEntries.length}',
                style: const TextStyle(
                  color: textPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryPurple,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () async {
                      final newEntry = await Navigator.push<DiaryEntry>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WriteDiaryScreen(entries: _savedEntries),
                        ),
                      );
                      if (newEntry != null) {
                        _addNewEntry(newEntry);
                      }
                    },
                    child: const Text(
                      '+   Write Today’s Diary',
                      style: TextStyle(
                        fontFamily: 'serif',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            alignment: Alignment.bottomLeft,
            height: 60,
            child: IconButton(
              icon: const Icon(Icons.menu, color: textPurple, size: 28),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return Material(
      color: primaryPurple,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(width: 24),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'sans-serif',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SHARED APP BAR & INTERACTION SCREENS
// ============================================================================

PreferredSizeWidget _buildSharedAppBar(
  BuildContext context,
  List<DiaryEntry> entries,
) {
  return AppBar(
    title: const Padding(
      padding: EdgeInsets.only(left: 4.0),
      child: Text(
        'MY DIARY',
        style: TextStyle(
          fontFamily: 'sans-serif-condensed',
          color: textPurple,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: textPurple,
          decorationThickness: 1.5,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications_none, color: textPurple, size: 28),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationScreen(entries: entries),
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 4.0),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFF1E6F5),
          radius: 18,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.person_outline, color: textPurple, size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountSettingScreen(entries: entries),
                ),
              );
            },
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(color: dividerPurple, height: 1.0),
    ),
  );
}

// LAYAR NOTIFIKASI
class NotificationScreen extends StatelessWidget {
  final List<DiaryEntry> entries;

  const NotificationScreen({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, entries),
      body: const SafeArea(
        child: Center(
          child: Text(
            'No notifications yet.',
            style: TextStyle(
              color: textPurple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

// ============================================================================
// LAYAR WRITE DIARY
// ============================================================================
class WriteDiaryScreen extends StatefulWidget {
  final List<DiaryEntry> entries; // Added entries list

  const WriteDiaryScreen({super.key, required this.entries});

  @override
  State<WriteDiaryScreen> createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController _headingController = TextEditingController();
  final TextEditingController _subheadingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('DEBUG LOG: WriteDiaryScreen initialized via initState()');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    String formattedDate =
        "${months[selectedDate.month - 1]} ${selectedDate.day}, ${selectedDate.year}";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, widget.entries),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Write here!',
                style: TextStyle(
                  color: textPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: dividerPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _headingController,
                        decoration: const InputDecoration(
                          hintText: 'Heading',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: darkButton,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: const TextStyle(
                          color: darkButton,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _subheadingController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Subheading',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Row(
                              children: [
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: darkButton,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  size: 14,
                                  color: textPurple,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Tт',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textPurple,
                                ),
                              ),
                              const SizedBox(width: 12),
                              IconButton(
                                icon: const Icon(
                                  Icons.check_box_outlined,
                                  color: textPurple,
                                ),
                                onPressed: () async {
                                  final title = _headingController.text.isEmpty
                                      ? 'Title'
                                      : _headingController.text;
                                  final content = _subheadingController.text;
                                  final newEntry = DiaryEntry(
                                    title: title,
                                    content: content,
                                    date: selectedDate,
                                  );

                                  final result =
                                      await Navigator.push<DiaryEntry>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuoteScreen(
                                            newEntry: newEntry,
                                            entries: widget.entries,
                                          ),
                                        ),
                                      );

                                  if (result != null && context.mounted) {
                                    Navigator.pop(context, result);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: textPurple,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: textPurple,
                size: 24,
              ),
              onPressed: () {
                // Pass correct entr
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SavedEntriesScreen(entries: widget.entries),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _headingController.dispose();
    _subheadingController.dispose();
    super.dispose();
  }
}

// ============================================================================
// LAYAR QUOTE
// ============================================================================
class QuoteScreen extends StatelessWidget {
  final DiaryEntry newEntry;
  final List<DiaryEntry> entries;

  const QuoteScreen({super.key, required this.newEntry, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, entries),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '“Everything happens for a reason. Be yourself and know that’s good enough.”',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  minimumSize: const Size(200, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  final result = await Navigator.push<DiaryEntry>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiarySavedScreen(
                        newEntry: newEntry,
                        entries: entries,
                      ),
                    ),
                  );

                  if (result != null && context.mounted) {
                    Navigator.pop(context, result);
                  }
                },
                child: const Text(
                  'Save Diary',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: textPurple,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: textPurple,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedEntriesScreen(entries: entries),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// LAYAR DIARY SAVED QUOTE
// ============================================================================
class DiarySavedScreen extends StatelessWidget {
  final DiaryEntry newEntry;
  final List<DiaryEntry> entries;

  const DiarySavedScreen({
    super.key,
    required this.newEntry,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, entries),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Diary Saved!',
                style: TextStyle(
                  color: textPurple,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '“You can’t go back and change the beginning, but you can start where you are and change the ending.”\n- C.S. Lewis',
                style: TextStyle(
                  color: textPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                onPressed: () {
                  Navigator.pop(context, newEntry);
                },
                child: const Text(
                  'Return to Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: textPurple,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: textPurple,
                size: 24,
              ),
              onPressed: () {
                final previewList = List<DiaryEntry>.from(entries)
                  ..add(newEntry);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SavedEntriesScreen(entries: previewList),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// LAYAR DAFTAR CATATAN
class SavedEntriesScreen extends StatelessWidget {
  final List<DiaryEntry> entries;

  const SavedEntriesScreen({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, entries),
      body: SafeArea(
        child: entries.isEmpty
            ? const Center(
                child: Text(
                  'No diaries saved yet.',
                  style: TextStyle(color: textPurple, fontSize: 18),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: dividerPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entries[index].title,
                            style: const TextStyle(
                              color: textPurple,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            entries[index].content.isNotEmpty
                                ? entries[index].content
                                : '${index + 1}st diary',
                            style: const TextStyle(
                              color: textPurple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: IconButton(
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

// LAYAR PENGATURAN AKUN
class AccountSettingScreen extends StatelessWidget {
  final List<DiaryEntry> entries;

  const AccountSettingScreen({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildSharedAppBar(context, entries),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: bgLightPurple,
                child: Icon(Icons.person, size: 50, color: textPurple),
              ),
              const SizedBox(height: 8),
              const Text(
                '[User]',
                style: TextStyle(
                  color: textPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '[Email]',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 24),
              _buildBox(
                'Account setting',
                'Change your account & profile settings.\nUpdate information.',
              ),
              const SizedBox(height: 12),
              _buildBox(
                'Help and support',
                'Submit any questions you need answered.',
              ),
              const SizedBox(height: 12),
              _buildBox(
                'App setting',
                'Themes, languages, privacy settings, notifications',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildSmallBox(
                      'Recently deleted',
                      'All deleted diaries are temporarily kept here',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSmallBox(
                      'Log out',
                      'Sign out of your account',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: textPurple,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.article_outlined,
                color: textPurple,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedEntriesScreen(entries: entries),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: dividerPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkButton,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallBox(String title, String subtitle) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: dividerPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: darkButton,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black54, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

// --- DATA MODEL ---
class ScheduleItem {
  final String title;
  final String timeInterval;
  final String date;
  final String description;
  bool isCompleted;

  ScheduleItem({
    required this.title,
    required this.timeInterval,
    required this.date,
    required this.description,
    this.isCompleted = true,
  });
}

// =============================================================================
// 1. SCHEDULE MAIN SCREEN
// =============================================================================
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // Shared state list of schedule items
  List<ScheduleItem> activities = [];
  int selectedDay = 17;
  String selectedMonth = 'Sep';
  String selectedYear = '2026';

  @override
  void initState() {
    super.initState();
  
    activities = [
      ScheduleItem(
        title: 'Group Project',
        timeInterval: '09:00 - 10:00 AM',
        date: 'Sep 17, 2026',
        description: 'Lorem ipsum dolor sit amet',
      ),
      ScheduleItem(
        title: 'Break',
        timeInterval: '2:30 PM - 3:00 PM',
        date: 'Sep 17, 2026',
        description: 'Lorem ipsum dolor sit amet',
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _addNewSchedule(ScheduleItem newItem) {
    setState(() {
      activities.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF6B3A7D);
    const lightPurpleCard = Color(0xFFF3EAF8);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- TOP HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MY DIARY',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD8B4E2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications_none,
                        color: primaryPurple,
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.account_circle_outlined,
                        color: primaryPurple,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Text(
              'Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryPurple,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- CALENDAR CARD ---
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: lightPurpleCard,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          // Calendar Month/Year Selector Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.chevron_left,
                                color: primaryPurple,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedMonth,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedYear,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: primaryPurple,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Days of Week Labels
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                                const ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                                    .map(
                                      (day) => SizedBox(
                                        width: 30,
                                        child: Text(
                                          day,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          const SizedBox(height: 8),

                          // Simple Calendar Grid Sample (September 2026 view)
                          _buildCalendarDaysGrid(primaryPurple),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      "Today's Activities",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryPurple,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // --- TIMELINE ACTIVITIES LIST ---
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        final item = activities[index];
                        final isLast = index == activities.length - 1;
                        return _buildTimelineItem(
                          item,
                          isLast,
                          primaryPurple,
                          lightPurpleCard,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // --- BOTTOM NAVIGATION BAR ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 28,
                      color: primaryPurple,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 32,
                      color: primaryPurple,
                    ),
                    onPressed: () async {
                      // Requirement 3: Navigation & Data Passing with Navigator.push
                      final newSchedule = await Navigator.push<ScheduleItem>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateScheduleScreen(),
                        ),
                      );

                      if (newSchedule != null) {
                        _addNewSchedule(newSchedule);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarDaysGrid(Color primaryPurple) {
    // Basic day array layout representing September
    List<int?> days = [
      null,
      null,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      1,
      2,
      3,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        if (day == null) return const SizedBox.shrink();

        bool isSelected = (day == selectedDay && index < 28);
        bool isNextMonth = index >= 32;

        return GestureDetector(
          onTap: () {
            if (!isNextMonth) {
              setState(() {
                selectedDay = day;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? primaryPurple : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$day',
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Colors.white
                    : (isNextMonth ? Colors.grey.shade400 : Colors.black87),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimelineItem(
    ScheduleItem item,
    bool isLast,
    Color primaryPurple,
    Color lightPurpleCard,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline indicator line + check icon
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryPurple, width: 2),
                  ),
                  child: Icon(Icons.check, size: 16, color: primaryPurple),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade300),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Schedule Details Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: lightPurpleCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.timeInterval,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 2. CREATE SCHEDULE SCREEN
// =============================================================================
class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  // Requirement 2: Declaring TextEditingControllers
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    // Requirement 2: Initializing controllers in initState()
    _titleController = TextEditingController();
    _dateController = TextEditingController(text: 'Saturday, Oct 17, 2026');
    _timeController = TextEditingController(text: '05:00 PM - 7:00 PM');
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // Requirement 2: Disposing controllers in dispose() to prevent memory leaks
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveSchedule() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an Activity Title')),
      );
      return;
    }

    final newSchedule = ScheduleItem(
      title: _titleController.text.trim(),
      date: _dateController.text.trim(),
      timeInterval: _timeController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? 'No additional description'
          : _descriptionController.text.trim(),
    );

    // Requirement 3: Returning data to previous screen with Navigator.pop
    Navigator.pop(context, newSchedule);
  }

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF6B3A7D);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MY DIARY',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD8B4E2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications_none,
                        color: primaryPurple,
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.account_circle_outlined,
                        color: primaryPurple,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Text(
              'Create Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryPurple,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField(
                      'Activity Title',
                      _titleController,
                      'e.g. Gather with Family',
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      'Select Date',
                      _dateController,
                      'e.g. Saturday, Oct 17, 2026',
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      'Time Interval',
                      _timeController,
                      'e.g. 05:00 PM - 7:00 PM',
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      'Description',
                      _descriptionController,
                      'e.g. Don\'t forget to bring bla bla bla bla bla',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 28),

                    // Add to Schedule Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saveSchedule,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEADBEE),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Add to Schedule',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Back Navigation Row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
              ),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: primaryPurple,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6B3A7D)),
            ),
          ),
        ),
      ],
    );
  }
}
