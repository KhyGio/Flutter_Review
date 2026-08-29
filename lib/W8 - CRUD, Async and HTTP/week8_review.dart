Future<void> main() async {
  List<Course> course = await fetchCourses();
  for (var i in course) {
    print('Course ID: ${i.courseId}, Course Title: ${i.title}');
  }

  List<Score> score = await fetchScores('1');
  for (var i in score) {
    print('Course ID: ${i.courseId}, Score: ${i.score}');
  }
}

class Course {
  final int courseId;
  final String title;

  Course({required this.courseId, required this.title});
}

Future<List<Course>> fetchCourses() {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      Course(courseId: 1, title: 'Flutter Basics'),
      Course(courseId: 2, title: 'Dart Programming'),
      Course(courseId: 3, title: 'State Management'),
    ];
  });
}

class Score {
  final String courseId;
  final int score;

  Score({required this.courseId, required this.score});
}

Future<List<Score>> fetchScores(String courseId) {
  return Future.delayed(const Duration(seconds: 2), () {
    if (courseId == '1') {
      return [
        Score(courseId: '1', score: 85),
        Score(courseId: '1', score: 90),
        Score(courseId: '1', score: 78),
      ];
    }

    if (courseId == '2') {
      return [
        Score(courseId: '2', score: 95),
        Score(courseId: '2', score: 88),
        Score(courseId: '2', score: 92),
      ];
    }

    if (courseId == '3') {
      return [Score(courseId: '3', score: 70), Score(courseId: '3', score: 75)];
    }

    return [];
  });
}
