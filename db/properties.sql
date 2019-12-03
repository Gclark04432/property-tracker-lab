DROP TABLE IF EXISTS property_list;
CREATE TABLE property_list(
  id SERIAL PRIMARY KEY,
  value INT,
  bedrooms INT,
  buy_or_let VARCHAR(3),
  year_built INT
);
