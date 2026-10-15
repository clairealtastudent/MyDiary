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

  DiaryEntry({
    required this.title,
    required this.content,
    required this.date,
  });
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPurple,
        ),
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
              const Icon(Icons.menu_book_outlined, color: textPurple, size: 120),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UnlockScreen()),
                  );
                },
                child: const Text('Open', style: TextStyle(color: textPurple, fontSize: 18)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkButton,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Log in', style: TextStyle(color: Colors.white, fontSize: 18)),
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
              const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'e.g. claire@altaglobalsch.com',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password is required';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkButton,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 16),
              const Text('Forgot password?', style: TextStyle(decoration: TextDecoration.underline)),
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
          SizedBox(width: 16)
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
                    icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your password';
                  if (value.length < 6) return 'Password must be at least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('Forgot your password?', style: TextStyle(decoration: TextDecoration.underline)),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  minimumSize: const Size(120, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }
                },
                child: const Text('Enter', style: TextStyle(color: Colors.white, fontSize: 16)),
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
              _buildDrawerItem(Icons.folder_outlined, 'Schedule', () {}),
              const SizedBox(height: 4),
              _buildDrawerItem(Icons.add_circle_outline, 'New Task', () {}),
              const SizedBox(height: 4),
              _buildDrawerItem(Icons.settings_outlined, 'Security Setting', () {}),
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
            icon: const Icon(Icons.notifications_none, color: textPurple, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen(entries: _savedEntries)),
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
                    MaterialPageRoute(builder: (context) => AccountSettingScreen(entries: _savedEntries)),
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
                style: const TextStyle(color: textPurple, fontWeight: FontWeight.w600),
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
                        MaterialPageRoute(builder: (context) => WriteDiaryScreen(entries: _savedEntries)),
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

PreferredSizeWidget _buildSharedAppBar(BuildContext context, List<DiaryEntry> entries) {
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
            MaterialPageRoute(builder: (context) => NotificationScreen(entries: entries)),
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
                MaterialPageRoute(builder: (context) => AccountSettingScreen(entries: entries)),
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
            style: TextStyle(color: textPurple, fontSize: 18, fontWeight: FontWeight.bold),
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
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    String formattedDate = "${months[selectedDate.month - 1]} ${selectedDate.day}, ${selectedDate.year}";

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
                style: TextStyle(color: textPurple, fontSize: 20, fontWeight: FontWeight.bold),
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
                          hintStyle: TextStyle(color: darkButton, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: const TextStyle(color: darkButton, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _subheadingController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Subheading',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          style: const TextStyle(color: Colors.black87, fontSize: 12),
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
                                const Icon(Icons.calendar_month_outlined, size: 14, color: textPurple),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Text('Tт', style: TextStyle(fontWeight: FontWeight.bold, color: textPurple)),
                              const SizedBox(width: 12),
                              IconButton(
                                icon: const Icon(Icons.check_box_outlined, color: textPurple),
                                onPressed: () async {
                                  final title = _headingController.text.isEmpty ? 'Title' : _headingController.text;
                                  final content = _subheadingController.text;
                                  final newEntry = DiaryEntry(title: title, content: content, date: selectedDate);
                                  
                                  final result = await Navigator.push<DiaryEntry>(
                                    context, 
                                    MaterialPageRoute(builder: (context) => QuoteScreen(newEntry: newEntry, entries: widget.entries)),
                                  );
                                  
                                  if (result != null && context.mounted) {
                                    Navigator.pop(context, result);
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      )
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
              icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.article_outlined, color: textPurple, size: 24),
              onPressed: () {
                // Pass correct entries list
                Navigator.push(context, MaterialPageRoute(builder: (context) => SavedEntriesScreen(entries: widget.entries)));
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
                style: TextStyle(color: textPurple, fontSize: 22, fontWeight: FontWeight.bold, height: 1.3),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  minimumSize: const Size(200, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () async {
                  final result = await Navigator.push<DiaryEntry>(
                    context, 
                    MaterialPageRoute(builder: (context) => DiarySavedScreen(newEntry: newEntry, entries: entries)),
                  );
                  
                  if (result != null && context.mounted) {
                    Navigator.pop(context, result);
                  }
                },
                child: const Text('Save Diary', style: TextStyle(color: Colors.white, fontSize: 16)),
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
              icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.article_outlined, color: textPurple, size: 24),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SavedEntriesScreen(entries: entries)));
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

  const DiarySavedScreen({super.key, required this.newEntry, required this.entries});

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
              const Text('Diary Saved!', style: TextStyle(color: textPurple, fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text(
                '“You can’t go back and change the beginning, but you can start where you are and change the ending.”\n- C.S. Lewis',
                style: TextStyle(color: textPurple, fontSize: 20, fontWeight: FontWeight.w600, height: 1.3),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryPurple),
                onPressed: () {
                  Navigator.pop(context, newEntry);
                },
                child: const Text('Return to Home', style: TextStyle(color: Colors.white)),
              )
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
              icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.article_outlined, color: textPurple, size: 24),
              onPressed: () {
                final previewList = List<DiaryEntry>.from(entries)..add(newEntry);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SavedEntriesScreen(entries: previewList)));
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
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(color: dividerPurple, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entries[index].title, style: const TextStyle(color: textPurple, fontSize: 22, fontWeight: FontWeight.bold)),
                          Text(
                            entries[index].content.isNotEmpty 
                                ? entries[index].content 
                                : '${index + 1}st diary', 
                            style: const TextStyle(color: textPurple, fontSize: 16),
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
              const Text('[User]', style: TextStyle(color: textPurple, fontSize: 22, fontWeight: FontWeight.bold)),
              const Text('[Email]', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 24),
              _buildBox('Account setting', 'Change your account & profile settings.\nUpdate information.'),
              const SizedBox(height: 12),
              _buildBox('Help and support', 'Submit any questions you need answered.'),
              const SizedBox(height: 12),
              _buildBox('App setting', 'Themes, languages, privacy settings, notifications'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildSmallBox('Recently deleted', 'All deleted diaries are temporarily kept here')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildSmallBox('Log out', 'Sign out of your account')),
                ],
              )
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
              icon: const Icon(Icons.arrow_back_ios, color: textPurple, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              icon: const Icon(Icons.article_outlined, color: textPurple, size: 24),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SavedEntriesScreen(entries: entries)));
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
      decoration: BoxDecoration(color: dividerPurple, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: darkButton, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSmallBox(String title, String subtitle) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: dividerPurple, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: darkButton, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 9)),
        ],
      ),
    );
  }
}