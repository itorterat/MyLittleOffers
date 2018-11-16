class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers
    add_column :offers, :title, :string
    add_column :offers, :content, :string
    add_column :offers, :state, :string
    change_column_default(:offers, :state, 'waiting')
    add_column :offers, :price, :float
    add_column :offers, :user_id, :integer
  end
end
