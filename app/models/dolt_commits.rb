class DoltCommit < ApplicationRecord
  self.primary_key = 'commit_hash'
  self.table_name  = 'dolt_log'
end
