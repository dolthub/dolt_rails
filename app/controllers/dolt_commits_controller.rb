class DoltCommitsController < ApplicationController
  def index
    @dolt_commits = DoltCommit.all
  end
end
