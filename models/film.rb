require_relative('../db/sql_runner')
require_relative('customer.rb')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  # Create
  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read
  def self.find_by_id(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hashes
    film_hash = result.first
    return Film.new(film_hash)
  end

  # Update
  def update()
    sql = "UPDATE films
          SET (title, price) = ($1, $2)
          WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM films
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # Lists all customers a film has booked to see.
  def booked_customers()
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets
	         ON customers.id = tickets.customer_id
          WHERE tickets.film_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values) # array of hashes.
    booked_customers = result.map { |customer| Customer.new(customer) }
    return booked_customers
  end

  # How many tickets have been sold for a film?
  def ticket_count()
    return self.booked_customers.count
  end

end
