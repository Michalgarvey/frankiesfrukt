class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  validates :body, presence: true
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: { only_integer: true }

    def reviews
      $redis.get("comment:#{id}") # this is equivalent to 'GET product:1'
    end

    def reviewed!
      $redis.incby("comment:#{id}") # this is equivalent to 'INC product:1'
    end


end
