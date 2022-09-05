class Tweet < ApplicationRecord
    belongs_to :user
    has_many :favorites


    
    # @tweet.favoritesの中に、引数で送られたuserのidがあるかどうか？
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
