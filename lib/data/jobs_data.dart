import 'package:demo/models/job.dart';

final List<Job> jobsData = [
  Job(
    id: 'google-swe-2025',
    title: 'Software Engineer, New Grad 2025',
    company: 'Google',
    location: 'Mountain View, CA',
    type: 'Full-time',
    description:
        "Join Google as a Software Engineer and work on projects that help billions of users. You'll be part of a team that's changing the world of technology.",
    salary: '\$130,000 - \$175,000/year',
    category: 'Software Engineering',
    requirements: const [
      "Bachelor's degree in Computer Science or related field",
      'Strong programming skills in one or more: Java, Python, C++, Go',
      'Experience with data structures and algorithms',
      'Strong problem-solving skills',
    ],
    applicationUrl: 'https://careers.google.com/jobs/results/123456/',
    postedDate: DateTime(2025, 4, 1),
    imageUrl: 'assets/images/companies/google.png',
  ),
  Job(
    id: 'meta-ml-2025',
    title: 'Machine Learning Engineer',
    company: 'Meta',
    location: 'Menlo Park, CA',
    type: 'Full-time',
    description:
        'Work on cutting-edge AI/ML projects at Meta, developing solutions that impact billions of users across our family of apps.',
    salary: '\$180,000 - \$250,000/year',
    category: 'Machine Learning',
    requirements: const [
      'MS/PhD in Computer Science, Machine Learning, or related field',
      'Experience with deep learning frameworks (PyTorch, TensorFlow)',
      'Strong programming skills in Python',
      'Publication record in ML conferences is a plus',
    ],
    applicationUrl: 'https://careers.meta.com/jobs/ml-engineer/',
    postedDate: DateTime(2025, 4, 5),
    imageUrl: 'assets/images/companies/meta.png',
  ),
  Job(
    id: 'apple-ios-2025',
    title: 'iOS Developer',
    company: 'Apple',
    location: 'Cupertino, CA',
    type: 'Full-time',
    description:
        'Join the team that creates amazing experiences for millions of iOS users worldwide. Work on next-generation features for iPhone and iPad.',
    salary: '\$160,000 - \$220,000/year',
    category: 'Mobile Development',
    requirements: const [
      'Bachelors degree in Computer Science or equivalent',
      'Strong experience with Swift and iOS development',
      'Knowledge of iOS design principles and guidelines',
      'Experience with Core Data and networking',
    ],
    applicationUrl: 'https://jobs.apple.com/ios-developer/',
    postedDate: DateTime(2025, 4, 10),
    imageUrl: 'assets/images/companies/apple.png',
  ),
  Job(
    id: 'aws-architect-2025',
    title: 'Cloud Solutions Architect',
    company: 'Amazon Web Services',
    location: 'Seattle, WA',
    type: 'Full-time',
    description:
        'Design and implement innovative cloud solutions for AWS customers. Help organizations transform their infrastructure and applications.',
    salary: '\$150,000 - \$210,000/year',
    category: 'Cloud Computing',
    requirements: const [
      'Bachelors degree in Computer Science or related field',
      'AWS Professional certifications',
      'Experience with cloud architecture and design',
      'Strong communication and customer engagement skills',
    ],
    applicationUrl: 'https://aws.amazon.com/careers/solutions-architect/',
    postedDate: DateTime(2025, 4, 15),
    imageUrl: 'assets/images/companies/aws.png',
  ),
  Job(
    id: 'microsoft-fullstack-2025',
    title: 'Full Stack Developer',
    company: 'Microsoft',
    location: 'Redmond, WA',
    type: 'Full-time',
    description:
        'Build modern web applications using the latest Microsoft technologies. Work on products that millions of developers use every day.',
    salary: '\$140,000 - \$200,000/year',
    category: 'Full Stack Development',
    requirements: const [
      'Bachelors degree in Computer Science or equivalent',
      'Experience with .NET Core and C#',
      'Strong frontend skills (React/Angular)',
      'Experience with Azure services',
    ],
    applicationUrl: 'https://careers.microsoft.com/fullstack-developer/',
    postedDate: DateTime(2025, 4, 20),
    imageUrl: 'assets/images/companies/microsoft.png',
  ),
];
