require ('pg')

class Property

  attr_reader :id, :value, :bedrooms, :buy_or_let, :year_built

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @value = options['value'].to_i()
    @bedrooms = options['bedrooms'].to_i()
    @buy_or_let = options['buy_or_let']
    @year_built = options['year_built'].to_i()
  end

end
