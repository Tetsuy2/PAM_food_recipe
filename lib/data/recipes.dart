class Recipe {
  final String title;
  final String subtitle;
  final String image;
  final String time;
  final double rating;
  const Recipe(this.title, this.subtitle, this.image, this.time, this.rating);
}

const categories = [
  {'label': 'All', 'img': 'assets/new_food3.png'},
  {'label': 'Indian', 'img': 'assets/new_food3.png'},
  {'label': 'Italian', 'img': 'assets/new_food3.png'},
  {'label': 'Asian', 'img': 'assets/new_food3.png'},
  {'label': 'Chinese', 'img': 'assets/new_food3.png'},
];

const popular = [
  Recipe('Classic Greek Salad', 'Time', 'assets/new_food1.png', '15 Mins', 4.5),
  Recipe(
      'Crunchy Nut Coleslaw', 'Time', 'assets/new_food1.png', '10 Mins', 3.5),
];
