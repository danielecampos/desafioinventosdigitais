class Projeto < ApplicationRecord
  belongs_to :user
  has_many :bugs
end
