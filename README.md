# Description

Lately developers have created a lot of libs for JSON de-/serialization. I tested how long time takes mapping, list of frameworks which I used described below:
- [Freddy](https://github.com/bignerdranch/Freddy)
- [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)
- [Unbox](https://github.com/johnsundell/unbox)
- [Marshal](https://github.com/utahiosmac/Marshal)
- [Bender](https://github.com/ptiz/Bender) (the only one which does not touch your model via special initialisers or 'Mapable' protocols)

# Performance

JSON file which is used for measuring performance is [here](JSONParsingPerformance/SwiftJSONLibsPerformance/five_megs.json). It is 10 MB file with different types of values including string, int, double, nested dictionaries and arrays.
Scheme of generated test JSON file is located [here](JSONParsingPerformance/SwiftJSONLibsPerformance/json_scheme.json)

<img width="505" alt="screen shot 2017-01-03 at 23 53 00" src="https://cloud.githubusercontent.com/assets/8783235/21623617/499dd0e2-d214-11e6-956d-9d6e8288fd77.png">