require_relative('../db/sql_runner')
require_relative('film.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  # Create
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read
  def self.find_by_id(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hashes
    customer_hash = result.first
    return Customer.new(customer_hash)
  end

  # Update
  def update()
    sql = "UPDATE customers
          SET (name, funds) = ($1, $2)
          WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM customers
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # Lists all films a customer has booked to see.
  def booked_films()
    sql = "SELECT films.* FROM films
          INNER JOIN screenings
	         ON films.id = screenings.film_id
          INNER JOIN tickets
            ON screenings.id = tickets.screening_id
          WHERE tickets.customer_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values) # array of hashes.
    booked_films = result.map { |film| Film.new(film) }
    return booked_films
  end

  # How many tickets have been bought by a customer?
  def ticket_count()
    return self.booked_films.count
  end

end
