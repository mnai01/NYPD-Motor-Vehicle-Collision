# NYPD-Motor-Vehicle-Collision

**Require Modules**

```
cpanm Term::Menu

cpanm Term::ANSIColor

cpanm Text::CSV
```

Filters data from nypd-motor-vehicle-collisions_RB.csv to present present and show more readable results

| Choice | Action                                      |
| ------ | ------------------------------------------- |
| 1      | Collisions by Year                          |
| 2      | Collisions by Borough                       |
| 3      | Collisions by factor (vehicle #1)           |
| 4      | Collisions by factor (vehicle #2)           |
| 5      | Collisions by zip code                      |
| 6      | Collisions by season                        |
| 7      | Lowest year for collisions                  |
| 8      | Lowest day for collisions                   |
| 9      | Lowest contributing factor for vehicle #1   |
| 10     | Highest contributing factor for vehicle #1  |
| 11     | Collisions by year (user enters the year)   |
| 12     | Collisions by borough (user enters the zip) |
| 13     | Collisions where a cyclist was injured      |
