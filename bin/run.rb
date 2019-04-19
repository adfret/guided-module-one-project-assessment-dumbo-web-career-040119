require_relative '../config/environment'
# require_relative "user"
# require_relative "review"
# require_relative "restaurant"

#
cli = CommandLineInterface.new
cli.greet
userInput = gets.strip.upcase

  if userInput == "F"
    puts "What do you want to find? [U]ser [R]estaurant  Re[V]iew"
    findInput = gets.chomp.upcase
    if findInput == "U"
      puts "What user do you want?"
      userName = gets.strip.chomp
      user = User.find_by(name: userName)
      # p "#{user.name} has reviews on: #{user.reviews}

        if user !=nil
          p "#{user.name} is a user on this website!"
        else
          p "#{userName} is not a user on this website!"
        end



    elsif findInput == "R"
      puts "Press [R] and then keyboard Enter(or Return) if you want restaurant food_type. Type and enter [C] if you want to know if food_type is rare compared to that of the other restaurants."
      answer = gets.strip.chomp
        if answer == "R"
          puts "Enter restaurant name"
            restName = gets.strip.chomp
            restaurant = Restaurant.find_by(name: restName)
            p "#{restaurant.name} has #{restaurant.food_type} food."
        elsif answer == "C"
            puts "Enter restaurant name"
            nameRest = gets.strip.chomp
              restaurant = Restaurant.find_by(name: nameRest)
              if restaurant !=nil
                restaurant.percentile
              else
                p "The restaurant is not yet in this database and has no food type percentile."
              end
          end


        # binding.pry
    elsif findInput == "V"
      puts "Hi there. These are some examples of restaurants that have reviews in our database:"
      puts "#{Review.display}"
      puts "What restaurant for which do you want a review?"
      restN = gets.strip.chomp
      restaurant = Restaurant.find_by(name: restN)
      review = Review.find_by(restaurant: restaurant)
      binding.pry
        if review !=nil
            p "#{restaurant.name} has review number #{review.id} by #{review.user.name}"
          else
            p "There is no review for this restaurant yet."
          end
    end


#issue 3 = how do I access review for restaurant in rake console?

  elsif userInput == "D"
    puts "What do you want to delete? [U]ser [R]estaurant Re[V]iew"
    delete = gets.strip.upcase
    if delete == "U"
      puts "What user do you want to delete?"
      deleteName = gets.strip.chomp
      user = User.find_by(name: deleteName)
      user.delete
    elsif delete == "R"
      puts "What restaurant do you want to delete?"
      deleteRestaurant = gets.strip.chomp
      restaurant = Restaurant.find_by(name: deleteRestaurant)
      restaurant.reviews.destroy_all
      restaurant.delete
    elsif delete == "V"
      puts "What restuarant's review do you want to delete?"
      restaurantName = gets.strip.chomp
      review = Review.find_by(restaurant: restaurantName)
      review.delete
    end


  elsif userInput == "C"
    puts "What do you want to create? [U]ser [R]estaurant Re[V]iew"
    createType = gets.chomp.strip
    if createType == "U"
      puts "What user do you want to create?"
      answer = gets.strip
      User.create(name: answer)
    elsif createType == "R"
      puts "What restaurant do you want to create?"
      answer = gets.chomp.strip
      Restaurant.create(name: answer, food_type: "tasty")
    elsif createType == "V"
      puts "What restaurant review do you want to create?"
      answer = gets.chomp.strip
      Review.create(name: answer)
    end


  elsif userInput == "U"
    puts "What do you want to update? [U]ser [R]estaurant Re[V]iew"
    update = gets.strip.upcase
    if update == "U"
      puts "What user do you want to update?"
      answer = gets.strip.chomp
      user = User.find_by(name: answer)
      puts "What is the new name for updating?"
      answer2 = gets.strip.chomp
      user.update_user_name(answer2)
      # user.name = answer2
      # user.save

#1
    elsif update == "R"
      puts "What restuarant do you want to update?"
      answer = gets.strip.chomp
      # restaurant = Restaurant.find_by(name: answer)
      aRestaurant = Restaurant.find_by(name: answer)
      puts "What new restaurant name do you want for updating?"
      answer2 = gets.strip.chomp
      aRestaurant.update(name: answer2)

#2
    elsif update == "V"
      puts "What to a restaurant review do you want to update?"
      answer = gets.strip.chomp
      review = Review.find_by(restaurant: answer)
      aReview = Review.update(restaurant: review)
      puts "What restaurant review name do you want for updating?"
      answer2 = gets.strip.chomp
      aReview.update(name: answer2)

    end
  end
