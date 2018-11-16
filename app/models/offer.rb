class Offer < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: {
    message: "Le titre doit être renseigné."
  }

  validates :content, presence: {
    message: "La description doit être renseignée."
  }

  validates :price, presence: {
    message: "Le prix doit être renseigné."
  }
end
