class Channel < ApplicationRecord
  has_many :news, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :url, presence: true, uniqueness: true,
                  format: /\A(http|https):\/\/[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix, http_url: true
end
