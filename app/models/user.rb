class User < ActiveRecord::Base
  validates :provider, :uid, presence: true

  def self.from_omniauth(auth_hash)
    find_or_create_by(provider: auth_hash.provider, uid: auth_hash.uid) do |user|
      user.name = auth_hash.info.name
      user.image = auth_hash.info.image
    end
  end
end
