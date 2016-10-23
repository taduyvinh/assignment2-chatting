class User < ApplicationRecord
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    has_secure_password
    
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user

    def incoming_messages
        Message.where(recipient_id: id)
    end

    def sent_messages
        Message.where(sender_id: id)
    end

    def to_s
        name
    end
end
