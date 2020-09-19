class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end

# t.string   "title"
# t.string   "category"
# t.text     "content"
