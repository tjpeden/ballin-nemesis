class Note
  include Mongoid::Document
  
  field :title
  field :content
  field :star, type: Boolean

  belongs_to :category

  default_scope asc(:title)

  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) if name.present?
  end
end
