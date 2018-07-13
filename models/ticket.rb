require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')
require_relative('screening')

class Ticket

  attr_accessor :customer_id, :screening_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  # Create
  def save()
    customer = Customer.find_by_id(@customer_id)
    screening = Screening.find_by_id(@screening_id)
    film = Film.find_by_id(screening.film_id)
    if customer.funds >= film.price # only saves ticket if the customer has the funds.
      sql = "INSERT INTO tickets (customer_id, screening_id) VALUES ($1, $2) RETURNING id;"
      values = [@customer_id, @screening_id]
      result = SqlRunner.run(sql, values)
      @id = result[0]['id'].to_i
      customer.funds -= film.price
      customer.update() # updates customer funds by film price.
    else
      return "Customer does not have the funds, ticket not generated."
    end
  end

  # Read
  def self.find_by_id(id)
    sql = "SELECT * FROM tickets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hashes
    ticket_hash = result.first
    return Ticket.new(ticket_hash)
  end

  # Update
  def update()
    sql = "UPDATE tickets
          SET (customer_id, screening_id) = ($1, $2)
          WHERE id = $3"
    values = [@customer_id, @film_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM tickets
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
