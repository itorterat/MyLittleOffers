class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments
    add_column :comments, :content, :string
    add_column :comments, :user_id, :integer
    add_column :comments, :offer_id, :integer
  end
end
