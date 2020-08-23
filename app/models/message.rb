class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum:255 }
  #presence :空のデータを許可するかどうか true:許可しない
  validates :title, presence: true, length: { maximum: 255 }
  end
