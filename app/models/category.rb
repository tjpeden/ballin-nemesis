class Category
  include Mongoid::Document

  field :name

  has_many :notes

  default_scope asc(:name)
end
