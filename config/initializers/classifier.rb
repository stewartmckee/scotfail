m = SnapshotMadeleine.new("bayes_data_yaml", YAML) {
  Classifier::Bayes.new 'Positive', 'Neutral', 'Negative'
}
MADELEINE = m
BAYESIAN = m.system
