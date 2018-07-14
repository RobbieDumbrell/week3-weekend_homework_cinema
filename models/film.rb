require_relative('../db/sql_runner')
require_relative('customer.rb')
require_relative('ticket.rb')

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
          INNER JOIN screenings
          	ON tickets.screening_id = screenings.id
          WHERE screenings.film_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values) # array of hashes.
    booked_customers = result.map { |customer| Customer.new(customer) }
    return booked_customers
  end

  # How many tickets have been sold for a film?
  def ticket_count()
    return self.booked_customers.count
  end

  # What is the most popular screening time of a film?
  def most_popular_screening()
    sql = "SELECT tickets.* FROM tickets
          INNER JOIN screenings
	         ON screenings.id = tickets.screening_id
          WHERE film_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values) # array of hashes.
    tickets = result.map { |ticket_hash| Ticket.new(ticket_hash) } # array of ticket objects.
    screening_ids = tickets.map { |ticket| ticket.screening_id } # array of screening_ids
    most_common_screening_id = screening_ids.max_by {|x| screening_ids.count(x) } # returns the most common screening_id.
    screening = Screening.find_by_id(most_common_screening_id) # creates screening object to return most popular screening as object.
    return screening.show_time
  end

  # Adds a screening of a particular film, passed a show_time and total_seats.
  def add_screening(show_time, total_seats)
    sql = "INSERT INTO screenings (film_id, show_time, total_seats, available_seats) VALUES ($1, $2, $3, $3) RETURNING id;"
    values = [@id, show_time, total_seats]
    result = SqlRunner.run(sql, values)
  end

end
