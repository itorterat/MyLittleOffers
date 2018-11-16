class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :content, presence: {
    message: "Un message doit être renseigné."
  }
end
