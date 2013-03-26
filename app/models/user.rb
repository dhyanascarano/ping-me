class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:twitter]
  
  attr_accessible :provider, :uid, :email
    
  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    User.where({
      :provider => auth.provider,
      :uid => auth.uid
    }).first || User.create({
      :provider => auth.provider,
      :uid => auth.uid
    })
  end
end
