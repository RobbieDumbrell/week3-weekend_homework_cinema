require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

# CREATING CUSTOMERS.

robbie = Customer.new({
  'name' => 'Robbie',
  'funds' => '100'
  })

ellie = Customer.new({
  'name' => 'Ellie',
  'funds' => '50'
  })

jack = Customer.new({
  'name' => 'Jack',
  'funds' => '5'
  })

wendy = Customer.new({
  'name' => 'Wendy',
  'funds' => '40'
  })

guy = Customer.new({
  'name' => 'Guy',
  'funds' => '20'
  })

martin = Customer.new({
  'name' => 'Martin',
  'funds' => '65'
  })

lucy = Customer.new({
  'name' => 'Lucy',
  'funds' => '38'
  })

# SAVING CUSTOMERS TO DB.

# robbie.save()
# ellie.save()
# jack.save()
# wendy.save()
# guy.save()
# martin.save()
# lucy.save()

# CREATING FILMS.

incredibles2 = Film.new({
  'title' => 'The Incredibles 2',
  'price' => '10'
  })

deadpool2 = Film.new({
  'title' => 'Deadpool 2',
  'price' => '10'
  })

adrift = Film.new({
  'title' => 'Adrift',
  'price' => '5'
  })

solo = Film.new({
  'title' => 'Solo: A Star Wars Story',
  'price' => '15'
  })

# SAVING FILMS TO DB.

# incredibles2.save()
# deadpool2.save()
# adrift.save()
# solo.save()

# READING FILMS FROM DATABASE AND RETRIEVING.

incredibles2 = Film.find_by_id(1)
deadpool2 = Film.find_by_id(2)
adrift = Film.find_by_id(3)
solo = Film.find_by_id(4)

# ADDING SCREENINGS FOR EACH PRE-EXISTING FILM, SAVES TO DATABASE WITHIN METHOD.

# incredibles2.add_screening('15:00', '10')
# incredibles2.add_screening('18:00', '10')
# deadpool2.add_screening('19:00', '5')
# deadpool2.add_screening('22:00', '10')
# adrift.add_screening('16:30', '5')
# adrift.add_screening('20:00', '5')
# solo.add_screening('12:00', '10')
# solo.add_screening('20:30', '10')

# READING CUSTOMERS FROM DATABASE AND RETRIEVING.

robbie = Customer.find_by_id(1)
ellie = Customer.find_by_id(2)
jack = Customer.find_by_id(3)
wendy = Customer.find_by_id(4)
guy = Customer.find_by_id(5)
martin = Customer.find_by_id(6)
lucy = Customer.find_by_id(7)

# READING SCREENINGS FROM DATABASE AND RETRIEVING.

incredibles2_1 = Screening.find_by_id(1)
incredibles2_2 = Screening.find_by_id(2)
deadpool2_1 = Screening.find_by_id(3)
deadpool2_2 = Screening.find_by_id(4)
adrift_1 = Screening.find_by_id(5)
adrift_2 = Screening.find_by_id(6)
solo_1 = Screening.find_by_id(7)
solo_2 = Screening.find_by_id(8)

# CUSTOMERS BUYING TICKETS, SAVES TO DATABASE WITHIN METHOD.

# robbie.buy_ticket(incredibles2_1)
# ellie.buy_ticket(incredibles2_1)
# robbie.buy_ticket(solo_1)
# ellie.buy_ticket(solo_1)
# wendy.buy_ticket(solo_1)
# guy.buy_ticket(solo_1)
# jack.buy_ticket(incredibles2_2)
# martin.buy_ticket(deadpool2_1)
# lucy.buy_ticket(deadpool2_1)
# martin.buy_ticket(adrift_1)
# wendy.buy_ticket(deadpool2_1)
# robbie.buy_ticket(deadpool2_1)
# ellie.buy_ticket(deadpool2_1)
# robbie.buy_ticket(deadpool2_1)
# guy.buy_ticket(adrift_2)

# UPDATING TESTS

# incredibles2.title = 'Toy Story 4'
# incredibles2.update
#
# deadpool2_2.show_time = '00:00'
# deadpool2_2.update
#
# lucy.name = 'Melvin'
# lucy.update

# DELETING TESTS










# LISTING ALL BOOKED FILMS OF SPECIFIC CUSTOMERS.

# p robbie.booked_films()
# p ellie.booked_films()
# p jack.booked_films()
# p wendy.booked_films()
# p guy.booked_films()
# p martin.booked_films()
# p lucy.booked_films()

# LISTING ALL BOOKED CUSTOMERS OF SPECIFIC FILMS.

# p incredibles2.booked_customers()
# p deadpool2.booked_customers()
# p adrift.booked_customers()
# p solo.booked_customers()

# TESTING TICKET COUNTS OF SPECIFIC CUSTOMERS.

# p robbie.ticket_count()
# p ellie.ticket_count()
# p jack.ticket_count()
# p wendy.ticket_count()
# p guy.ticket_count()
# p martin.ticket_count()
# p lucy.ticket_count()

# TESTING TICKET COUNTS OF SPECIFIC FILMS.

# p incredibles2.ticket_count()
# p deadpool2.ticket_count()
# p adrift.ticket_count()
# p solo.ticket_count()

# TESTING FILM MOST POPULAR SCREENING.

# p incredibles2.most_popular_screening
# p deadpool2.most_popular_screening
# p adrift.most_popular_screening
# p solo.most_popular_screening
