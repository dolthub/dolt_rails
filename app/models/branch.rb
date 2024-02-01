class Branch < ApplicationRecord
  self.primary_key = 'name'
  self.table_name  = 'dolt_branches'
end
