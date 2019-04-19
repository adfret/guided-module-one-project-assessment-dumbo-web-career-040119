class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant



  def self.display
    restaurant_names = Review.all.map do |review|
      Restaurant.find_by(id: review.restaurant_id).name
    end

    restaurant_names = restaurant_names.sample(4)
    # binding.pry
    v = ''
    restaurant_names.each.with_index do |restaurant, i|
      v = "#{i+1}: #{restaurant}"
    end
     v
  end

end
