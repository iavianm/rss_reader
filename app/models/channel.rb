class Channel < ApplicationRecord
  has_many :news, dependent: :destroy
end
