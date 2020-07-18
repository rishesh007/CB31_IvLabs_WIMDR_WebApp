class OverviewData {
  num type;
  num entry;
  num exit;
  num total;
  num incExit;
  num incEntry;
  num incTotal;

  OverviewData({
    this.type,
    this.entry,
    this.exit,
    this.total,
    this.incEntry,
    this.incExit,
    this.incTotal,
  });
}

List<OverviewData> overviewData = [];

num currentEnabledData = 0;

List<String> viewType = [
  'Today'.toUpperCase(),
  'Last Week'.toUpperCase(),
  'Last Month'.toUpperCase()
];
