require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')


customer1 = Customer.new({
  'name' => 'Robbie',
  'funds' => '100'
  })

customer2 = Customer.new({
  'name' => 'Ellie',
  'funds' => '50'
  })

customer3 = Customer.new({
  'name' => 'Jack',
  'funds' => '5'
  })

# customer1.save()
# customer2.save()
# customer3.save()


film1 = Film.new({
  'title' => 'James Bond',
  'price' => '10'
  })

film2 = Film.new({
  'title' => 'Star Wars',
  'price' => '15'
  })

# film1.save()
# film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id
  })

ticket5 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })






# p customer1
# p film1

# binding.pry
#
# ticket1.save()
# ticket2.save()
# ticket3.save()
# ticket4.save() # shouldn't work
# ticket5.save()

# robbie = Customer.find_by_id(1)
# ellie = Customer.find_by_id(2)
james_bond = Film.find_by_id(1)
star_wars = Film.find_by_id(2)
# ticket1 = Ticket.find_by_id(1)

# customer1.name = 'Mark'
# customer1.funds = '30'
#
# customer1.update

# a_film.title = 'Star Wars'
# a_film.price = '15'
#
# a_film.update

# ticket.customer_id = customer2.id
#
# ticket.update()

# customer2.delete()
# film1.delete()
# ticket1.delete()

# p robbie.booked_films()
# p ellie.booked_films()

# p james_bond.booked_customers()
# p star_wars.booked_customers()

# p robbie.ticket_count()

p james_bond.ticket_count()
p star_wars.ticket_count()
