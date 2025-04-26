import 'package:demo/models/event.dart';
import 'package:demo/models/roadmap.dart';

class DummyData {
  static final List<Map<String, dynamic>> jobs = [
    {
      'id': '1',
      'title': 'Customer Support Executive',
      'company': 'Real',
      'location': 'Maharashtra (Remote)',
      'salary': '₹7,50,000 - ₹8,50,000 per annum',
      'description':
          'Respond promptly to customer inquiries via email, addressing queries related to real estate transactions and property matters.',
      'requirements': [
        'Excellent communication skills',
        'Experience in customer support',
        'Knowledge of real estate transactions is a plus'
      ],
      'imageUrl': 'assets/images/customer_support.png',
    },
    {
      'id': '2',
      'title': 'Applications Development Sr Programmer Analyst',
      'company': 'Citi',
      'location': 'Chennai, Tamil Nadu',
      'salary': 'Not disclosed',
      'description':
          'Participate in the establishment and implementation of new or revised application systems and programs in coordination with the Technology team.',
      'requirements': [
        'Experience in application development',
        'Strong analytical skills',
        'Knowledge of programming languages and system analysis'
      ],
      'imageUrl': 'assets/images/developer.png',
    },
    {
      'id': '3',
      'title': 'Project Manager - CLM',
      'company': 'Execo Group Inc.',
      'location': 'Pune, Maharashtra',
      'salary': 'Not disclosed',
      'description':
          'Oversee end-to-end implementation of Contract Lifecycle Management (CLM) solutions, ensuring project delivery within scope, budget, and timeline.',
      'requirements': [
        '5+ years of experience in CLM implementations',
        'Strong relationship-building skills',
        'Solid technical background with understanding of software development'
      ],
      'imageUrl': 'assets/images/project_manager.png',
    },
    {
      'id': '4',
      'title': 'Lecturer (Physics)',
      'company': 'YS Group',
      'location': 'Barnala, Punjab',
      'salary': 'Not disclosed',
      'description':
          'Deliver engaging and comprehensive lectures in Physics to senior secondary students, ensuring a deep understanding of the subject.',
      'requirements': [
        "Master's degree in Physics or related field",
        'Prior teaching experience',
        'Excellent communication and presentation skills'
      ],
      'imageUrl': 'assets/images/lecturer.png',
    },
    {
      'id': '5',
      'title': 'Human Resources Assistant',
      'company': 'CSW Job Immigration',
      'location': 'Remote',
      'salary': 'Not disclosed',
      'description':
          'Complete administrative duties for the human resources department, keeping up to date with the latest HR trends and best practices.',
      'requirements': [
        "Bachelor's degree in Human Resources or related field",
        'Strong organizational skills',
        'Proficiency in HR software and tools'
      ],
      'imageUrl': 'assets/images/hr_assistant.png',
    },
  ];

  static final List<Event> events = [
    Event(
      id: '1',
      name: 'Flutter Workshop',
      title: 'Flutter Workshop 2024',
      description:
          'Join us for an intensive workshop on Flutter development. Learn from experts and build your first app!',
      date: DateTime.now().add(const Duration(days: 7)),
      time: '10:00 AM - 4:00 PM',
      location: 'Tech Hub, Building A',
      organizer: 'Flutter Dev Community',
      attendees: ['John Doe', 'Jane Smith', 'Mike Johnson'],
      imageUrl: 'assets/resources/flutter.jpg',
      category: 'Mobile',
    ),
    Event(
      id: '2',
      name: 'AI/ML Conference',
      title: 'AI/ML Conference 2024',
      description:
          'Explore the latest trends in Artificial Intelligence and Machine Learning with industry leaders.',
      date: DateTime.now().add(const Duration(days: 14)),
      time: '9:00 AM - 6:00 PM',
      location: 'Innovation Center',
      organizer: 'AI Research Group',
      attendees: ['Alice Brown', 'Bob Wilson', 'Carol White'],
      imageUrl: 'assets/resources/ml.jpg',
      category: 'AI/ML',
    ),
    Event(
      id: '3',
      name: 'Web Development Summit',
      title: 'Modern Web Development',
      description:
          'Learn about the latest web technologies and best practices from industry experts.',
      date: DateTime.now().add(const Duration(days: 21)),
      time: '9:00 AM - 5:00 PM',
      location: 'Tech Conference Center',
      organizer: 'Web Dev Community',
      attendees: ['Team Alpha', 'Team Beta', 'Team Gamma'],
      imageUrl: 'assets/resources/web.jpg',
      category: 'Web',
    ),
    Event(
      id: '4',
      name: 'Cloud Computing Workshop',
      title: 'DevOps & Cloud Computing',
      description:
          'Master cloud platforms and DevOps practices with hands-on workshops.',
      date: DateTime.now().add(const Duration(days: 28)),
      time: '10:00 AM - 5:00 PM',
      location: 'Tech Center',
      organizer: 'Cloud Computing Group',
      attendees: ['David Clark', 'Emma Watson', 'Frank Miller'],
      imageUrl: 'assets/resources/cloud.jpg',
      category: 'DevOps',
    ),
    Event(
      id: '5',
      name: 'UI/UX Design Workshop',
      title: 'Modern UI/UX Design Principles',
      description:
          'Learn modern design principles and tools for creating amazing user experiences.',
      date: DateTime.now().add(const Duration(days: 35)),
      time: '9:00 AM - 4:00 PM',
      location: 'Design Studio',
      organizer: 'Design Community',
      attendees: ['Grace Lee', 'Henry Ford', 'Iris Chen'],
      imageUrl: 'assets/resources/ui-ux-design.jpg',
      category: 'Design',
    ),
    Event(
      id: '6',
      name: 'Data Engineering Summit',
      title: 'Big Data & Analytics',
      description:
          'Deep dive into data engineering, analytics, and modern data architectures.',
      date: DateTime.now().add(const Duration(days: 42)),
      time: '9:00 AM - 6:00 PM',
      location: 'Data Center',
      organizer: 'Data Engineering Group',
      attendees: ['Jack Smith', 'Kelly Brown', 'Liam Wilson'],
      imageUrl: 'assets/resources/Data-Engineering.jpg',
      category: 'Data',
    ),
  ];

  static final List<Map<String, dynamic>> resources = [
    {
      'id': '1',
      'title': 'Flutter Development Guide',
      'description': 'Comprehensive guide to Flutter development',
      'url': 'assets/images/placeholder.png',
      'type': 'Guide',
    },
    {
      'id': '2',
      'title': 'Web Development Tutorial',
      'description': 'Step-by-step web development tutorial',
      'url': 'assets/images/placeholder.png',
      'type': 'Tutorial',
    },
    {
      'id': '3',
      'title': 'Machine Learning Basics',
      'description': 'Introduction to machine learning concepts',
      'url': 'assets/images/placeholder.png',
      'type': 'Course',
    },
    {
      'id': '4',
      'title': 'Cloud Computing Overview',
      'description': 'Overview of cloud computing platforms',
      'url': 'assets/images/placeholder.png',
      'type': 'Overview',
    },
    {
      'id': '5',
      'title': 'UI/UX Design Principles',
      'description': 'Essential principles of UI/UX design',
      'url': 'assets/images/placeholder.png',
      'type': 'Guide',
    },
  ];

  static final List<Roadmap> roadmaps = [
    Roadmap(
      id: '1',
      title: 'Flutter Development',
      description: 'Learn to build cross-platform mobile apps',
      imageUrl: 'assets/images/placeholder.png',
      category: 'Mobile',
      estimatedHours: 40,
      difficulty: 'Intermediate',
      steps: [
        // ... existing steps ...
      ],
    ),
    Roadmap(
      id: '2',
      title: 'Web Development',
      description: 'Master modern web development',
      imageUrl: 'assets/images/placeholder.png',
      category: 'Web',
      estimatedHours: 60,
      difficulty: 'Beginner',
      steps: [
        // ... existing steps ...
      ],
    ),
    Roadmap(
      id: '3',
      title: 'Machine Learning',
      description: 'Master the fundamentals of ML and AI',
      imageUrl: 'assets/images/placeholder.png',
      category: 'AI/ML',
      estimatedHours: 80,
      difficulty: 'Advanced',
      steps: [
        // ... existing steps ...
      ],
    ),
    Roadmap(
      id: '4',
      title: 'Cloud Computing',
      description: 'Learn cloud platforms and DevOps practices',
      imageUrl: 'assets/images/placeholder.png',
      category: 'DevOps',
      estimatedHours: 70,
      difficulty: 'Intermediate',
      steps: [
        // ... existing steps ...
      ],
    ),
    Roadmap(
      id: '5',
      title: 'Blockchain Development',
      description: 'Build decentralized applications and smart contracts',
      imageUrl: 'assets/images/placeholder.png',
      category: 'Blockchain',
      estimatedHours: 90,
      difficulty: 'Advanced',
      steps: [
        // ... existing steps ...
      ],
    ),
    // ... rest of the roadmaps with updated imageUrl paths ...
  ];
}
