require ('pry')
require_relative ('models/properties')

house1 = Property.new({
  'value' => 100_000,
  'bedrooms' => 1,
  'buy_or_let' => "buy",
  'year_built' => 1990
  })

house2 = Property.new({
  'value' => 1000,
  'bedrooms' => 2,
  'buy_or_let' => "let",
  'year_built' => 1995
  })

  Property.delete_all()

  house1.save()
  house2.save()

binding.pry
nil
