class Note
  include Mongoid::Document
  
  field :title
  field :content
  field :star, type: Boolean, default: false

  belongs_to :category

  default_scope where(star: false).asc(:title)

  scope :starred, where(star: true)

  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) if name.present?
  end
end
