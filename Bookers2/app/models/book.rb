class Book < ApplicationRecord

  # validates :title, {presence: true}
  # validates :body, {presence: true, lengh: {maximum: 200}}

  belongs_to :user

end
