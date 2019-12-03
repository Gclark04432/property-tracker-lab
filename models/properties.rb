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

  def save()
    db = PG.connect({ dbname: 'property_list', host: 'localhost' })
    sql = "
    INSERT INTO property_list_table (
      value,
      bedrooms,
      buy_or_let,
      year_built
    ) VALUES ($1, $2, $3, $4) RETURNING id;
    "
    values = [@value, @bedrooms, @buy_or_let, @year_built]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i()
    db.close()
  end

  def Property.all()
    db = PG.connect({ dbname: 'property_list', host: 'localhost' })
    sql = "
    SELECT * FROM property_list_table;"
    db.prepare("all", sql)
    houses = db.exec_prepared("all")
    db.close()
    return houses.map {|houses_hash| Property.new(houses_hash)}
  end

  def Property.delete_all()
    db = PG.connect({ dbname: 'property_list', host: 'localhost' })
    sql = "DELETE FROM property_list_table;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close
  end

  def delete()
    db = PG.connect({ dbname: 'property_list', host: 'localhost' })
    sql = "DELETE FROM property_list_table WHERE id = $1;"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close
  end

  


  end
