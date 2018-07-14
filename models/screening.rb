require_relative('../db/sql_runner')

class Screening

  attr_accessor :film_id, :show_time, :total_seats, :available_seats
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
    @total_seats = options['total_seats'].to_i

    if options['available_seats'] != nil
      @available_seats = options['available_seats'].to_i
    else
      @available_seats = @total_seats
    end
  end

  # Create
  def save()
    sql = "INSERT INTO screenings (film_id, show_time, total_seats, available_seats) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@film_id, @show_time, @total_seats, @available_seats]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # Read
  def self.find_by_id(id)
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values) # array of hashes
    screening_hash = result.first
    return Screening.new(screening_hash)
  end

  # Update
  def update()
    sql = "UPDATE screenings
          SET (film_id, show_time, total_seats, available_seats) = ($1, $2, $3, $4)
          WHERE id = $5"
    values = [@film_id, @show_time, @total_seats, @available_seats, @id]
    SqlRunner.run(sql, values)
  end

  # Delete
  def delete()
    sql = "DELETE FROM screenings
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
