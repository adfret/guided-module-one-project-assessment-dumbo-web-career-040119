class User < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, through: :reviews

  # attr_accessor :name
  #
  def update_user_name(new_name)
     self.update(:name => new_name)
  end

end
