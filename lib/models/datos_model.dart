class All {
    All({
        this.confirmed,
        this.recovered,
        this.deaths,
        this.country,
        this.population,
        this.sqKmArea,
        this.lifeExpectancy,
        this.elevationInMeters,
        this.continent,
        this.abbreviation,
        this.location,
        this.iso,
        this.capitalCity,
        this.lat,
        this.long,
        this.updated,
    });
    int confirmed;
    int recovered;
    int deaths;
    String country;
    int population;
    dynamic sqKmArea;
    dynamic lifeExpectancy;
    dynamic elevationInMeters;
    String continent;
    String abbreviation;
    String location;
    int iso;
    String capitalCity;
    String lat;
    String long;
    String updated;

    factory All.fromJson(Map<String, dynamic> json ) => All(
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        country: json["country"],
        population: json["population"],
        sqKmArea: json["sq_km_area"],
        lifeExpectancy: json["life_expectancy"],
        elevationInMeters: json["elevation_in_meters"],
        continent: json["continent"],
        abbreviation: json["abbreviation"],
        location: json["location"],
        iso: json["iso"],
        capitalCity: json["capital_city"],
        lat: json["lat"],
        long: json["long"],
        updated: json["updated"],
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "country": country,
        "population": population,
        "sq_km_area": sqKmArea,
        "life_expectancy": lifeExpectancy,
        "elevation_in_meters": elevationInMeters,
        "continent": continent,
        "abbreviation": abbreviation,
        "location": location,
        "iso": iso,
        "capital_city": capitalCity,
        "lat": lat,
        "long": long,
        "updated": updated,
    };
}

