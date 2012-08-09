class User
  include Mongoid::Document

  field :provider
  field :uid
  field :name
  field :email
  field :photo

  def self.from_omniauth(auth)
    where(auth.slice('provider', 'uid')).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.photo = auth['info']['image']
    end
  end
end
