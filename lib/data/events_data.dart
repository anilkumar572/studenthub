import '../models/event.dart';

class EventsData {
  static final List<Event> april2025Events = [
    Event(
      id: 'f8-2025',
      name: 'F8 Developer Conference',
      title: 'Meta F8 2025',
      description:
          'Meta\'s annual developer conference featuring the latest in AR/VR, AI, and platform updates. Join technical sessions, workshops, and networking opportunities with Meta engineers and developers worldwide.',
      date: DateTime(2025, 4, 10),
      time: '9:00 AM PST',
      location: 'San Jose Convention Center, CA',
      organizer: 'Meta',
      attendees: [],
      category: 'Developer Conference',
      imageUrl: 'assets/images/events/f8.png',
    ),
    Event(
      id: 'aws-summit-sf-2025',
      name: 'AWS Summit San Francisco',
      title: 'AWS Summit San Francisco 2025',
      description:
          'Learn about AWS\'s latest innovations in cloud computing, AI/ML, serverless, and more. Features hands-on labs, technical sessions, and certification opportunities.',
      date: DateTime(2025, 4, 15),
      time: '8:30 AM PST',
      location: 'Moscone Center, San Francisco',
      organizer: 'Amazon Web Services',
      attendees: [],
      category: 'Cloud Computing',
      imageUrl: 'assets/images/events/aws-summit.png',
    ),
    Event(
      id: 'pycon-2025',
      name: 'PyCon US 2025',
      title: 'PyCon US 2025',
      description:
          'The largest annual gathering for the Python community. Join tutorials, talks, sprints, and connect with Python developers from around the world.',
      date: DateTime(2025, 4, 18),
      time: '9:00 AM EST',
      location: 'Pittsburgh Convention Center, PA',
      organizer: 'Python Software Foundation',
      attendees: [],
      category: 'Programming',
      imageUrl: 'assets/images/events/pycon.png',
    ),
    Event(
      id: 'react-summit-2025',
      name: 'React Summit 2025',
      title: 'React Summit North America 2025',
      description:
          'The biggest React conference worldwide. Learn about React, Next.js, React Native, and the future of web development. Features workshops, talks, and networking.',
      date: DateTime(2025, 4, 22),
      time: '10:00 AM EST',
      location: 'New York Hilton Midtown',
      organizer: 'React Community',
      attendees: [],
      category: 'Web Development',
      imageUrl: 'assets/images/events/react-summit.png',
    ),
    Event(
      id: 'ai-dev-day-2025',
      name: 'AI Developer Day',
      title: 'Google AI Developer Day 2025',
      description:
          'Explore the latest in AI development with Google. Learn about machine learning, TensorFlow, and applied AI. Includes technical workshops and coding sessions.',
      date: DateTime(2025, 4, 25),
      time: '9:00 AM PST',
      location: 'Google Campus, Mountain View',
      organizer: 'Google',
      attendees: [],
      category: 'Artificial Intelligence',
      imageUrl: 'assets/images/events/google-ai.png',
    ),
  ];
}
