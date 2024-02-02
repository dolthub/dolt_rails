class DoltBranchSelector
  def initialize(app)
    @app = app
  end
  
  def call(env)
    ActiveRecord::Base.connection.execute("CALL DOLT_CHECKOUT('test')")
    @app.call(env)
  end
end
