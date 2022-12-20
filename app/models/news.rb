class News < ApplicationRecord
  belongs_to :channel

  validates :title, presence: true, length: { minimum: 3 }
  validates :link, presence: true, format: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :description, presence: true
  validates :pubdate, presence: true, numericality: { only_integer: true }
  validates :channel, presence: true
end
