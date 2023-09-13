enum DashboardMenu {
  quran,
  article,
  schedule,
  doa,
  bookmarks;

  String get icon {
    var image = 'assets/images/';

    switch (this) {
      case DashboardMenu.article:
        image += 'nb2';
        break;
      case DashboardMenu.schedule:
        image += 'nb3';
        break;
      case DashboardMenu.doa:
        image += 'nb5';
        break;
      case DashboardMenu.bookmarks:
        image += 'nb6';
        break;
      default:
        image += 'nb1';
        break;
    }
    return '$image.png';
  }
}