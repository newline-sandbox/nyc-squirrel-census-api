BEGIN;

CREATE TYPE fur_color AS ENUM ('Gray', 'Cinnamon', 'Black', 'White');
CREATE TYPE am_pm AS ENUM ('AM', 'PM');
CREATE TYPE adult_juvenile AS ENUM ('Adult', 'Juvenile', '?');
CREATE TYPE loc_rel_to_ground AS ENUM ('Ground Plane', 'Above Ground'); 

CREATE TABLE cp_squirrels (
  x NUMERIC(16, 13), -- Longitude coordinate for squirrel sighting point.
  y NUMERIC(16, 13), -- Latitude coordinate for squirrel sighting point.
  id VARCHAR(15), -- Identification tag for each squirrel sightings. The tag is comprised of "Hectare ID" + "Shift" + "Date" + "Hectare Squirrel Number."
  hectare CHAR(3), -- ID tag, which is derived from the hectare grid used to divide and count the park area. One axis that runs predominantly north-to-south is numerical (01-42), and the axis that runs predominantly east-to-west is roman characters (A-I).
  shift am_pm, -- Value is either "AM" or "PM," to communicate whether or not the sighting session occurred in the morning or late afternoon.
  obs_date CHAR(8), -- Concatenation of the sighting session day and month.
  hectare_num SMALLINT, -- Number within the chronological sequence of squirrel sightings for a discrete sighting session.
  age adult_juvenile, -- Value is either "Adult" or "Juvenile."
  primary_fur_color fur_color, -- Value is either "Gray," "Cinnamon" or "Black."
  highlight_fur_color VARCHAR(30), -- Discrete value or string values comprised of "Gray," "Cinnamon" or "Black."
  primary_highlight_fur_color VARCHAR(30), -- A combination of the previous two columns; this column gives the total permutations of primary and highlight colors observed.
  color_notes VARCHAR(255), -- Sighters occasionally added commentary on the squirrel fur conditions. These notes are provided here.
  obs_location loc_rel_to_ground, -- Value is either "Ground Plane" or "Above Ground." Sighters were instructed to indicate the location of where the squirrel was when first sighted.
  above_grnd_sighter_measurement VARCHAR(5), -- For squirrel sightings on the ground plane, fields were populated with a value of “FALSE.”
  specific_location VARCHAR(255), -- Sighters occasionally added commentary on the squirrel location. These notes are provided here.
  running BOOLEAN, -- Squirrel was seen running.
  chasing BOOLEAN, -- Squirrel was seen chasing another squirrel.
  climbing BOOLEAN, -- Squirrel was seen climbing a tree or other environmental landmark.
  eating BOOLEAN, -- Squirrel was seen eating.
  foraging BOOLEAN, -- Squirrel was seen foraging for food.
  other_activities VARCHAR(255),
  kuks BOOLEAN, -- Squirrel was heard kukking, a chirpy vocal communication used for a variety of reasons.
  quaas BOOLEAN, -- Squirrel was heard quaaing, an elongated vocal communication which can indicate the presence of a ground predator such as a dog.
  moans BOOLEAN, -- Squirrel was heard moaning, a high-pitched vocal communication which can indicate the presence of an air predator such as a hawk.
  tail_flags BOOLEAN, -- Squirrel was seen flagging its tail. Flagging is a whipping motion used to exaggerate squirrel's size and confuse rivals or predators. Looks as if the squirrel is scribbling with tail into the air.
  tail_twitches BOOLEAN, -- Squirrel was seen twitching its tail. Looks like a wave running through the tail, like a breakdancer doing the arm wave. Often used to communicate interest, curiosity.
  approaches BOOLEAN, -- Squirrel was seen approaching human, seeking food.
  indifferent BOOLEAN, -- Squirrel was indifferent to human presence.
  runs_from BOOLEAN, -- Squirrel was seen running from humans, seeing them as a threat.
  other_interactions VARCHAR(255), -- Sighter notes on other types of interactions between squirrels and humans.
  lat_lng VARCHAR(50) -- Latitude and longitude.
);

\copy cp_squirrels from '/data/2018_Central_Park_Squirrels.csv' with CSV DELIMITER ',' QUOTE '"' null '';

commit;