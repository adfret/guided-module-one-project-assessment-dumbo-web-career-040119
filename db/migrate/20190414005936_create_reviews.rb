class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :restaurant
      # t.integer :user_id
      # t.integer :rest_id
      t.integer :rating
    end
  end
end
