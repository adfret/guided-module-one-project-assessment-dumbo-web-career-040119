class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def percentile
    array = Restaurant.all.map{|i|i.food_type}
    # (array.count(self.food_type)/array.count).to_f * 100

    avg = (array.count(self.food_type).to_f)/  array.length
    # dividend/(array.sum)
    avrg= avg.to_f * 100
    p "This restaurant's food type is in the #{avrg} percentile of that of all restaurants in this database."
  end

    def self.display
      display_variable = ''
      display_variable = self.all.map{|restaurant| restaurant.food_type}
      display_variable_2 = display_variable.uniq

      display = ''
      #I have an error with displaying the reciever when I dont want to with this method(call). This below method is deprecated:
      # display = display_variable_2.each_with_index do |food, i|
      #   p "#{i+1}: #{food} foods!"
      # end
      i,b = 0, 1
      while i < display_variable_2.length
        p "#{b}: #{display_variable_2[i]} foods!"
        i+=1
        b+=1
      end
    end


end
