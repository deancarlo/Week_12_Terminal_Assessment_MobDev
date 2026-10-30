String evaluateAccessGrades(List<dynamic> rawScores) {
  int passedCount = 0;
  int failedCount = 0;

  for (int i = 0; i < rawScores.length; i++) {
    try {
      int score = int.parse(rawScores[i].toString());

      if (score >= 75) {
        print('Score ${score}: Status -> PASSED');
        passedCount++;
      } else {
        print('Score ${score}: Status -> FAILED');
        failedCount++;
      }
    } catch (e) {
      print('Error at index $i: Invalid input "${rawScores[i]}" could not be parsed.');
    }
  }

  return 'Evaluation Complete. Passed: $passedCount, Failed: $failedCount';
}

void main() {
  print('Running Week 8 Logic Problem Set\n');

  List<dynamic> mixedInputScores = [85, 60, 'invalid_score', 92, 45, '78'];

  String resultSummary = evaluateAccessGrades(mixedInputScores);
  
  print('\nSummary Result: $resultSummary');
}