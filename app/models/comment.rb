class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article

  after_commit :dolt_commit

  private
  def dolt_commit
    ActiveRecord::Base.connection.execute("CALL DOLT_COMMIT('-am', 'Changed a Comment')")
  end
end
