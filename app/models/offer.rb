class Offer < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: {
    message: I18n.t('.error_title_offer')
  }

  validates :content, presence: {
    message: I18n.t('.error_content_offer')
  }

  validates :price, presence: {
    message: I18n.t('.error_price_offer')
  }
end
