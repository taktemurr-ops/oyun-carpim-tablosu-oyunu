import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_carpim_tablosu_oyunu/oyun_carpim_tablosu_oyunu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(carpimTablosuConfig.title.length, 33);
    expect(carpimTablosuConfig.tagline.length, 33);
    for (final s in carpimTablosuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(carpimTablosuConfig.gameId, carpimTablosuId);
    expect(carpimTablosuRules.gameId, carpimTablosuId);
    expect(carpimTablosuConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(carpimTablosuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: carpimTablosuId, optionalMechanics: carpimTablosuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(carpimTablosuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
