double valueFromPercentageInRange(
    {required final double min, max, percentage}) {
  return percentage * (max - min) + min;
}

double percentageFromValueInRange({required final double min, max, value}) {
  return (value - min) / (max - min);
}
const double playerMinHeight = 70;
const double playerMaxHeight = 370;
const miniplayerPercentageDeclaration = 0.2;