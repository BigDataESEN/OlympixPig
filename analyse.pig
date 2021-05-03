olympic = load 'app/olympix_data.csv' using PigStorage(',');
countries_medals = foreach olympic generate $2 as country, $9 as total_medals;
grouped_countries = group countries_medals by country;
total_medals = foreach grouped_countries generate group as pays, SUM(countries_medals.total_medals) as total;
sorted_countries = order total_medals by total desc;
top_countries = limit sorted_countries 5;
store top_countries into 'output';
