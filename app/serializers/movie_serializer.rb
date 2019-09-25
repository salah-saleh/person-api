class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :rating
  has_many :categories, serializer: CategorySerializer
end
