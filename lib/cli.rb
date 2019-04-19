class CommandLineInterface #< ActiveRecord::Base
  def greet
    puts `clear`
    puts
    puts "You, the special user, are here to interact with my database of restaurants, people reviewers, and restaurant reviews. Read below to begin your journey."
    puts
    puts "Our database contains restaurants that have the following types of foods: "
    puts  Restaurant.display
    puts
    puts "At your discretion, type exit and press Enter(or Return) to exit out of the database."
    puts
    puts
    puts 'What do you want to do? [F]ind [D]elete [C]reate [U]pdate'




  end
end
