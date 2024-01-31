class Article < ApplicationRecord
  include Visible
  
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  after_commit :dolt_commit

  private
  def dolt_commit
    ActiveRecord::Base.connection.execute("CALL DOLT_COMMIT('-am', 'Changed an Article')")
  end
end
