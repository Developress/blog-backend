class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :with_categories, -> {includes(:category)}
  scope :with_users, -> {includes(:user)}
  scope :search_by_starts_with, -> (title) { where("title like ?", "#{title}%")}

  def append_category_and_user
    as_json.merge({username: self.user.username,
                   category: self.category.name})
  end

  validates :title, :text, :user_id, :category_id, presence: true
  validates :title, length: { within: 5..50 }
end
