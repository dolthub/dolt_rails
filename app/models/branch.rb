class Branch < ApplicationRecord
  self.primary_key = 'name'
  self.table_name  = 'dolt_branches'

  def save
    branch_name = self.name
    ActiveRecord::Base.connection.execute("CALL DOLT_BRANCH('" + branch_name + "')")
  end

  def destroy
    branch_name = self.name
    ActiveRecord::Base.connection.execute("CALL DOLT_BRANCH('-D', '" + branch_name + "')")
  end

  def delete
    branch_name = self.name
    ActiveRecord::Base.connection.execute("CALL DOLT_BRANCH('-D', '" + branch_name + "')")
  end
end
